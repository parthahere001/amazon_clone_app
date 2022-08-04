import 'package:flutter/material.dart';
import 'package:niel/utils/constants.dart';

import '../screens/results_screen.dart';

class CatagoriesHorizontalListViewBar extends StatelessWidget {
  const CatagoriesHorizontalListViewBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(itemCount: categoriesList.length, scrollDirection: Axis.horizontal, itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsScreen(query: categoriesList[index],
            ),
            ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(categoryLogos[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(categoriesList[index]),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
