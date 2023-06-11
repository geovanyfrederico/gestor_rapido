import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/registrar/registrar_controller.dart';

class RegistarPage extends StatefulWidget {
  const RegistarPage({Key? key}) : super(key: key);

  @override
  _RegistarPageState createState() => _RegistarPageState();
}

class _RegistarPageState extends State<RegistarPage> {
  final _controller = RegistarController();
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
  }
  
  Future<void> finalizarEntrar() async {
    Modular.to.navigate("/dashboard");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[10],
        body: Container(
          padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
          child: ListView(
            children: [
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/logo.png')),
              const Text(
                'GESTOR  RÁPIDO',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          controller: _controller.nomeDoUtilizador,

                          // Every single time the text changes in a
                          // TextField, this onChanged callback is called
                          // and it passes in the value.
                          //
                          // Set the text of your controller to
                          // to the next value.
                          decoration: const InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'Seu nome',
                            counterText: "",
                          ))),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      child: TextField(
                          keyboardType: TextInputType.phone,
                          maxLength: 9,
                          controller: _controller.telefone,
                          // Every single time the text changes in a
                          // TextField, this onChanged callback is called
                          // and it passes in the value.
                          //
                          // Set the text of your controller to
                          // to the next value.
                          decoration: const InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'Telefone',
                            counterText: "",
                          ))),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          controller: _controller.pin,
                          // Every single time the text changes in a
                          // TextField, this onChanged callback is called
                          // and it passes in the value.
                          //
                          // Set the text of your controller to
                          // to the next value.
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'PIN',
                            counterText: "",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          controller: _controller.nomeDaEmpresa,
                          // Every single time the text changes in a
                          // TextField, this onChanged callback is called
                          // and it passes in the value.
                          //
                          // Set the text of your controller to
                          // to the next value.
                          obscureText: false,
                          decoration: const InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'Nome da empresa',
                            counterText: "",
                          ))),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          controller: _controller.nif,
                          // Every single time the text changes in a
                          // TextField, this onChanged callback is called
                          // and it passes in the value.
                          //
                          // Set the text of your controller to
                          // to the next value.
                          obscureText: false,
                          decoration: const InputDecoration(
                            focusColor: Colors.orange,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2.0),
                            ),
                            border: InputBorder.none,
                            hintText: 'Nif',
                            counterText: "",
                          ))),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    margin: const EdgeInsetsDirectional.only(top: 5),
                    child: SizedBox.expand(
                      child: ElevatedButton(
                          onPressed: () async {
                            await _controller.registar(context)
                                ? Modular.to.navigate("/dashboard")
                                : false;
                          },
                          child: const Text("Registrar-se"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            textStyle: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsetsDirectional.only(top: 5),
                    alignment: Alignment.center,
                    child: SizedBox.expand(
                      child: TextButton(
                          onPressed: () {
                            Modular.to.navigate('entrar');
                          },
                          child: const Text("Já tens uma conta?"),
                          style: TextButton.styleFrom(
                            primary: Colors.orange,
                            textStyle: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
