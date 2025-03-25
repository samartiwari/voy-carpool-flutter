import 'package:flutter/material.dart';

//code for resuable button
class MyButton extends StatelessWidget {
  String textInButton;
  VoidCallback onTap;
  MyButton({
    super.key,
    required this.textInButton,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, //function to be called when button is pressed
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0XFF7E60BF),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Center(
          child: Text(
            textInButton, //text displayed inside the button
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
