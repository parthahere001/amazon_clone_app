import 'package:flutter/material.dart';
import 'package:niel/model/product_model.dart';
import 'package:niel/screens/product_screen.dart';
import 'package:niel/utils/color_themes.dart';
import 'package:niel/widget/cost_widget.dart';
import 'package:niel/widget/rating_star_widget.dart';

import '../utils/utils.dart';


class ResultsWidget extends StatelessWidget {
  final ProductModel product;
  const ResultsWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen(productModel: product)));

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width/3,

                child: Image.network(product.url),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(product.productName, maxLines: 2, overflow: TextOverflow.ellipsis,),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(

                children: [
                  SizedBox(width: screenSize.width/5,
                      child: FittedBox(child: RatingStarWidget(rating: product.rating))),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(product.noOfRating.toString(), style: TextStyle(color: activeCyanColor),),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
                child: FittedBox(child: CostWidget(color: Color.fromARGB(255, 92, 9, 3), cost: product.cost))),

          ],
        ),
      ),
    );
  }
}
