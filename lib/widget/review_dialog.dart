import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../utils/utils.dart';


class ReviewDialog extends StatelessWidget {
  const ReviewDialog({Key? key}) : super(key: key);

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
      onSubmitted: (RatingDialogResponse res) {


      },
    );
  }
}
