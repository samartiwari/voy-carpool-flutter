import 'package:voy/models/user_model.dart';
import 'mock_data.dart';


class MockServices {
  Future<UserModel> getUsers() async {
    await Future.delayed(Duration(seconds: 1)); // Corrected delay
    return mockUsers[1]; // Corrected reference to mock users
  }
}
