import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/authentication.dart';
import 'package:flutter_project/screens/goal.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  String email;
  String password;
  String altura;
  String peso;
  String idade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 39, 39, 39),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Cadastro',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // uma introdução para apresentar ao usuário o aplicativo
            const Text(
              'Olá, bem vindo ao nosso aplicativo. Para começar, precisamos que você preencha os campos abaixo.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
            const Text(
              'Sinta-se a vontade para falar seu peso, altura, idade.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
            Expanded(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Usuário',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: 'Usuário',
                          hintStyle: TextStyle(
                              fontSize: 10.0,
                              color: Color.fromARGB(164, 255, 255, 255)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value?.isEmpty == null) {
                            return 'Usuário inválido';
                          }
                        },
                        onSaved: (val) {
                          email = val;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: 'Senha',
                          hintStyle: TextStyle(
                              fontSize: 10.0,
                              color: Color.fromARGB(164, 255, 255, 255)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value?.isEmpty == null) {
                            return 'Senha inválida';
                          }
                        },
                        onSaved: (val) {
                          password = val;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Altura',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: 'Altura',
                          hintStyle: TextStyle(
                              fontSize: 10.0,
                              color: Color.fromARGB(164, 255, 255, 255)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value?.isEmpty == null) {
                            return 'Altura inválida';
                          }
                        },
                        onSaved: (val) {
                          altura = val;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Peso',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: 'Peso',
                          hintStyle: TextStyle(
                              fontSize: 10.0,
                              color: Color.fromARGB(164, 255, 255, 255)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value?.isEmpty == null) {
                            return 'Peso inválido';
                          }
                        },
                        onSaved: (val) {
                          peso = val;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Idade',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: 'Idade',
                          hintStyle: TextStyle(
                              fontSize: 10.0,
                              color: Color.fromARGB(164, 255, 255, 255)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value?.isEmpty == null) {
                            return 'Idade inválida';
                          }
                        },
                        onSaved: (val) {
                          idade = val;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      //botão para voltar a tela anterior
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Voltar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromARGB(64, 236, 235, 240),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();

                                  AuthenticationHelper()
                                      .signUp(email: email, password: password)
                                      .then((result) {
                                    if (result['success']) {
                                      _users.add({
                                        'email': email,
                                        'password': password,
                                        'altura': altura,
                                        'peso': peso,
                                        'idade': idade,
                                      });
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const GoalWidget()));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          result['message'],
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ));
                                    }
                                  });
                                }
                              },
                              child: const Text(
                                'Cadastrar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromARGB(255, 104, 66, 255),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ])
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
