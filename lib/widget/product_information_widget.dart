import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String sellerName;


  const ProductInformationWidget({Key? key,required this.productName, required this.cost, required this.sellerName }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    return SizedBox(
      width: screenSize.width/2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(productName,
            maxLines: 2,
            style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            overflow: TextOverflow.ellipsis,
          ), )
        ],
      ),
    );
  }
}
