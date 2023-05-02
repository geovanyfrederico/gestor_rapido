import 'dart:developer';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import '../../core/utils/snackbar_helper.dart';
import '../../models/database_helper.dart';
class RecuperarPinController{
  final telefone = TextEditingController();
  final codigo = TextEditingController();
  late  String codigoEnviado = '';

// Gera um código numérico aleatório de 4 dígitos
  String codigoAleatorio() {
    Random random = Random();
    int randomNumber = random.nextInt(9000) + 1000;
    return randomNumber.toString();
  }
  bool formularioValido(context){
    if(telefone.value.text.isEmpty || telefone.value.text.length != 9){
      SnackbarHelper.error(context,"Insira um numero de telefone valido.");
      return false;
    }
    return true;
  }
  Future<bool> enviarCodigo(BuildContext context) async {
    // Verificar se inseriu um numero
    if(!formularioValido(context)){
      return false;
    }

    // Verificar se existe um telefone na base de dados
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> results = await db.query(
      'usuario',
      where: "telefone = ?",
      whereArgs: [telefone.value.text],
    );
    // Telefone não existe
    if (results.isEmpty) {
      SnackbarHelper.error(context,"Este telefone não existe.");
      return false;
    }
    // Enviar o codigo
    final foiEnviado =  await enviarCodigoApi();

    if(foiEnviado){
      SnackbarHelper.success(context,"Código de recuperação enviado.");
    }else{
      SnackbarHelper.error(context,"Erro ao enviar o código de recuperação.");
    }
    return foiEnviado;
  }
  Future<bool> enviarCodigoApi() async {
    codigoEnviado = codigoAleatorio();
    String message = 'O código de recuperação é: $codigoEnviado';
    String msisdn = '244'+telefone.value.text;
    String sender = 'GR';
    String token = 'pPsQUeJqQcaRH5vdAj2fs7NxqSLSVNOhGh5VRFbz16ovRUSWvwGp-flEBGIInimC';
    String url = 'https://gatewayapi.com/rest/mtsms?'
        'message=$message&'
        'recipients.0.msisdn=$msisdn&'
        'sender=$sender&'
        'token=$token&'
        'encoding=UCS2';

    return await http.get(Uri.parse(url))
        .then((response) {
      if (response.statusCode == 200) {
        // A resposta foi bem sucedida
        //  print(response.body.toString());
        return true;
      } else {
        // A resposta não foi bem sucedida
        // print('Erro: ${response.statusCode}');
        return false;
      }
    })
        .catchError((error) {
      // Houve um erro ao fazer a requisição
      // print('Erro: $error');
      return false;
    });
  }

  verificarCodigo(context) {
    // Verfica se o codigo de recuperação é valido
    if(codigo.value.text.isEmpty || codigo.value.text.length != 4){
      SnackbarHelper.error(context,"Insira um código de recuperação valido!");
      return false;
    }
    // Verfica se o codigo de recuperação é o mesmo
    if(codigo.value.text != codigoEnviado){
      SnackbarHelper.error(context,"Código de verificacao incorrecto.");
      return false;
    }
    SnackbarHelper.success(context,"Successo.");
    return true;
  }
}

class RecuperadoPinController{
  final novoPin = TextEditingController();
  final novoPinConfirmar = TextEditingController();
  late  String telefoneRecuperado = '';

  bool formularioValido(context){
    if(novoPin.value.text.isEmpty || novoPin.value.text.length != 4  ){
      SnackbarHelper.error(context,"Pin invalido.");
      return false;
    }

    if(novoPinConfirmar.value.text.isEmpty || novoPinConfirmar.value.text.length != 4){
      SnackbarHelper.error(context,"Confirmação de pin invalido.");
      return false;
    }

    if(novoPin.value.text != novoPinConfirmar.value.text){
      SnackbarHelper.error(context,"Pin e confirmação do pin são diferentes");
      return false;
    }

    return true;
  }
  Future<bool> mudarPin(BuildContext context, String telefone) async {
    // Verificar se inseriu um numero
    if(!formularioValido(context)){
      return false;
    }
    // Verificar se existe um telefone na base de dados
    Database db = await DatabaseHelper.instance.database;

    int foiAtualizado = await db.update('usuario', {'pin': novoPin.value.text, }, where: "telefone = ?", whereArgs: [telefone]);

    if(foiAtualizado > 0) {
      enviarMensagemDePinAlterado();
      SnackbarHelper.success(context, "PIN alterado.");
      return true;
    }
    SnackbarHelper.error(context,"Erro ao alterar o pin tente novamente.");
    // Enviar o codigo
    return false;
  }
  Future<bool> enviarMensagemDePinAlterado() async {
    String message = 'Seu PIN foi alterado';
    String msisdn = '244'+telefoneRecuperado;
    String sender = 'GR';
    String token = 'pPsQUeJqQcaRH5vdAj2fs7NxqSLSVNOhGh5VRFbz16ovRUSWvwGp-flEBGIInimC';
    String url = 'https://gatewayapi.com/rest/mtsms?'
        'message=$message&'
        'recipients.0.msisdn=$msisdn&'
        'sender=$sender&'
        'token=$token&'
        'encoding=UCS2';

    return await http.get(Uri.parse(url))
        .then((response) {
      if (response.statusCode == 200) {
        // A resposta foi bem sucedida
        //  print(response.body.toString());
        return true;
      } else {
        // A resposta não foi bem sucedida
        // print('Erro: ${response.statusCode}');
        return false;
      }
    })
        .catchError((error) {
      // Houve um erro ao fazer a requisição
      // print('Erro: $error');
      return false;
    });
  }
}