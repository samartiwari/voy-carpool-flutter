import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voy/features/profile/data/model/profile_model.dart';
import 'package:voy/features/profile_tiles/bloc/profile_verification_bloc/drivers_verification_bloc.dart';

class DriversVerificationPage extends StatefulWidget {
  final ProfileModel profileModel;
  const DriversVerificationPage({
    super.key,
    required this.profileModel
  });

  @override
  State<DriversVerificationPage> createState() => _DriversVerificationPageState();
}

class _DriversVerificationPageState extends State<DriversVerificationPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DriversVerificationBloc>(context).add(
        DriversVerificationInitialEvent(profileModel: widget.profileModel),
      );
    });
    print(widget.profileModel.driverLicenseImage);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF191919),
      appBar: AppBar(
        backgroundColor: Color(0XFF191919),
        title: Text(
          "Drivers Verification",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: BlocConsumer<DriversVerificationBloc,DriversVerificationState>(
        buildWhen:(previous,current)=> current is !DriversVerificationActionState,
        listenWhen:(previous,current)=> current is DriversVerificationActionState,
        listener: (context,state){
        },
        builder: (context,state){
          if(state is DriversVerificationInitialState){
            final successState = state;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  //initial space
                  const SizedBox(height: 20,),

                  //text
                  const Text(
                    "Verify Your Driving License to Begin Offering Rides",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                    ),
                  ),

                  //spacing
                  const SizedBox(height: 25,),
                  
                  //text
                  const Text(
                    "Photo of your government ID is required to validate your identity",
                    style: TextStyle(
                        color: Color(0XFFB0B0B0),
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    ),
                  ),

                  //spacing
                  const SizedBox(height: 40,),

                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0XFF5D5D5D)
                        ),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15,bottom: 15),
                      child: Row(
                        children: [
                          //text
                          const Text(
                            "Driving License",
                            style: TextStyle(
                              color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                            ),
                          ),

                          //const spacing
                          const SizedBox(width: 30,),

                          //uploaded or not uploaded button
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: widget.profileModel.driverLicenseImage==null
                                  ?Color(0XFF454545)
                                    :Color(0XFF7E60BF)
                              ),
                              child: Center(
                                child: widget.profileModel.driverLicenseImage==null
                                    ?Text(
                                  "Not Uploaded",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white
                                  ),
                                )
                                    :Text(
                                  "Uploaded",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ),
                          ),
                          
                          //icon
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          )

                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }

          else{
            return SizedBox(height: 10,);
          }
    }

    )


    );
  }
}
