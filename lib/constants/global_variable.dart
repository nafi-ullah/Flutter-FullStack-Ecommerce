import 'package:flutter/material.dart';

String uri= 'http://192.168.0.126:3000';

class GlobalVariable{

  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromRGBO(169, 179, 136, 1),
      Color.fromRGBO(169, 179, 136, 0.918)
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(185, 148, 112, 1);
  static const backgroundColor = Color.fromRGBO(219, 215, 188, 0.82);
  static const Color greyBackgroundCOlor = Color.fromRGBO(254, 250, 224, 1);
  static var selectedNavBarColor = const Color.fromRGBO(95, 111, 82, 0.822);
  static const unselectedNavBarColor = Color.fromRGBO(38, 44, 33, 1);
}