import 'package:amazon_clone_app/features/account/acocount_widgets/below_app.dart';
import 'package:amazon_clone_app/features/account/acocount_widgets/top_button.dart';
import 'package:flutter/material.dart';

import '../../constants/global_variable.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariable.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Container(
                 alignment: Alignment.topLeft,
                      child: Image.asset(
                     'assets/images/autnexlogo.png',
                height: 30,

    ),
    ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(
                      Icons.search,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: const Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 10,),
          TopButtons()
        ],

    )
    );
  }
}
