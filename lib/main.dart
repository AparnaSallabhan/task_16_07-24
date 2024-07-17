// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_16_07/view/login_screen/login_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(email: "",password: "",),
    );
  }
}