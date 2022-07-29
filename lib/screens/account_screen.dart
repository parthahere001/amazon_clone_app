import 'package:flutter/material.dart';
import 'package:niel/utils/constants.dart';
import 'package:niel/widget/account_screen_app_bar.dart';

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
              Container(
                height: kAppBarHeight / 2,
                decoration: BoxDecoration(gradient:
                LinearGradient(
                    colors: backgroundGradient,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
                child: Container(
                  height: kAppBarHeight / 2,
                  decoration: BoxDecoration(gradient:
                  LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.0000000001)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: RichText(text: TextSpan(children: [
                          TextSpan(text: "Hello, ",
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 27),),
                          TextSpan(text: "Ajay",
                            style: TextStyle(color: Colors.grey[800],
                                fontSize: 27,
                                fontWeight: FontWeight.bold),
                          ),
                        ]
                        ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: CircleAvatar(backgroundImage:
                        NetworkImage('https://cdn.allthings.how/wp-content/uploads/2020/10/allthings.how-how-to-change-your-profile-picture-on-google-meet-profile-photo-759x427.png?width=800'),),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),),
      ),
    );
  }
}
