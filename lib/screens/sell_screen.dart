import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:niel/widget/loading_widget.dart';

import '../utils/utils.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isLoading = false;
  int selected = 4;
  Uint8List? image;
  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    return SafeArea(child:
        Scaffold(
          backgroundColor: Colors.white,
    body: !isLoading ?SingleChildScrollView(child: SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Stack(
               children: [
                 image == null ? Stack(children: [
                   Image.network("https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/179baa27e8be4fe8bac6ad2100915371_9366/galaxy-5-shoes.jpg", 
                     height: screenSize.height/10,),
                 IconButton(onPressed: () {}, icon: Icon(Icons.file_upload))],) :
                 Stack(
                   children: [
                     Image.memory(image!,
                       height: screenSize.height/10,),
                     IconButton(onPressed: () {}, icon: Icon(Icons.file_upload))
                   ],
                 )
               ],
             )

            ],
          ),
        ),
      ),
    ),) : LoadingWidget()
    ));
  }
}
