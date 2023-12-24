import 'package:amazon_clone_app/common/widgets/single_product.dart';
import 'package:amazon_clone_app/constants/global_variable.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  //temp list
  List list = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Arduino-uno-perspective-transparent.png/1200px-Arduino-uno-perspective-transparent.png',
    'https://joy-it.net/files/files/Produkte/SBC-NodeMCU-ESP32/SBC-NodeMCU-ESP32-02.png',
    'https://upload.wikimedia.org/wikipedia/commons/9/97/Raspberry_Pi_3_B%2B_%2839906369025%29.png',
    'https://market.samm.com/sound-detection-sensor-sound-sensors-samm-1512-60-B.png'
  ];



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: Text(
                'See all',
                style: TextStyle(
                  color: GlobalVariable.selectedNavBarColor,
                ),
                

              ),
            ),
          ],
        ),
         Container(
                height: 170,
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 20,
                  right: 0,
                ),
           child: ListView.builder(
             scrollDirection: Axis.horizontal,
             itemCount: list!.length,
             itemBuilder: (context, index) {
               return GestureDetector(
                 onTap: () {},
                 child: SingleProduct(image: list[index])
                 );
             },
           ),
         ),
      ],
    );
  }
}
