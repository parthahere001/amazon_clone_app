import 'package:flutter/material.dart';
import 'package:niel/screens/search_screen.dart';
import 'package:niel/utils/color_themes.dart';
import 'package:niel/utils/constants.dart';

import '../utils/utils.dart';


class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;
   SearchBarWidget({Key? key, required this.isReadOnly, required this.hasBackButton}) : preferredSize = const Size.fromHeight(kAppBarHeight), super(key: key);


  @override
  final Size preferredSize;
  
  OutlineInputBorder border = OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: const BorderSide(color: Colors.grey,width: 1));

  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    return Container(
      height: kAppBarHeight,
      decoration: const BoxDecoration(gradient: LinearGradient(colors: backgroundGradient, begin: Alignment.centerLeft, end: Alignment.centerRight)),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              hasBackButton?  IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back)) : Container(),
              SizedBox(
                width: screenSize.width * 0.7,
                child: Container(
                  decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, spreadRadius: 1, offset: Offset(0, 5),), ]),
                  child: TextField(
                    readOnly: isReadOnly,
                    onTap: () {
                      if (!isReadOnly) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));

                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Search Amazon",
                      fillColor: Colors.white,
                      filled: true,
                      border: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ),
              IconButton(onPressed: null, icon: Icon(Icons.mic_none_outlined))

            ],
          ),
        ],
      ),
    );
  }
}