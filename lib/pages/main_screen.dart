import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:voy/features/profile/ui/profile_page.dart';
import 'package:voy/widgets/my_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  void buttonPressed(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context)=>ProfilePage()));
  }

  //requesting permission for location
  _requestLocationPermission() async{
    PermissionStatus locationPermission = await Permission.location.request();
  }

  @override

  //code which run after loading this page
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF191919),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "lib/assets/login_logo.svg",
            ),
            const SizedBox(
              height: 40
            ),
            SvgPicture.asset(
              "lib/assets/car1.svg",
            ),
            const SizedBox(
              height: 40
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: MyButton(
                textInButton: "Continue with email",
                onTap: buttonPressed,
              ),
            ),
            const SizedBox(
              height: 40
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "By Singing up you agree to our ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),
                ),
                 const Text(
                  "Terms of use",
                  style: TextStyle(
                    color: Color(0XFF7E60BF),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0XFF7E60BF),
                    fontSize: 16
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
