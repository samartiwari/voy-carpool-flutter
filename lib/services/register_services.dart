import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:voy/models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:voy/pages/verify_email_page.dart';

class RegisterServices {
  String BASE_URL = "http://10.0.2.2:8000/api/auth/register/";

  Future<void> registerUser(RegisterModel userData,BuildContext context) async{

    Map<String, String> requestBody = {
      "email": userData.email,
      "password": userData.password,
      "confirm_password": userData.confirmPassword,
      "phone_number": userData.phone,
    };

    try {
      final response = await http.post(
        Uri.parse(BASE_URL),
        headers: {
          "Content-Type": "application/json",  // ✅ Correct content type
          "Accept": "application/json",
        },
        body: jsonEncode(requestBody), // Convert Map to JSON
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if(response.statusCode==201){
        print("user_id: "+responseBody["registration_status"]["user_id"].toString());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context)=>VerifyEmailPage(
              userID: responseBody["registration_status"]["user_id"],
        )));
      }
      else {
        print(responseBody["errors"]);
        print(responseBody["message"]);
        print("status code: " + response.statusCode.toString());
      }
    } catch (e) {
      print("⚠️ Exception: $e");
    }
  }

}
