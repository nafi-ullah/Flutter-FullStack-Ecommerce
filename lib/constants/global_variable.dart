import 'package:flutter/material.dart';

String uri= 'http://192.168.0.145:3000';

class GlobalVariable{

  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromRGBO(169, 179, 136, 1),
      Color.fromRGBO(169, 179, 136, 0.918)
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(185, 148, 112, 1);
  static const backgroundColor = Color.fromRGBO(226, 223, 223, 0.836);
  static const Color greyBackgroundCOlor = Color.fromRGBO(254, 250, 224, 1);
  static var selectedNavBarColor = const Color.fromRGBO(95, 111, 82, 0.822);
  static const unselectedNavBarColor = Color.fromRGBO(38, 44, 33, 1);

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://i.ibb.co/mN7Q131/Black-White-Orange-Modern-Special-Offer-Facebook-Cover.png',
    'https://www.electronics.com.bd/image/cache/catalog/banner/2023/Front-Main-Banner/LAMP-xs-1760x880.webp',
    'https://www.electronics.com.bd/image/cache/catalog/banner/2023/Front-Main-Banner/portable%20monitor-1760x880.webp',
    'https://i.ibb.co/L932NFy/blue-gradient-electronic-sales-promotion-facebook-cover.png'

  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Amplifier',
      'image': 'assets/images/cat1.png',
    },
    {
      'title': 'Tools',
      'image': 'assets/images/cat2.png',
    },
    {
      'title': 'Drone',
      'image': 'assets/images/cat3.png',
    },
    {
      'title': 'Motor',
      'image': 'assets/images/cat4.png',
    },
    {
      'title': 'Robotics',
      'image': 'assets/images/cat5.png',
    },
    {
      'title': 'IC',
      'image': 'assets/images/cat6.png',
    },
  ];
}

