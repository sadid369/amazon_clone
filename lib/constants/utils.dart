import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

pickImages() async {
  List<File> images = [];
  try {} catch (e) {}
}
