import 'package:flutter/material.dart';

class MyTextfieldTitle extends StatelessWidget {
  String text;
  MyTextfieldTitle({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
  }
}
