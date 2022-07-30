import 'package:flutter/material.dart';

import '../utils/color_themes.dart';
import '../utils/constants.dart';

class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(gradient:
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
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(backgroundImage:
              NetworkImage('https://cdn.allthings.how/wp-content/uploads/2020/10/allthings.how-how-to-change-your-profile-picture-on-google-meet-profile-photo-759x427.png?width=800'),),
            )
          ],
        ),
      ),
    );
  }
}
