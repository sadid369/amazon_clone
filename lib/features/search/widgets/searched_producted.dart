// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/common/widgets/stars.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/models/product.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.fitWidth,
                height: 135,
                width: 135,
              ),
              Column(
                children: [
                  Container(
                    width: 235,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      product.name,
                      maxLines: 2,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 5,
                    ),
                    child: Stars(rating: 4),
                  ),
                  Container(
                    width: 235,
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 5,
                    ),
                    child: Text(
                      "\$${product.price}",
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text("Eligible for Free Shipping"),
                  ),
                  Container(
                    width: 235,
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 5,
                    ),
                    child: Text(
                      "In Stock",
                      maxLines: 2,
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
