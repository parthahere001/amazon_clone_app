import 'package:flutter/material.dart';
import 'package:niel/resources/authentication.dart';
import 'package:niel/screens/sign_up_screen.dart';
import 'package:niel/utils/color_themes.dart';
import 'package:niel/utils/constants.dart';
import 'package:niel/utils/utils.dart';
import 'package:niel/widget/text_field_widget.dart';
import 'package:niel/widget/custom_main_button.dart';
import '../resources/authentication.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
AuthenticationMethods authenticationMethods = AuthenticationMethods();
bool isLoading = false;



  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
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
                height: screenSize.height*0.085,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    height: screenSize.height * 0.6,
                    width: screenSize.width * 0.8,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1)
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ const Text("Sign-In", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 33),
                      ),
                      TextFieldWidget(title: "Email", controller: emailController, obscureText: false, hintText: "Enter Your Email",),
                        TextFieldWidget(title: "Password", controller: passwordController, obscureText: true, hintText: "Enter Your Password",),
                        Align(
                            alignment: Alignment.center,
                            child: CustomMainButton(color: yellowColor, isLoading: isLoading, onPressed: () async {
                              setState (() {
                                isLoading = true;
                              });
                             String output =  await AuthenticationMethods().signInUser(
                               email: emailController.text,
                               password: passwordController.text
                             );
                              setState (() {
                                isLoading = false;
                              });
                             if (output=="success"){
                               // Functions
                             }
                             else
                               {
                                 if (output.length<12) {
                                   utils.showSnackBar(context, output);
                                 }
                                 else {
                                   utils.showSnackBar(
                                       context, "Some error occured");
                                 }
                               }
                            },child: const Text("Sign-In", style: TextStyle(letterSpacing: 0.6, color: Colors.black),),),),

                      ],


                    ) ,


                  ),

                ],

              ),
              Row(
                children: [
                  Expanded(

                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("New to Amazon ?", style: TextStyle(color: Colors.grey),),
                  ),
                  Expanded(

                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              CustomMainButton(color: Colors.grey[400]!, isLoading: false, onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return const SignUpScreen();
                }),);
              }, child: const Text("Create an Amazon account", style: TextStyle(letterSpacing: 0.6, color: Colors.black),)),
            ],
          ),
    ),
    ),
        ),
      ),
    );
  }
}
