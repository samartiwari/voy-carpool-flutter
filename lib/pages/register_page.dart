import 'package:flutter/material.dart';
import 'package:voy/models/register_model.dart';
import 'package:voy/pages/login_page.dart';
import 'package:voy/services/register_services.dart';
import 'package:voy/widgets/my_textfield_title.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //all the controllers for text spaces
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //instance of register services
  RegisterServices registerServices = RegisterServices();

  int? userID;

  //sign up button function
  void signUp() async{
    RegisterModel registerModel = RegisterModel(
        phone: phoneNumberController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text
    );
    await registerServices.registerUser(registerModel,context);
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
                  "Sign up",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: 10,
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

                  //contain phone number text
                  MyTextfieldTitle(text: "Phone Number"),

                  //contain text field for phone number
                  MyTextField(prefixText: "+91",myController: phoneNumberController,),

                  //email text
                  MyTextfieldTitle(text: "Email"),

                  //email text field
                  MyTextField(hintText: "Enter your Email",myController: emailController,),

                  //password text
                  MyTextfieldTitle(text: "Password"),

                  //password text field
                  MyTextField(hintText: "Password",myController: passwordController,),

                  //confirm password text
                  MyTextfieldTitle(text: "Confirm your Password"),

                  //confirm password text field
                  MyTextField(hintText: "Confirm your Password",myController: confirmPasswordController,),

                  //login button
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20,bottom: 15,top: 50),
                    child: MyButton(
                        textInButton: "Sign up",
                        onTap: signUp
                    ),
                  ),

                  //don't have an account text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //normal text
                      Text(
                        "Already a member? ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context)=>LoginPage()));
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0XFF7E60BF),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
