import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:niel/model/order_request_model.dart';
import 'package:niel/model/product_model.dart';
import 'package:niel/model/user_details_model.dart';
import 'package:niel/providers/user_details_provider.dart';
import 'package:niel/screens/sell_screen.dart';
import 'package:niel/utils/constants.dart';
import 'package:niel/widget/IntroductionWidgetAccountScreen.dart';
import 'package:niel/widget/account_screen_app_bar.dart';
import 'package:niel/widget/custom_main_button.dart';
import 'package:niel/widget/loading_widget.dart';
import 'package:niel/widget/products_showcase_list_view.dart';
import 'package:niel/widget/simple_product_widget.dart';
import 'package:provider/provider.dart';

import '../utils/color_themes.dart';
import '../utils/utils.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();

    return Scaffold(backgroundColor: Colors.white,
      appBar: AccountScreenAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(height: screenSize.height, width: screenSize.width,
          child: Column(
            children: [
              IntroductionWidgetAccountScreen(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(child:
                Text("Sign Out", style: TextStyle(color: Colors.black),),
                    color: Colors.orange,
                    isLoading: false,
                    onPressed: (){
                      FirebaseAuth.instance.signOut();
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(child:
                Text("Sell",style: TextStyle(color: Colors.black),),
                    color: Colors.yellow,
                    isLoading: false,
                    onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SellScreen()));
                    }
                ),
              ),

             FutureBuilder(
               future: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).collection("orders").get(),

                 builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot ){
                 if (snapshot.connectionState == ConnectionState.waiting)
                   {
                     return LoadingWidget();
                   }
                 else
                   {
                     List<Widget> children = [];
                     for (int i=0;i<snapshot.data!.docs.length;i++)
                       {
                         ProductModel model = ProductModel.getModelFromJson(json: snapshot.data!.docs[i].data());
                         children.add(SimpleProductWidget(productModel: model));
                       }
                     return ProductShowcaseListView(title: "Your Orders", children: children);
                   }
                 }),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align( alignment: Alignment.centerLeft,
                    child:
                    Text("Order Requests",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),),
              ),
              Expanded(
                  // child: StreamBuilder(
                  //   stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).collection("orderRequest").snapshots(),
                  //   builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting)
                  //       {
                  //         return LoadingWidget();
                  //       }
                  //     else
                  //       {
                  //         return ListView.builder(itemCount: snapshot.data!.docs.length,
                  //             itemBuilder: (context, index) {
                  //           OrderRequestModel model = OrderRequestModel.getModelFromJson(
                  //               json: snapshot.data!.docs[index].data());
                  //          return ListTile(
                  //             title: Text("${model.orderName}", style: TextStyle(fontWeight: FontWeight.w500),),
                  //             subtitle: Text("${model.buyersAddress}"),
                  //             trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.check),),
                  //           );
                  //         });
                  //       }
    child: StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("orderRequests")
        .snapshots(),
    builder: (context,
    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
    snapshot) {
    if (snapshot.connectionState ==
    ConnectionState.waiting) {
    return Container();
    } else {
    return ListView.builder(
    itemCount: snapshot.data!.docs.length,
    itemBuilder: (context, index) {
    OrderRequestModel model =
    OrderRequestModel.getModelFromJson(
    json:
    snapshot.data!.docs[index].data());
    return ListTile(
    title: Text(
    "Order: ${model.orderName}",
    style:
    TextStyle(fontWeight: FontWeight.w500),
    ),
    subtitle:
    Text("Address: ${model.buyersAddress}"),
    trailing: IconButton(
    onPressed: () async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth
        .instance.currentUser!.uid)
        .collection("orderRequests")
        .doc(snapshot.data!.docs[index].id)
        .delete();
    },
    icon: Icon(Icons.check)),
    );
    });
    //   },
    // ),

    }}),
              )
            ],
          ),),
      ),
    );
  }
}
