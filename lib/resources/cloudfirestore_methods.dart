import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:niel/model/product_model.dart';
import 'package:niel/model/user_details_model.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadNameAndAddressToDatabase(
  {
  required UserDetailsModel user,
}
      ) async {
    await firebaseFirestore.collection("users").doc(firebaseAuth.currentUser!.uid).set(user.getJson());
  }

  Future getNameAndAddress() async {
   DocumentSnapshot snap = await firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).get();
      UserDetailsModel userModel = UserDetailsModel.getModelFromJson(snap.data() as dynamic);
      return userModel;
}


Future<String> uploadProductTodatabase({
  required Uint8List? image,
  required String productName,
  required String rawCost,
  required int discount,
  required String seller,
  required String sellerUid,

}) async {
    productName.trim();
    rawCost.trim();
    String output = "Something went wrong";

    if (image != null && productName!=null && rawCost!= null)
    {
      try{
        output = "Success";
      }catch(e)
  {
    output=e.toString();
  }
    }
    else
      {
        output="Please fill blank fields";
      }
        return output;

}

}