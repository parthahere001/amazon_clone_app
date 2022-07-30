import 'package:flutter/material.dart';
import 'package:niel/model/user_details_model.dart';
import 'package:niel/utils/constants.dart';
import 'package:niel/widget/banner_ad_widget.dart';
import 'package:niel/widget/products_showcase_list_view.dart';
import 'package:niel/widget/search_bar_widget.dart';
import 'package:niel/widget/simple_product_widget.dart';
import 'package:niel/widget/user_details_bar.dart';

import '../utils/utils.dart';
import '../widget/catagories_horizontal_list_view_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ScrollController controller = ScrollController();
  double offset =0;



  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }
@override
void dispose(){
  super.dispose();
  controller.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(hasBackButton: false, isReadOnly: false,),

     body: Stack(
       children: [
         SingleChildScrollView(
           controller: controller,
           child: Column(
             children: [
               SizedBox(
                 height: kAppBarHeight/2,
               ),
               CatagoriesHorizontalListViewBar(), BannerAdWidget(),
               ProductShowcaseListView(title: "Upto 70% Off", children: testChildren),
               ProductShowcaseListView(title: "Upto 60% Off", children: testChildren),
               ProductShowcaseListView(title: "Upto 50% Off", children: testChildren),
               ProductShowcaseListView(title: "Explore", children: testChildren),
             ],
           ),
         ),
         UserDetailsBar(offset: offset, userDetails: UserDetailsModel(name: "Ajay", address: "somewhere"),)
       ],
     )
    );
  }
}
