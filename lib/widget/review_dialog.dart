import 'package:flutter/material.dart';
import 'package:niel/model/review_model.dart';
import 'package:niel/model/user_details_model.dart';
import 'package:niel/providers/user_details_provider.dart';
import 'package:niel/resources/cloudfirestore_methods.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../utils/utils.dart';


class ReviewDialog extends StatelessWidget {
  final String productUid;
  const ReviewDialog({Key? key, required this.productUid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    return RatingDialog(


      initialRating: 0.0,
      // your app's name?
      title: Text(
        'Type a review for this product',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?


      submitButtonText: 'send',
      commentHint: 'Type here ...',
      onCancelled: () => print('cancelled'),
      onSubmitted: (RatingDialogResponse res) async {
        CloudFirestoreClass().uploadReviewToDatabase(productUid: productUid, model: ReviewModel(senderName: Provider.of<UserDetailsProvider>(context, listen: false).userDetails.name, description: res.comment, rating: res.rating.toInt()));


      },
    );
  }
}
