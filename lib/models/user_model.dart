class UserModel {
  final int id;
  final String email;
  final String phoneNumber;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? profilePhoto;
  final String? gender;
  final String? emergencyContactPhone;
  final bool emailVerified;
  final bool phoneVerified;
  final String createdAt;
  final String? driversLicenseImage;
  final bool isDriverVerified;
  final double ratingAsDriver;
  final double ratingAsPassenger;
  final String? vehicleNumber;
  final String? vehicleModel;
  final int completedRidesAsDriver;
  final int completedRidesAsPassenger;
  final int totalSeats;
  final String accessToken;
  final String refreshToken;

  const UserModel({
    required this.id,
    required this.email,
    required this.phoneNumber,
    this.firstName,
    this.lastName,
    this.fullName,
    this.profilePhoto,
    this.gender,
    this.emergencyContactPhone,
    required this.emailVerified,
    required this.phoneVerified,
    required this.createdAt,
    this.driversLicenseImage,
    required this.isDriverVerified,
    required this.ratingAsDriver,
    required this.ratingAsPassenger,
    this.vehicleNumber,
    this.vehicleModel,
    required this.completedRidesAsDriver,
    required this.completedRidesAsPassenger,
    required this.totalSeats,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user']['id'],
      email: json['user']['email'],
      phoneNumber: json['user']['phone_number'],
      firstName: json['user']['first_name'],
      lastName: json['user']['last_name'],
      fullName: json['user']['full_name'],
      profilePhoto: json['user']['profile_photo'],
      gender: json['user']['gender'],
      emergencyContactPhone: json['user']['emergency_contact_phone'],
      emailVerified: json['user']['email_verified'],
      phoneVerified: json['user']['phone_verified'],
      createdAt: json['user']['created_at'],
      driversLicenseImage: json['user']['drivers_license_image'],
      isDriverVerified: json['user']['is_driver_verified'],
      ratingAsDriver: (json['user']['rating_as_driver'] as num).toDouble(),
      ratingAsPassenger: (json['user']['rating_as_passenger'] as num).toDouble(),
      vehicleNumber: json['user']['vehicle_number'],
      vehicleModel: json['user']['vehicle_model'],
      completedRidesAsDriver: json['user']['completed_rides_as_driver'],
      completedRidesAsPassenger: json['user']['completed_rides_as_passenger'],
      totalSeats: json['user']['total_seats'],
      accessToken: json['tokens']['access'],
      refreshToken: json['tokens']['refresh'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user": {
        "id": id,
        "email": email,
        "phone_number": phoneNumber,
        "first_name": firstName,
        "last_name": lastName,
        "full_name": fullName,
        "profile_photo": profilePhoto,
        "gender": gender,
        "emergency_contact_phone": emergencyContactPhone,
        "email_verified": emailVerified,
        "phone_verified": phoneVerified,
        "created_at": createdAt,
        "drivers_license_image": driversLicenseImage,
        "is_driver_verified": isDriverVerified,
        "rating_as_driver": ratingAsDriver,
        "rating_as_passenger": ratingAsPassenger,
        "vehicle_number": vehicleNumber,
        "vehicle_model": vehicleModel,
        "completed_rides_as_driver": completedRidesAsDriver,
        "completed_rides_as_passenger": completedRidesAsPassenger,
        "total_seats": totalSeats,
      },
      "tokens": {
        "access": accessToken,
        "refresh": refreshToken,
      },
    };
  }
}
