import 'package:flutter/material.dart';
import 'package:niel/utils/color_themes.dart';
import 'package:niel/widget/cost_widget.dart';

import '../utils/utils.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String sellerName;


 const  ProductInformationWidget({Key? key,required this.productName, required this.cost, required this.sellerName }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    SizedBox spaceThingy = const SizedBox(height: 7,);
    return SizedBox(
      width: screenSize.width/2,
      child: Column(
       // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(productName,
            maxLines: 2,
            style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            letterSpacing: 0.9,
            overflow: TextOverflow.ellipsis,
          ), ),
          spaceThingy,
          Align(alignment: Alignment.centerLeft,  child:
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 57),
            child: CostWidget(color: Colors.black, cost: cost),
          )),
          spaceThingy,
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: RichText(text: TextSpan(children: [
              TextSpan(text: "Sold By ", style: TextStyle(
                color: Colors.grey[700], fontSize: 14,
              ),), TextSpan(text: sellerName, style: const TextStyle(
                color: activeCyanColor, fontSize: 14,
              ),),
            ]),),
          ),
        ],
      ),
    );
  }
}
