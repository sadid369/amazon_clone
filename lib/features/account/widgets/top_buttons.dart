// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Yours Orders',
              onTap: () {},
            ),
            AccountButton(
              text: 'Turn Seller',
              onTap: () {},
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
              text: 'Log Out',
              onTap: () => AccountServices().logout(context),
            ),
            AccountButton(
              text: 'Your Wish List',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
