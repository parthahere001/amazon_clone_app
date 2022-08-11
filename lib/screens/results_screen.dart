import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:niel/widget/loading_widget.dart';
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
       child: FutureBuilder(
         future: FirebaseFirestore.instance.collection("products").where("productName", isGreaterThanOrEqualTo: query).get(),
           builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting)
             {
               return LoadingWidget();
             }
           else
             {
              return GridView.builder(itemCount: snapshot.data!.docs.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio : 2.2/3.8), itemBuilder: (context,index) {
                ProductModel product = ProductModel.getModelFromJson(json: snapshot.data!.docs[index].data());
                 return ResultsWidget(product: product);

              });
             }
           }))
        ],
      ),
    );
  }
}