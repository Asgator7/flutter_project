import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/goal.dart';
import 'package:flutter_project/screens/login.dart';
import 'package:flutter_project/screens/register.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCdTj_UgrUzoZfEqp5NEnwrtmGgowmPl00",
        appId: "1:769322239350:web:df297b653e2c628daf2657",
        messagingSenderId: "769322239350",
        projectId: "projeto-d9103"),
  );
  runApp(
    MaterialApp(
      title: 'Flutter Navigator 1',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginWidget(),
        '/register': (context) => const RegisterWidget(),
        '/home': (context) => const GoalWidget(),
      },
    ),
  );
}
