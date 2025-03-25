import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class VerifyPhoneServices {
  String BASE_URL = "http://10.0.2.2:8000/api/auth/verify-phone/";

  Future<void> verifyPhoneNumber (BuildContext context, int userID, String phoneOtp)async {
    Map<String,dynamic> requestBody = {
      "user_id": userID,
      "phone_otp": phoneOtp
    };

    try {
      final response = await http.post(
        Uri.parse(BASE_URL),
        headers: {
          "Content-Type": "application/json",  // ✅ Correct content type
          "Accept": "application/json",
        },
        body: jsonEncode(requestBody),
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if(response.statusCode==200 || response.statusCode==201){
        //go to main page with all the data from the response
      }
    }
    catch(e){
      print("⚠️ Exception: $e");
    }
  }
}