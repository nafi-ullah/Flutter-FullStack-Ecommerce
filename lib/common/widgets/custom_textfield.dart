import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,
  required this.hintText,
   required this.controller});
  final TextEditingController controller;
  final String hintText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:  InputDecoration(
        hintText: hintText,
        border:  const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38)
        ),
        enabledBorder: const OutlineInputBorder(
             borderSide: BorderSide(
            color: Colors.black38)
        ),
      ),
      validator: (val){
          if(val == null || val.isEmpty){
            return 'Enter your $hintText';
          }
          return null;
      }

    );
  }
}