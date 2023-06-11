import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gr/features/entrar/entrar_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EntrarPage extends StatefulWidget {
  const EntrarPage({Key? key}) : super(key: key);

  @override
  _EntrarPageState createState() => _EntrarPageState();
}

class _EntrarPageState extends State<EntrarPage> {
  final EntrarController _controller = EntrarController();
  late SharedPreferences _prefs;
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  // Initialize shared preferences
  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    // Check if user has completed onboarding
    final hasCompletedOnboarding = _prefs.getBool('logado') ?? false;
    if (hasCompletedOnboarding) {
      Modular.to.navigate('/dashboard');
    }
  }

  Future<void> finalizarEntrar() async {
    await _prefs.setBool('logado', true);
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
                      padding: const EdgeInsets.only(bottom: 20),
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
                      padding: EdgeInsets.only(bottom: 0),
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
                            hintText: 'Pin',
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
                  Container(
                    height: 55,
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      child: TextButton(
                          onPressed: () {
                            Modular.to.navigate("/recuperar");
                          },
                          child: const Text("Esqueceu o pin?"),
                          style: TextButton.styleFrom(
                            primary: Colors.grey[600],
                            textStyle: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: SizedBox.expand(
                      child: ElevatedButton(
                          onPressed: () async => {
                                await _controller.entrar(context)
                                    ? finalizarEntrar()
                                    : false
                              },
                          child: const Text("Entrar"),
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
                          onPressed: () => Modular.to.navigate('/registar'),
                          child: const Text("Criar uma nova conta"),
                          style: TextButton.styleFrom(
                            primary: Colors.orange[300],
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
