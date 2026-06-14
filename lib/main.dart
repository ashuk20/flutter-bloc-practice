import 'package:bloc_practice/api_example/view/user_page.dart';
import 'package:bloc_practice/counter/view/counter_page.dart';
import 'package:bloc_practice/login/view/login_page.dart';
import 'package:bloc_practice/signup/view/signup_page.dart';
import 'package:bloc_practice/to_do/view/todo_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Practice',
      debugShowCheckedModeBanner: false,
      home: const UserPage(),
    );
  }
}
