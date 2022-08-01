import 'package:flutter/material.dart';
import 'package:niel/utils/color_themes.dart';
import 'package:niel/widget/custom_square_button.dart';
import 'package:niel/widget/product_information_widget.dart';


import '../utils/utils.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    return Container(
      padding: EdgeInsets.all(25),
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
          Expanded(flex: 5,child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width/3,
                child: Align(alignment: Alignment.topLeft,  child: Center(child: Image.network("https://rukminim1.flixcart.com/image/332/398/kqv8vww0/shoe/u/r/q/10-capsnew-10-hotstyle-black-black-original-imag4s3fkbpjzvfx.jpeg?q=50"))),
              ),
             ProductInformationWidget(productName: "Black Shoes", cost: 500.30, sellerName: "Shoe Wala")

            ],
          ),
          ),
          Expanded(child: Row(
            children: [
              CustomSquareButton(child:
              Icon(Icons.remove),
                  onPressed: () {},
                  color: Colors.grey[500]!,
                  dimension: 50),
              CustomSquareButton(child:
              Text("1"),
                  onPressed: () {},
                  color: activeCyanColor,
                  dimension: 50),
              CustomSquareButton(child:
              Icon(Icons.add),
                  onPressed: () {},
                  color: Colors.grey[500]!,
                  dimension: 50),
            ],
          ),
            flex: 3,
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
