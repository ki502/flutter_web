import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SmallHeader extends AppBar {
  final Color backgroundColor;
  final double elevation;
  final Widget title;
  final IconThemeData iconTheme;
  final double opacity;

  SmallHeader(this.opacity)
      : backgroundColor = Colors.lightBlue.shade200.withOpacity(opacity),
        elevation = 0,
        title = Text(
          '동물의 왕국',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme = IconThemeData(color: Colors.white);
}
