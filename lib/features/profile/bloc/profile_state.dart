// profile_state.dart
part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}
abstract class ProfileActionState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedSuccessState extends ProfileState {
  final ProfileModel profile;
  ProfileLoadedSuccessState({required this.profile});
}

class ProfileErrorState extends ProfileState {
  final String errorMessage;
  ProfileErrorState({required this.errorMessage});
}

//profile action state sub class
class ProfileNavigateToEditActionState extends ProfileActionState {}

class ProfileNavigateToVerificationActionState extends ProfileActionState {}

class ProfileNavigateToMyContributionActionState extends ProfileActionState {}

class ProfileNavigateToInviteFriendsActionState extends ProfileActionState {}

class ProfileNavigateToMyRidesActionState extends ProfileActionState {}

class ProfileNavigateToSupportActionState extends ProfileActionState {}

class ProfileNavigateToSettingActionState extends ProfileActionState {}

//redundant subclass
class ProfileInitialState extends ProfileState {}
