import 'package:flutter/material.dart';
import 'package:niel/widget/results_widget.dart';
import 'package:niel/widget/search_bar_widget.dart';

import '../model/product_model.dart';

class ResultsScreen extends StatelessWidget {
  final String query;
  const ResultsScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: false, hasBackButton: true,),
      body: Column(
        children: [
          Align(alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: RichText(text: TextSpan(children: [
                TextSpan(
                  text: "Showing results for ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  )
                ),
                TextSpan(
                  text: query,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                  )
                )
              ])),
            ),
          ),
     Expanded(
       child:
          GridView.builder(itemCount: 9, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio : 2/3), itemBuilder: (context,index) {
            return ResultsWidget(product: ProductModel(
                url: "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/179baa27e8be4fe8bac6ad2100915371_9366/galaxy-5-shoes.jpg",
                productName: "Black Shoes",
                cost: 500.30,
                discount: 0,
                uid: "gahgjhagjhaghga",
                sellerName: "ShoeWala",
                sellerUid: "hahjkhajkhajhahkjah",
                rating: 3,
                noOfRating: 5),);
          }),
    )
        ],
      ),
    );
  }
}
