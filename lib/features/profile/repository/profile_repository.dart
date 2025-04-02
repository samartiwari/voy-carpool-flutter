import 'dart:async';
import '../data/model/profile_model.dart';
import '../mock/mock_api_request.dart';

class ProfileRepository {
  final ProfileApiService apiService;

  // Constructor to inject the API service
  ProfileRepository({required this.apiService});

  // Function to fetch the profile from the API
  Future<ProfileModel> getProfile() async {
    try {
      // Fetch raw data from API service
      final jsonData = await apiService.fetchProfile();

      // Convert the raw JSON data into a ProfileModel
      return ProfileModel.fromJson(jsonData);
    } catch (e) {
      // Handle any errors that occur during the API call
      throw Exception("Error fetching profile: ${e.toString()}");
    }
  }
}
