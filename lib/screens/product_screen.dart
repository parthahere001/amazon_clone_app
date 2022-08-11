import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:niel/model/product_model.dart';
import 'package:niel/model/review_model.dart';
import 'package:niel/resources/cloudfirestore_methods.dart';
import 'package:niel/utils/constants.dart';
import 'package:niel/widget/cost_widget.dart';
import 'package:niel/widget/custom_main_button.dart';
import 'package:niel/widget/custom_simple_rounded_button.dart';
import 'package:niel/widget/loading_widget.dart';
import 'package:niel/widget/rating_star_widget.dart';
import 'package:niel/widget/review_dialog.dart';
import 'package:niel/widget/review_widget.dart';
import 'package:niel/widget/search_bar_widget.dart';
import 'package:niel/widget/user_details_bar.dart';
import 'package:provider/provider.dart';

import '../model/user_details_model.dart';
import '../providers/user_details_provider.dart';
import '../utils/color_themes.dart';
import '../utils/utils.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({Key? key, required this.productModel}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded spaceThingy = Expanded(child: Container());
  @override
  Widget build(BuildContext context) {
    bool isLoading1 = false;
    bool isLoading2 = false;
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    return SafeArea(child:
    Scaffold(
      appBar: SearchBarWidget(isReadOnly: true, hasBackButton: true),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                 SizedBox(height: screenSize.height - (kAppBarHeight +( kAppBarHeight/2)),
                 child: Column(
                   children: [
                    SizedBox(
                     height: kAppBarHeight/2,
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(bottom: 3),
                               child: Text(widget.productModel.sellerName, style: TextStyle(color : activeCyanColor, fontSize: 15),),
                             ),
                             Text(widget.productModel.productName),


                           ],
                         ),
                         RatingStarWidget(rating: widget.productModel.rating)
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(15),
                     child: Container(
                         height: screenSize.height/3,

                       constraints: BoxConstraints(maxHeight: screenSize.height/3,  maxWidth: screenSize.width/2,),
                       child:  Image.network(widget.productModel.url,)

                     ),
                   ),
                   spaceThingy,
                   CostWidget(color: Colors.black, cost: widget.productModel.cost),
                   spaceThingy,
                   CustomMainButton(child: Text("Buy Now", style: TextStyle(color: Colors.black),), color: Colors.orange, isLoading: isLoading1, onPressed: () async {
                     setState(() {
                       isLoading1=true;
                     });
                     await CloudFirestoreClass().addProductsToOrders(model: widget.productModel, userDetails: Provider.of<UserDetailsProvider>(context, listen: false).userDetails);
                     utils.showSnackBar(context, "Products added to your orders");
                     setState(() {
                       isLoading1=false;
                     });
                   }),
                   spaceThingy,

                   CustomMainButton(child: Text("Add To Cart", style: TextStyle(color: Colors.black),), color: Colors.yellow, isLoading: isLoading2, onPressed: () async {
                     setState(() {
                       isLoading2=true;
                     });
                    await CloudFirestoreClass().addProductToCart(productModel: widget.productModel);
                    utils.showSnackBar(context, "Added To Cart");
                     setState(() {
                       isLoading2=false;
                     });
                   }),
                   spaceThingy,
                   CustomSimpleRoundedButton(onPressed: () {
                     showDialog(context: context, builder: (context) => ReviewDialog(productUid: widget.productModel.uid,));

                   }, text: "Add a review for this product"),
                 ]
                 ),
                 ),
                  SizedBox(
                    height: screenSize.height/1.9,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("products").doc(widget.productModel.uid).collection("reviews").snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting)
                          {
                            return LoadingWidget();
                          }
                        else
                          {
                            return ListView.builder(itemCount: snapshot.data!.docs.length, itemBuilder: (context, index) {
                           ReviewModel model = ReviewModel.getModelFromJson(json:
                           snapshot.data!.docs[index].data(),
                           );
                              return ReviewWidget(review: model);
                            });
                          }
                      },
                    )
                  )

                ],
              ),
            ),
          ),
          UserDetailsBar(offset: 0, ),
        ],
      ),
    ),
    );
  }
}
