import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voy/features/profile/bloc/profile_bloc.dart';
import 'package:voy/features/profile/ui/profile_top_details.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // Dispatch the event to load the profile when the page is initialized
    BlocProvider.of<ProfileBloc>(context).add(ProfileInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF191919),
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0XFF191919),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        buildWhen: (previous, current) => current is! ProfileActionState,
        listenWhen: (previous, current) => current is ProfileActionState,
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoadedSuccessState) {
            final successState = state as ProfileLoadedSuccessState;
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  ProfileTopDetails(
                    profilePhotoPath: successState.profile.profilePhoto,
                    fullName: successState.profile.fullName,
                    ratingAsDriver: successState.profile.ratingAsDriver,
                    ratingAsPassenger: successState.profile.ratingAsPassenger,
                    completedRidesAsDriver: successState.profile.completedRidesAsDriver,
                    completedRidesAsPassenger: successState.profile.completedRidesAsPassenger
                  ),

                  SizedBox(height: 90,),


                  //verification
                  ListTile(
                    title: Text(
                      "Verification",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                      ),
                    ),
                    leading: Icon(
                      Icons.newspaper,
                      color: Colors.white,
                    ),
                    onTap: (){},
                  ),

                  //my contribution
                  ListTile(
                    title: Text(
                      "My Contribution",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),
                    ),
                    leading: Icon(
                      Icons.eco_outlined,
                      color: Colors.white,
                    ),
                    onTap: (){},
                  ),

                  //invite friends
                  ListTile(
                    title: Text(
                      "Invite Friends",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),
                    ),
                    leading: Icon(
                      Icons.wallet_giftcard_sharp,
                      color: Colors.white,
                    ),
                    onTap: (){},
                  ),

                  //my rides
                  ListTile(
                    title: Text(
                      "My Rides",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),
                    ),
                    leading: Icon(
                      Icons.car_crash,
                      color: Colors.white,
                    ),
                    onTap: (){},
                  ),

                  //support
                  ListTile(
                    title: Text(
                      "Support",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),
                    ),
                    leading: Icon(
                      Icons.handshake_outlined,
                      color: Colors.white,
                    ),
                    onTap: (){},
                  ),

                  //setting
                  ListTile(
                    title: Text(
                      "Setting",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),
                    ),
                    leading: Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    ),
                    onTap: (){},
                  ),



                ],
              )
            );
          } else {
            return Text("Unable to reach the servers!");
          }
        },
        listener: (context, state) {
          // Handle ProfileActionState if needed (e.g., navigation, etc.)
        },
      ),
    );
  }
}
