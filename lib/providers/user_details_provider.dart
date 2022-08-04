import 'package:flutter/material.dart';
import 'package:niel/model/user_details_model.dart';
import 'package:niel/resources/cloudfirestore_methods.dart';


class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel userDetails;

  UserDetailsProvider() : userDetails = UserDetailsModel(name: "Loading", address: "Loading");

Future getData() async {
  userDetails = await CloudFirestoreClass().getNameAndAddress();
  notifyListeners();
}
}