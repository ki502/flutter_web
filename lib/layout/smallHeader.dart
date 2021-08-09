import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SmallHeader extends AppBar {
  final Color backgroundColor;
  final double elevation;
  final Widget title;
  final IconThemeData iconTheme;

  SmallHeader()
      : backgroundColor = Colors.blueGrey.withOpacity(0.5),
        elevation = 0,
        title = Text(
          'Test',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme = IconThemeData(color: Colors.black);
}
