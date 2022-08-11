import 'package:flutter/material.dart';
import 'package:niel/screens/search_screen.dart';
import 'package:niel/utils/constants.dart';

import '../utils/color_themes.dart';
import '../utils/utils.dart';

class AccountScreenAppBar extends StatelessWidget with PreferredSizeWidget{
  @override
  Size preferredSize;
   AccountScreenAppBar({Key? key}) : preferredSize=const Size.fromHeight(kAppBarHeight),  super(key: key);

  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    return Container(
      height: kAppBarHeight+20,
      width: screenSize.width,
      decoration: const BoxDecoration(gradient:
      LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight)),
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Padding(
      padding: const EdgeInsets.only(top: 47, left: 20),
      child: Image.network(amazonLogoUrl, height: kAppBarHeight * 0.55,),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_outlined, color: Colors.black,),),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
          }, icon: const Icon(Icons.search_outlined, color: Colors.black,),),


        ],
      ),
    )
  ],
),

    );
  }
}
