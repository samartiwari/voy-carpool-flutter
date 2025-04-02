// profile_bloc.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../repository/profile_repository.dart';
import '/features/profile/data/model/profile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository}) : super(ProfileInitialState()) {
    on<ProfileInitialEvent>(_profileInitialEvent);
  }

  FutureOr<void> _profileInitialEvent(
      ProfileInitialEvent event, Emitter<ProfileState> emit)async {
    emit(ProfileLoadingState());
    ProfileModel profileModel = await profileRepository.getProfile();
    emit(ProfileLoadedSuccessState(profile: profileModel));
  }


}
