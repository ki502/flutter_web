import 'dart:ui';

import 'package:flutter/material.dart';

class CustomInkwellButton extends StatefulWidget {
  final String name;
  final VoidCallback? tabCallback;
  final Function? hoverCallback;
  final Color? fontColor;
  final Color? hoverFontColor;

  CustomInkwellButton(this.name,
      {this.tabCallback,
      this.hoverCallback,
      this.fontColor,
      this.hoverFontColor});

  @override
  State createState() => new CustomInkwellButtonState();
}

class CustomInkwellButtonState extends State<CustomInkwellButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.blue,
      onTap: this.widget.tabCallback ?? () {},
      child: Text(
        this.widget.name,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: (isHover
                ? this.widget.hoverFontColor ?? Colors.white
                : this.widget.fontColor ?? Colors.black)),
      ),
      onHover: (value) {
        setState(() {
          isHover = value;

          if (this.widget.hoverCallback != null) {
            this.widget.hoverCallback!(value, this.widget.name);
          }
        });
      },
    );
  }
}
