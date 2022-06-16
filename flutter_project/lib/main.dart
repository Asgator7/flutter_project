import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/goal.dart';
import 'package:flutter_project/screens/login.dart';
import 'package:flutter_project/screens/register.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDcZoXvzjx2pxHD42j5inBxAhZQk-JzKrM",
        appId: "1:36685958177:web:af2cf85e32bc603f4de760",
        messagingSenderId: "36685958177",
        projectId: "projeto-beleza-900db"),
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
