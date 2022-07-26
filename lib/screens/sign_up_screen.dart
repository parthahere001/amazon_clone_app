import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:niel/screens/sign_in_screen.dart';

import '../resources/authentication.dart';
import '../utils/color_themes.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';
import '../widget/custom_main_button.dart';
import '../widget/text_field_widget.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    passwordController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(amazonLogo,
                    height: screenSize.height*0.10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: screenSize.height * 0.7,
                        child: FittedBox(
                          child: Container(
                            height: screenSize.height * 0.85,
                            width: screenSize.width * 0.8,
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1)
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [ const Text("Sign-Up", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 33),
                              ),
                                TextFieldWidget(title: "Name", controller: nameController, obscureText: false, hintText: "Enter Your Name",),
                                TextFieldWidget(title: "Address", controller: addressController, obscureText: false, hintText: "Enter Your Address",),
                                TextFieldWidget(title: "Email", controller: emailController, obscureText: false, hintText: "Enter Your Email",),
                                TextFieldWidget(title: "Password", controller: passwordController, obscureText: true, hintText: "Enter Your Password",),
                                Align(
                                  alignment: Alignment.center,
                                  child: CustomMainButton(color: yellowColor, isLoading: isLoading, onPressed: () async {
                                    setState(() {
                                      isLoading=true;
                                    });
                                    String output = await authenticationMethods.signUpUser(
                                        name: nameController.text,
                                        address: addressController.text,
                                        email: emailController.text,
                                        password: passwordController.text);
                                    setState(() {
                                      isLoading=false;
                                    });
                                    if (output=="success"){
                                      //Functions
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> SignInScreen()));
                                    }
                                    else
                                      {utils.showSnackBar(context, output);
                                        //Error Feedback
                                      }

                                  },
                                    child: const Text("Sign-Up", style: TextStyle(letterSpacing: 0.6, color: Colors.black),),),),

                              ],


                            ) ,


                          ),
                        ),
                      ),

                    ],

                  ),
                  CustomMainButton(color: Colors.grey[400]!, isLoading: false, onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return const SignInScreen();
                    }));
                  }, child: const Text("Back", style: TextStyle(letterSpacing: 0.6, color: Colors.black),)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
