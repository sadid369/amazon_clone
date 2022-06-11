// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
