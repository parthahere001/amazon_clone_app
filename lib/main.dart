import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:niel/layout/screen_layout.dart';
import 'package:niel/providers/user_details_provider.dart';
import 'package:niel/screens/product_screen.dart';
import 'package:niel/screens/results_screen.dart';
import 'package:niel/screens/sell_screen.dart';
import 'package:niel/screens/sign_in_screen.dart';
import 'package:niel/utils/color_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'model/product_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AmazonClone());
}



class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


   // FirebaseAuth.instance.signOut();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDetailsProvider())
      ],
      child: MaterialApp(
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
           //return ResultsScreen(query: "wwe");
           // return ProductScreen(productModel:  ProductModel(url: "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/179baa27e8be4fe8bac6ad2100915371_9366/galaxy-5-shoes.jpg", productName: "Black Shoes", cost: 500.30, discount: 0, uid: "gahgjhagjhaghga", sellerName: "ShoeWala", sellerUid: "hahjkhajkhajhahkjah",rating: 5, noOfRating: 5));
            //return const SellScreen();



          }
          else {
            return const SignInScreen();

          }
        },) //Text("Hi Home"),
      ),
    );
  }
}
