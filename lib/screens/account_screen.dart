import 'package:flutter/material.dart';
import 'package:niel/model/user_details_model.dart';
import 'package:niel/providers/user_details_provider.dart';
import 'package:niel/utils/constants.dart';
import 'package:niel/widget/IntroductionWidgetAccountScreen.dart';
import 'package:niel/widget/account_screen_app_bar.dart';
import 'package:niel/widget/custom_main_button.dart';
import 'package:niel/widget/products_showcase_list_view.dart';
import 'package:provider/provider.dart';

import '../utils/color_themes.dart';
import '../utils/utils.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();

    return Scaffold(backgroundColor: Colors.white,
      appBar: AccountScreenAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(height: screenSize.height, width: screenSize.width,
          child: Column(
            children: [
              IntroductionWidgetAccountScreen(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(child:
                Text("Sign In", style: TextStyle(color: Colors.black),),
                    color: Colors.orange,
                    isLoading: false,
                    onPressed: (){}
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(child:
                Text("Sell",style: TextStyle(color: Colors.black),),
                    color: Colors.yellow,
                    isLoading: false,
                    onPressed: (){}
                ),
              ),

              ProductShowcaseListView(
                  title: "Your Orders",
                  children: testChildren),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align( alignment: Alignment.centerLeft,
                    child:
                    Text("Order Requests",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),),
              ),
              Expanded(
                  child: ListView.builder(itemCount: 5,  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Order : Black Shoe", style: TextStyle(fontWeight: FontWeight.w500),),
                      subtitle: Text("Address : Somewhere"),
                      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.check),),
                    );
                  }))

            ],
          ),),
      ),
    );
  }
}
