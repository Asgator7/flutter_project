import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/login.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCdTj_UgrUzoZfEqp5NEnwrtmGgowmPl00",
        appId: "1:769322239350:web:df297b653e2c628daf2657",
        messagingSenderId: "769322239350",
        projectId: "projeto-d9103"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rotina de Exercicios',
      home: LoginWidget(),
    );
  }
}
