part of 'drivers_verification_bloc.dart';

@immutable
abstract class DriversVerificationState {}
abstract class DriversVerificationActionState extends DriversVerificationState {}

//returns initial screen with uploaded/non uploaded
class DriversVerificationInitialState extends DriversVerificationState {
  final ProfileModel? profileModel;
  DriversVerificationInitialState({required this.profileModel});

}
