import 'package:flappy_dash/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flappy Dash",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
