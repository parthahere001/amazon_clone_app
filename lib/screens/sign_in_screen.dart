import 'package:flutter/material.dart';
import 'package:niel/utils/constants.dart';
import 'package:niel/utils/utils.dart';
import 'package:niel/widget/text_field_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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

              Container(
                height: screenSize.height * 0.5,
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
                  ],
                ) ,
              ),
            ],
          ),

        ],
      ),
    ),
    ),
    );
  }
}
