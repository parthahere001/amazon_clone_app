import 'package:flutter/material.dart';
import 'package:niel/model/review_model.dart';
import 'package:niel/utils/constants.dart';
import 'package:niel/widget/rating_star_widget.dart';

import '../utils/utils.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel review;
  const ReviewWidget({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    Size screenSize = utils.getScreenSize();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(review.senderName, style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold
          ),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: screenSize.width/4,
                    child: FittedBox(
                      child: RatingStarWidget(
                        rating: review.rating,
                      ),
                    ),
                  ),
                ),
                Text(keysOfRating[review.rating - 1], style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Text(review.description, maxLines: 2, overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}
