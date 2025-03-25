import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voy/pages/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //timer of 2 seconds
    Timer(Duration(seconds: 2), ()async{
      //navigate to main screen after the timer
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context)=>MainScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    //content of splash screen
    return Scaffold(
      backgroundColor: Color(0XFF191919),
      body: Center(
          child: SvgPicture.asset(
              "lib/assets/voy_logo_2.svg",
          )

          )
      );

  }
}
