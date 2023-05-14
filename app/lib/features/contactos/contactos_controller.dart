import 'package:flutter/cupertino.dart';
import 'package:gr/core/constantes.dart';


class ContactosController  extends ChangeNotifier{
  int tab = 3;
  String titulo()  {
    if(tab == 0){
      return Constantes.clientes;
    }
    if(tab == 1){
      return Constantes.fornecedores;
    }
    return Constantes.contactos;
  }


}
