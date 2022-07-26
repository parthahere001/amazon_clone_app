import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:niel/layout/screen_layout.dart';
import 'package:niel/screens/sign_in_screen.dart';
import 'package:niel/utils/color_themes.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, AsyncSnapshot<User?> user) {
        if (user.connectionState== ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          );
        }
        else if(user.hasData) {


          return const ScreenLayout();//ElevatedButton(onPressed: () { FirebaseAuth.instance.signOut();}, child: const Text("Sign-Out"));

        }
        else {
          return const SignInScreen();

        }
      },) //Text("Hi Home"),
    );
  }
}
