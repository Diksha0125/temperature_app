import 'package:flutter/material.dart';
import 'package:temperature_fetch_app/colors.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: orangeLight),
      child: Icon(
        Icons.flash_on,
        color: white,
        size: 60,
      ),
    );
  }
}
