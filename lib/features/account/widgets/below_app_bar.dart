// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      padding: EdgeInsets.only(bottom: 10, left: 10),
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: "Hello, ",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: user.name,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
