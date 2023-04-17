import 'package:get/get_connect/http/src/response/response.dart';
class SmsService{
  static Future<bool> send(String numero, String mensagem) async {
    final String postsURL = """
    http://panel.smspm.com/gateway/52248aec022c6d53eabe30/api.v1/send?
    phone=$numero
    &sender=GR
    &message=$mensagem
    &output=json
    """;
    return true;
  }
}
