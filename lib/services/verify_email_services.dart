import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:voy/pages/verify_phone_page.dart';

class VerifyEmailServices {
  String BASE_URL = "http://10.0.2.2:8000/api/auth/verify-email/";

  Future<void> verifyEmailOfUser (int userID, String emailOtp,BuildContext context) async{
    Map<String,dynamic> requestbody = {
      "user_id": userID,
      "email_otp": emailOtp
    };
    try {
      final response = await http.post(
        Uri.parse(BASE_URL),
        headers: {
          "Content-Type": "application/json",  // ✅ Correct content type
          "Accept": "application/json",
        },
        body: jsonEncode(requestbody), // Convert Map to JSON
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if(response.statusCode==200){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context)=>VerifyPhonePage(userID: userID,)
        )
        );
      }
      else {
        print(responseBody["errors"]);
        print(responseBody["message"]);
        print("status code: " + response.statusCode.toString());
        return null; // Return null if registration failed
      }
    } catch (e) {
      print("⚠️ Exception: $e");
    }

  }
}