import 'package:voy/models/emmision_model.dart';
import 'package:voy/models/user_model.dart';
import 'mock_data.dart';


class MockServices {
  Future<UserModel> getUsers() async {
    await Future.delayed(Duration(seconds: 1)); // Corrected delay
    return mockUsers[0]; // Corrected reference to mock users
  }

  Future<EmissionModel> getEmission() async {
    await Future.delayed(Duration(seconds: 1));
    return mockEmission[3];
  }
}
