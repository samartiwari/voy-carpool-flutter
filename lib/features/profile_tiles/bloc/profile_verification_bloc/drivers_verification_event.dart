part of 'drivers_verification_bloc.dart';

@immutable
abstract class DriversVerificationEvent {}

class DriversVerificationInitialEvent extends DriversVerificationEvent {
  final ProfileModel profileModel;
  DriversVerificationInitialEvent({required this.profileModel});
}

class DriversVerificationToUploadingPageNavigationEvent extends DriversVerificationEvent {}

class DriversVerificationCapturePhotoEvent extends DriversVerificationEvent {}

class DriversVerificationGalleryUploadEvent extends DriversVerificationEvent {}

