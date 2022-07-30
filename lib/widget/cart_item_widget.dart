import 'package:flutter/material.dart';
import 'package:niel/utils/color_themes.dart';
import 'package:niel/widget/product_information_widget.dart';


import '../utils/utils.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    return Container(
      height: screenSize.height/2,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Column(
        children: [
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width/3,
                child: Image.network("https://rukminim1.flixcart.com/image/332/398/kqv8vww0/shoe/u/r/q/10-capsnew-10-hotstyle-black-black-original-imag4s3fkbpjzvfx.jpeg?q=50"),
              ),
             ProductInformationWidget(productName: "Black Shoes", cost: 500, sellerName: "Shoe Wala")
              
            ],
          ),
          flex: 5,
          ),
          Expanded(child: Container(
            color: Colors.blue,
          ),
            flex: 1,
          ),
          Expanded(child: Container(
            color: Colors.green,
          ),
            flex: 1,
          ),
        ],
      ),

    );
  }
}
