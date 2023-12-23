import 'package:amazon_clone_app/constants/global_variable.dart';
import 'package:amazon_clone_app/provicder/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariable.appBarGradient,
      ),
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          RichText(
              text: TextSpan(
            text: 'Hello, ',
            style: const TextStyle(
              fontSize: 22,
              color: Color.fromRGBO(38, 44, 33, 1),
            ),
            children: [
              TextSpan(
                  text: user.name,
            style: const TextStyle(
              fontSize: 22,
              color: Color.fromRGBO(38, 44, 33, 1),
              fontWeight: FontWeight.w600
            )
                )

            ]
          ))
        ],
      ),
    );
  }
}
