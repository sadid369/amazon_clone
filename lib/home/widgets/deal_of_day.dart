// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10, top: 15),
          child: Text(
            "Deal Of the Day",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
