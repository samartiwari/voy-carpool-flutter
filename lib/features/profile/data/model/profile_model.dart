class ProfileModel {
  final int id;
  final double ratingAsDriver;
  final double ratingAsPassenger;
  final String? gender;
  final String fullName;
  final String? profilePhoto;
  final String phone;
  final String email;
  final String? emergencyContact;
  final String? driverLicenseImage;
  final String? vehicleNumber;
  final String? vehicleModel;
  final int totalSeats;
  final int completedRidesAsDriver;
  final int completedRidesAsPassenger;

  ProfileModel({
    required this.id,
    required this.ratingAsDriver,
    required this.ratingAsPassenger,
    this.gender,
    required this.fullName,
    this.profilePhoto,
    required this.phone,
    required this.email,
    this.emergencyContact,
    this.driverLicenseImage,
    this.vehicleNumber,
    this.vehicleModel,
    required this.totalSeats,
    required this.completedRidesAsPassenger,
    required this.completedRidesAsDriver
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['user']['id'],
      ratingAsDriver: (json['user']['rating_as_driver'] as num).toDouble(),
      ratingAsPassenger: (json['user']['rating_as_passenger'] as num).toDouble(),
      gender: json['user']['gender'],
      fullName: json['user']['full_name'] ?? '',
      profilePhoto: json['user']['profile_photo'],
      phone: json['user']['phone_number'],
      email: json['user']['email'],
      emergencyContact: json['user']['emergency_contact_phone'],
      driverLicenseImage: json['user']['drivers_license_image'],
      vehicleNumber: json['user']['vehicle_number'],
      vehicleModel: json['user']['vehicle_model'],
      totalSeats: json['user']['total_seats'],
      completedRidesAsDriver: json['user']['completed_rides_as_driver'],
      completedRidesAsPassenger: json['user']['completed_rides_as_passenger']
    );
  }
}
