import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    super.key,
    required this.text,
    required this.onTap,
    });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(219, 215, 188, 0.897), width: 0.0),
          borderRadius: BorderRadius.circular(50),
          color: Color.fromRGBO(219, 215, 188, 0.932),
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            elevation: 18,
            backgroundColor: Colors.black12.withOpacity(0.03),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromRGBO(38, 44, 33, 1),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}