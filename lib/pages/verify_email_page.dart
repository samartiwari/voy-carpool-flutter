import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voy/pages/register_page.dart';
import 'package:voy/services/verify_email_services.dart';
import 'package:voy/widgets/my_otp_box.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield_title.dart';

class VerifyEmailPage extends StatefulWidget {
  final int userID;
  const VerifyEmailPage({
    super.key,
    required this.userID
  });

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  //all controllers for otp
  TextEditingController controller0 = TextEditingController();

  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  TextEditingController controller4 = TextEditingController();

  TextEditingController controller5 = TextEditingController();

  VerifyEmailServices verifyEmailServices = VerifyEmailServices();

  verify(BuildContext context) async{
    String emailOtp =
            controller0.text+
            controller1.text+
            controller2.text+
            controller3.text+
            controller4.text+
            controller5.text;
    await verifyEmailServices.verifyEmailOfUser(widget.userID, emailOtp, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF191919),
      body: Column(
        children: [

          //top space
          SizedBox(height: 45,),

          //back button and title of page
          Padding(
            padding: EdgeInsets.all(40),
            child: Row(
              children: [
                Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 28
                ),
                //space between back button and login text
                const SizedBox(width: 15,),
                Text(
                  "Verify Email",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: 120,
          ),

          //light colored expanded box which contain every text fields
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0XFF252525),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //constant sized box at the starting
                  const SizedBox(height: 30,),

                  //contain email text
                  MyTextfieldTitle(text: "Enter OTP"),

                  const SizedBox(height: 30,),

                  //OTP text field
                  Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyOtpBox(myController: controller0,),
                          MyOtpBox(myController: controller1,),
                          MyOtpBox(myController: controller2,),
                          MyOtpBox(myController: controller3,),
                          MyOtpBox(myController: controller4,),
                          MyOtpBox(myController: controller5,),
                        ],
                      )
                  ),

                  //sized box between forgot password and login button
                  const SizedBox(
                    height: 80,
                  ),

                  //login button
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20,bottom: 10),
                    child: MyButton(
                        textInButton: "Verify",
                        onTap: ()=>verify(context),
                    ),
                  ),

                  //dont have an account text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //normal text
                      Text(
                        "Didn't receive any code? ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                        },
                        child: Text(
                          "Resend Code",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0XFF7E60BF),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0XFF7E60BF),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );;
  }
}
