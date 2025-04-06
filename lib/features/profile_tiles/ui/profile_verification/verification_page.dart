import 'package:flutter/material.dart';
import 'package:voy/features/profile/data/model/profile_model.dart';
import 'package:voy/features/profile_tiles/ui/profile_verification/drivers_verification_page.dart';

class VerificationPage extends StatelessWidget {
  final ProfileModel profileModel;
  const VerificationPage({
    super.key,
    required this.profileModel
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF191919),
      appBar: AppBar(
        title: Text(
          "Vehicle Verification",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0XFF191919),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            GestureDetector(
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DriversVerificationPage(profileModel: profileModel)),
                );
              },
              child: Container(
                height: 73,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0XFF5D5D5D)
                  ),
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          //icon
                          Icon(
                            Icons.document_scanner_sharp,
                            color: Color(0XFF7E60BF),
                            size: 40,
                          ),
                          const SizedBox(width: 20,),
                          Text(
                            "Driver Verification",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),

                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),


            const SizedBox(height: 20,),
            Container(
              height: 73,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0XFF5D5D5D)
                  ),
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //icon
                        Icon(
                          Icons.car_crash,
                          color: Color(0XFF7E60BF),
                          size: 40,
                        ),
                        const SizedBox(width: 20,),
                        Text(
                          "Vehicle Details",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),

                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
