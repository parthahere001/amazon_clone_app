import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:niel/model/user_details_model.dart';
import 'package:niel/resources/cloudfirestore_methods.dart';

class AuthenticationMethods {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();

  Future<String> signUpUser({required String name,
    required String address,
    required String email,
    required String password}) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();
    String output = "Something went wrong";
    if (name != "" && address != "" && email != "" && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserDetailsModel user = UserDetailsModel(name: name, address: address);
        await cloudFirestoreClass.uploadNameAndAddressToDatabase(user: user);
        output = "success";
        return output;
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
        return output;
      }
    }
    else {
      output = "Please fill up all the fields";
      return output;
    }
  }




Future<String> signInUser(
    {
      required String email,
      required String password}) async {

  email.trim();
  password.trim();
  String output = "Something went wrong";
  if (email!="" && password!="") {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      output = "success";
      return output;
    } on FirebaseAuthException catch (e) {
      output = e.message.toString();
      return output;
    }
  }
  else {

    output = "Please fill up all the fields";
    return output;
  }
} }
