import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onPressed;

  CustomButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: onPressed);
  }
}
