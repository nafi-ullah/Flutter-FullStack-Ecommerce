//import 'package:amazon_clone_tutorial/common/widgets/loader.dart';
//import 'package:amazon_clone_tutorial/features/home/services/home_services.dart';
//import 'package:amazon_clone_tutorial/features/product_details/screens/product_details_screen.dart';
//import 'package:amazon_clone_tutorial/models/product.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  // Product? product;
  // final HomeServices homeServices = HomeServices();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   fetchDealOfDay();
  // }

  // void fetchDealOfDay() async {
  //   product = await homeServices.fetchDealOfDay(context: context);
  //   setState(() {});
  // }
  //
  // void navigateToDetailScreen() {
  //   Navigator.pushNamed(
  //     context,
  //     ProductDetailScreen.routeName,
  //     arguments: product,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(5),
            child: Text("Deal of the Day"),
          ),
          Image.asset(
            'assets/images/dod.png',
            height: 200, )

        ],
    );

  }
}