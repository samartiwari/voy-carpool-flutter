import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyOtpBox extends StatelessWidget {
  TextEditingController myController = TextEditingController();
  MyOtpBox({
    super.key,
    required this.myController
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 55,
      child: TextField(
        controller: myController,
        onChanged: (value){
          if (value.length==1){
            FocusScope.of(context).nextFocus();
          }
        },
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16)
          ),
          filled: true,
          fillColor: Color(0XFF606060),
        ),
      ),
    );
  }
}
