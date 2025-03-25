import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String? hintText;
  String? prefixText;
  TextEditingController myController;
  MyTextField({
    super.key,
    this.prefixText,
    this.hintText,
    required this.myController
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
      child: TextField(
        controller: myController,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18
        ),
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          filled: true,
          fillColor: Color(0XFF606060),
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          prefixIcon: prefixText != null
            ?Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 10,),
              Text(
                prefixText!,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
              const SizedBox(width: 5,),
            ],
          )
              :null
        )
      ),
    );
  }
}
