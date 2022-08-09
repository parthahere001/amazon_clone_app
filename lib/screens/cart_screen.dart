import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:niel/model/product_model.dart';
import 'package:niel/model/user_details_model.dart';
import 'package:niel/providers/user_details_provider.dart';
import 'package:niel/resources/cloudfirestore_methods.dart';
import 'package:niel/utils/color_themes.dart';
import 'package:niel/utils/constants.dart';
import 'package:niel/widget/custom_main_button.dart';
import 'package:niel/widget/loading_widget.dart';
import 'package:niel/widget/search_bar_widget.dart';
import 'package:niel/widget/user_details_bar.dart';
import 'package:niel/widget/cart_item_widget.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final utils = Utils();

    return Scaffold(
      appBar: SearchBarWidget(
        hasBackButton: false,
        isReadOnly: true,
      ),
      body : Center(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: kAppBarHeight/2,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).collection("cart").snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                           snapshot ) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        {
                          return CustomMainButton(child: Text("Loading", style: TextStyle(color: Colors.black),), color: yellowColor, isLoading: true, onPressed: (){});

                        }
                      else{
                        return CustomMainButton(child: Text("Proceed to buy (${snapshot.data!.docs.length}) items", style: TextStyle(color: Colors.black),), color: yellowColor, isLoading: false, onPressed: () async {
                          await CloudFirestoreClass().buyAllItemsInCart(userDetails: Provider.of<UserDetailsProvider>(context, listen: false).userDetails);
                          utils.showSnackBar(context, "Products added to your orders");
                        });
                      }
                    }

                  )
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).collection("cart").snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                    snapshot ) {
                      if (snapshot.connectionState==ConnectionState.waiting)
                        {
                          return LoadingWidget();
                        }
                      else
                        {
                        return  ListView.builder(itemCount: snapshot.data!.docs.length,  itemBuilder: (context, index){
                            ProductModel model = ProductModel.getModelFromJson(json: snapshot.data!.docs[index].data());
                            return CartItemWidget(product: model);
                          });
                        }
                    },
                  )
                )
              ],
            ),
            UserDetailsBar(offset: 0, ),
          ],
        ),
      ),
    );
  }
}
