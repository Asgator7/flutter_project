import 'package:flutter/material.dart';
import 'package:flutter_project/authentication.dart';
import 'package:flutter_project/screens/goal.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  State<LoginWidget> createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
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
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Insira um email válido';
                          }
                          return null;
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
                        obscureText: true,
                        validator: (String value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return 'Senha inválida';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          password = val;
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 104, 66, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text('Entrar'),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              AuthenticationHelper()
                                  .signIn(email: email, password: password)
                                  .then((result) {
                                if (result['success']) {
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
                        ),
                      ),
                      //fazer um link para caso não tenha cadastro
                      const Text(
                        'Ainda não tem cadastro?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 104, 66, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text('Cadastre-se'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                          // if (_formKey.currentState.validate()) {
                          //   Navigator.pushReplacementNamed(
                          //     context,
                          //     '/home',
                          //   );
                          // }
                        },
                      ),
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
