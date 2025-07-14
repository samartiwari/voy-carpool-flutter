import 'package:flutter/material.dart';
import 'package:voy/pages/register_page.dart';
import 'package:voy/widgets/my_button.dart';
import 'package:voy/widgets/my_text_field.dart';
import 'package:voy/widgets/my_textfield_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //textfield controllers here
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF191919),
      appBar: AppBar(
        backgroundColor: Color(0XFF191919),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Log in",
          style: TextStyle(
              fontSize: 30,
              color: Colors.white
          ),
        )
      ),
      body: Column(
        children: [
          SizedBox(
            height: 180,
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
                  MyTextfieldTitle(text: "Email"),

                  //contain text field for email
                  MyTextField(hintText: "Enter your Email",myController: emailController,),

                  //password text
                  MyTextfieldTitle(text: "Password"),

                  //password text field
                  MyTextField(hintText: "Enter your Password",myController: passwordController,),

                  //forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20,top: 10),
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //sized box between forgot password and login button
                  const SizedBox(
                    height: 80,
                  ),

                  //login button
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20,bottom: 30),
                    child: MyButton(
                        textInButton: "Login",
                        onTap: (){}
                    ),
                  ),

                  //dont have an account text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //normal text
                      Text(
                        "Don't have an account? ",
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
                          "Register instead",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0XFF7E60BF),
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
    );
  }
}
