import 'package:flutter/material.dart';
import 'package:niel/widget/banner_ad_widget.dart';
import 'package:niel/widget/search_bar_widget.dart';

import '../utils/utils.dart';
import '../widget/catagories_horizontal_list_view_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(hasBackButton: false, isReadOnly: false,),

     body: SingleChildScrollView(
       child: Column(
         children: [
           CatagoriesHorizontalListViewBar(), BannerAdWidget(),
         ],
       ),
     )
    );
  }
}
