import 'package:flutter/material.dart';
import 'package:voy/features/profile/ui/profile_rating_widget.dart';

class ProfileTopDetails extends StatelessWidget {
  final String? profilePhotoPath;
  final String fullName;
  final double ratingAsDriver;
  final double ratingAsPassenger;
  final int completedRidesAsDriver;
  final int completedRidesAsPassenger;

  const ProfileTopDetails({
    super.key,
    required this.profilePhotoPath,
    required this.fullName,
    required this.completedRidesAsDriver,
    required this.completedRidesAsPassenger,
    required this.ratingAsDriver,
    required this.ratingAsPassenger
  });

  double _overallRating(){
    double result = ((ratingAsDriver*completedRidesAsDriver)
        +(ratingAsPassenger*completedRidesAsPassenger))/(completedRidesAsDriver
    +completedRidesAsPassenger);
    return (result * 10).roundToDouble() / 10;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0XFF4F4F4F),
                borderRadius: BorderRadius.circular(16)
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                        height : 80,
                        width: 80,
                        child: profilePhotoPath!=null
                            ?Image.asset(
                          profilePhotoPath.toString(),
                          fit: BoxFit.cover,
                        )
                            :Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white
                          ),
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: Color(0XFF4F4F4F),
                          ),
                        )
                    ),
                  ),
                  Text(
                    fullName!=""
                        ? fullName
                        : "Guest user",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),


          Positioned(
              top: 170,
              left: 35,
              right: 35,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 90,
                decoration: BoxDecoration(
                    color: Color(0XFFD1D1D1),
                    borderRadius: BorderRadius.circular(16)
                ),

                //Ratings area
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileRatingWidget(
                      rating: ratingAsDriver,
                      bottomText: "As Host",
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    ProfileRatingWidget(
                      rating: _overallRating(),
                      bottomText: "Ratings",
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    ProfileRatingWidget(
                      rating: ratingAsPassenger,
                      bottomText: "As Guest",
                    ),

                  ],
                ),

              )
          ),

          Positioned(
              right: 15,
              top: 15,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: Color(0XFF191919),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              )
          ),
        ],
      ),
    );
  }
}
