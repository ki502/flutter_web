import 'package:flutter/material.dart';

class CustomFlatButton extends StatefulWidget {
  final String name;
  final VoidCallback onPressed;

  CustomFlatButton(this.name, this.onPressed);

  @override
  State createState() => CustomFlatButtonSate();
}

class CustomFlatButtonSate extends State<CustomFlatButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: flatButtonStyle,
      onPressed: this.widget.onPressed,
      child: Text(this.widget.name),
    );
  }

  ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );
}
