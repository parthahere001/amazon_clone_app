import 'dart:ui';

import 'package:flutter/material.dart';


class CostWidget extends StatelessWidget {
  final Color color;
  final double cost;
  const CostWidget({Key? key, required this.color, required this.cost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String j;
    if (((cost - cost.toInt()).toString()).length<4)
      {
        j= '${((cost - cost.toInt()).toString()).substring(1,3)}0';
      }
    else
      {
        j=((cost - cost.toInt()).toString()).substring(1,4);
      }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:  [
        Text("₹",
          style: TextStyle(
            color: color,
            fontSize: 10,
        fontFeatures: const [ FontFeature.superscripts(),
      ],
        ),),
        Text(cost.toInt().toString(), style: TextStyle(fontSize: 25, color: color, fontWeight: FontWeight.w800),),

        Text(j,//((cost - cost.toInt()).toString()).substring(1,3),
          style: TextStyle(
            fontSize: 10,
            color: color,
            fontFeatures: const [ FontFeature.superscripts(),
            ],
          ),),
      ],
    );
  }
}
