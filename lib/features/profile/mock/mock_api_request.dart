import 'dart:async';
import 'dart:math';
import 'mock_data.dart'; // Ensure this contains mockJsonData

class ProfileApiService {
  Future<Map<String, dynamic>> fetchProfile() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    // Pick a random JSON object from mockJsonData
    //final random = Random();
    return mockJsonData[1];
  }
}
