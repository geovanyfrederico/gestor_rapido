import 'package:http/http.dart' as http;
class SMS {
  static Future<bool> send(String telefone, String mensagem) async {
    String message = mensagem;
    String msisdn = '244'+telefone;
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
    }).catchError((error) {
      // Houve um erro ao fazer a requisição
      // print('Erro: $error');
      return false;
    });
  }


}
