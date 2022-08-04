import 'package:flutter/material.dart';
import 'package:niel/model/product_model.dart';
import 'package:niel/screens/product_screen.dart';
import 'package:niel/utils/color_themes.dart';
import 'package:niel/widget/custom_square_button.dart';
import 'package:niel/widget/product_information_widget.dart';
import 'package:niel/widget/custom_simple_rounded_button.dart';


import '../screens/results_screen.dart';
import '../utils/utils.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    return Container(
      padding: EdgeInsets.all(20),
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
          Expanded(flex: 2,child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(productModel : product))

              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width/3,
                  child: Align(alignment: Alignment.topLeft,  child: Center(child: Image.network(product.url),
                  ),
                  ),
                ),
               ProductInformationWidget(productName: product.productName, cost: product.cost, sellerName: product.sellerName)

              ],
            ),
          ),
          ),
          Expanded(child: Row(
            children: [
              CustomSquareButton(child:
              Icon(Icons.remove),
                  onPressed: () {},
                  color: backgroundColor,
                  dimension: 40),
              CustomSquareButton(child:
              Text("1", style: TextStyle(
                color: activeCyanColor
               ),
              ),
                  onPressed: () {},
                  color: Colors.white,
                  dimension: 40),
              CustomSquareButton(child:
              Icon(Icons.add),
                  onPressed: () {},
                  color: backgroundColor,
                  dimension: 40),
            ],
          ),
            flex: 1,
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CustomSimpleRoundedButton(onPressed: () {}, text: "Delete",),
                    SizedBox(width: 7,),
                    CustomSimpleRoundedButton(onPressed: () {}, text: "Save For Later",),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Align(alignment: Alignment.centerLeft,
                      child: Text("See more like this", style: TextStyle(color: activeCyanColor),)),
                )
              ]

            ),
          ),
            flex: 1,
          ),
        ],
      ),

    );
  }
}
