import 'package:flutter/material.dart';
import 'package:niel/model/product_model.dart';
import 'package:niel/model/user_details_model.dart';
import 'package:niel/utils/color_themes.dart';
import 'package:niel/utils/constants.dart';
import 'package:niel/widget/custom_main_button.dart';
import 'package:niel/widget/search_bar_widget.dart';
import 'package:niel/widget/user_details_bar.dart';
import 'package:niel/widget/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
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
                  child: CustomMainButton(child:
                  Text("Proceed to buy (n) items",
                  style: TextStyle(color: Colors.black),
                  ),
                      color: yellowColor,
                      isLoading: false,
                      onPressed: (){}),
                ),
                Expanded(
                  child: ListView.builder(itemCount: 5,  itemBuilder: (context,index){
                    return CartItemWidget(product: ProductModel(url: "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/179baa27e8be4fe8bac6ad2100915371_9366/galaxy-5-shoes.jpg", productName: "Black Shoes", cost: 500.30, discount: 0, uid: "gahgjhagjhaghga", sellerName: "ShoeWala", sellerUid: "hahjkhajkhajhahkjah",rating: 5, noOfRating: 5),);
                  }),
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
