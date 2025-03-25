import 'package:flutter/material.dart';
import 'package:voy/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //show splash screen
      home: SplashScreen(),
    );
  }
}
