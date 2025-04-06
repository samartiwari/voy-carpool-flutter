import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:voy/features/profile/data/model/profile_model.dart';

part 'drivers_verification_event.dart';
part 'drivers_verification_state.dart';

class DriversVerificationBloc extends Bloc<DriversVerificationEvent, DriversVerificationState> {
  DriversVerificationBloc() : super(DriversVerificationInitialState(profileModel: null)) {
    //events functions declared here
    on<DriversVerificationInitialEvent>(driversVerificationInitialEvent);

  }

  //functions implemented here
  FutureOr<void> driversVerificationInitialEvent(
      DriversVerificationInitialEvent event, Emitter<DriversVerificationState> emit) async {
      if(event.profileModel.driverLicenseImage==null){
        emit(DriversVerificationInitialState(profileModel: event.profileModel));
      }
  }
}
