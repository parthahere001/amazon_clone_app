import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:niel/providers/user_details_provider.dart';
import 'package:niel/resources/cloudfirestore_methods.dart';
import 'package:niel/utils/color_themes.dart';
import 'package:niel/widget/custom_main_button.dart';
import 'package:niel/widget/loading_widget.dart';
import 'package:niel/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isLoading = false;
  int selected = 1;
  Uint8List? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  //Expanded spaceThingy = Expanded(child: Container());
  List<int> keysForDiscount = [0, 70,60,50];

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    costController.dispose();
  }


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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

                  Stack(children: [
                  image==null? Image.network("https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/179baa27e8be4fe8bac6ad2100915371_9366/galaxy-5-shoes.jpg",
                     height: screenSize.height/10,):
                      Image.memory(image!,
                        height: screenSize.height/10,),
                      IconButton(onPressed: () async { Uint8List? temp = await Utils().pickImage();
                      if (temp!=null) {
                        setState(() {
                          image = temp;
                        });
                      }
                      }, icon: Icon(Icons.file_upload))
        ],


             ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                height: screenSize.height*0.7,
                width: screenSize.width*0.7,
                decoration:  BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("Item Details", style: TextStyle(
                    //   fontWeight: FontWeight.bold, fontSize: 24
                    // ),),
                    TextFieldWidget(title: "Name", controller: nameController, obscureText: false, hintText: "Enter item name"),
                    TextFieldWidget(title: "Cost", controller: costController, obscureText: false, hintText: "Enter item cost"),
                    Text("Discount", style: TextStyle(fontWeight: FontWeight.bold),),
                    ListTile(title: Text("None"),
                        leading: Radio(
                        value: 1,
                        groupValue: selected,
                        onChanged: (int? i) {
                      setState(() {
                        selected = i!;
                      });
                    }
                    ),
                   ),
                   ListTile(title: Text("70%"),
                        leading: Radio(
                        value: 2,
                        groupValue: selected,
                        onChanged: (int? i) {
                      setState(() {
                        selected = i!;
                      });
                    }
                    ),
                   ),
                   ListTile(title: Text("60%"),
                        leading: Radio(
                        value: 3,
                        groupValue: selected,
                        onChanged: (int? i) {
                      setState(() {
                        selected = i!;
                      });
                    }
                    ),
                   ),
                    ListTile(title: Text("50%"),
                        leading: Radio(
                        value: 4,
                        groupValue: selected,
                        onChanged: (int? i) {
                      setState(() {
                        selected = i!;
                      });
                    }
                    ),
                   ),
                  ],
                ),
              ),
              CustomMainButton(child: Text("Sell", style: TextStyle(color: Colors.black),), color: yellowColor, isLoading: isLoading, onPressed: () async {
                String output = await CloudFirestoreClass().uploadProductTodatabase(image: image, productName: nameController.text, rawCost: costController.text, discount: keysForDiscount[selected-1], seller: Provider.of<UserDetailsProvider>(context, listen: false).userDetails.name, sellerUid: FirebaseAuth.instance.currentUser!.uid,);
                if (output=="Success") {
                  Utils().showSnackBar(
                      context,
                      "Posted Product");
                }
                else {
                  Utils().showSnackBar(
                      context,
                      output);

                }
              }),
              CustomMainButton(child: Text("Back", style: TextStyle(color: Colors.black),), color: Colors.grey[300]!, isLoading: false, onPressed: () {
                Navigator.pop(context);
              }),



            ],
          ),
        ),
      ),
    ),) : LoadingWidget()
    ));
  }
}
