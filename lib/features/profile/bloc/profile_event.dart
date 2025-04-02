part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

//initial fetching of data
class ProfileInitialEvent extends ProfileEvent {}

//edit profile button is clicked
class ProfileEditNavigationEvent extends ProfileEvent {}

//verification button is clicked from the menu
class ProfileVerificationNavigationEvent extends ProfileEvent {}

//my contribution button is clicked from the menu
class ProfileMyContributionNavigationEvent extends ProfileEvent {}

//invite friends button is clicked from the menu
class ProfileInviteFriendsNavigationEvent extends ProfileEvent {}

//my rides button is clicked from the menu
class ProfileMyRidesNavigationEvent extends ProfileEvent {}

//support button is clicked from the menu
class ProfileSupportNavigationEvent extends ProfileEvent {}

//setting button is clicked from the menu
class ProfileSettingNavigationEvent extends ProfileEvent {}
