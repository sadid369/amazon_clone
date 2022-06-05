// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
          itemCount: GlobalVariables.categoryImages.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
