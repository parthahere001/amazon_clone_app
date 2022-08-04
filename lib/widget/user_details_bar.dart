import 'package:flutter/material.dart';
import 'package:niel/model/user_details_model.dart';
import 'package:niel/providers/user_details_provider.dart';
import 'package:niel/utils/color_themes.dart';
import 'package:niel/utils/constants.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';


class UserDetailsBar extends StatelessWidget {
  final double offset;

  const UserDetailsBar({Key? key, required this.offset, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    UserDetailsModel userDetails = Provider.of<UserDetailsProvider>(context).userDetails;
    return Positioned(
      top: -offset/2,
      child: Container(
        height: kAppBarHeight/2,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: lightBackgroundaGradient, begin: Alignment.centerLeft, end: Alignment.centerRight)
        ),
        child: Padding(padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
          child: SizedBox(
            width: screenSize.width,
            child: Row(
            children: [
              Padding(padding: EdgeInsets.only(right: 8)),
              Icon(Icons.location_on_outlined, color: Colors.grey[900],),
              SizedBox(width: screenSize.width * 0.75,
                child: Text("Deliver to ${userDetails.name} - ${userDetails.address}", style: TextStyle(color: Colors.grey[900]),maxLines: 1, overflow: TextOverflow.ellipsis,)),
            ],
        ),
          ),),
      ),
    );
  }
}
