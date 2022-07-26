import 'package:flutter/material.dart';
import 'package:niel/screens/sign_in_screen.dart';
import 'package:niel/utils/color_themes.dart';

void main(){
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Niel Shopping",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const SignInScreen() //Text("Hi Home"),
    );
  }
}
