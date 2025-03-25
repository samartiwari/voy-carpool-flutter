class RegisterModel {
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final int? userID;
  RegisterModel({
    required this.phone,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.userID,
  });
}