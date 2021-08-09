import 'package:flutter/material.dart';
import 'package:flutter_noksan/components/button/customInkwellButton.dart';

class LargeHeader extends StatefulWidget implements PreferredSizeWidget {
  LargeHeader() : super();

  @override
  State createState() => new LargeHeaderState();

  @override
  Size get preferredSize => new Size.fromHeight(100.0);
}

class LargeHeaderState extends State<LargeHeader> {
  var isMenuHover = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.blueGrey.withOpacity(0.5),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Text('EXPLORE'),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomInkwellButton(
                    "TEST1",
                    hoverCallback: isHoverCallback,
                  ),
                  SizedBox(width: screenSize.width / 20),
                  CustomInkwellButton("TEST2", hoverCallback: isHoverCallback),
                  SizedBox(width: screenSize.width / 20),
                  CustomInkwellButton("TEST2", hoverCallback: isHoverCallback),
                  SizedBox(width: screenSize.width / 20),
                  CustomInkwellButton("TEST2", hoverCallback: isHoverCallback),
                  SizedBox(width: screenSize.width / 20),
                  CustomInkwellButton("TEST2", hoverCallback: isHoverCallback),
                  SizedBox(width: screenSize.width / 20),
                  CustomInkwellButton("TEST2", hoverCallback: isHoverCallback),
                  SizedBox(width: screenSize.width / 20),
                  CustomInkwellButton("TEST2", hoverCallback: isHoverCallback),
                  SizedBox(width: screenSize.width / 20),
                  CustomInkwellButton("TEST2", hoverCallback: isHoverCallback),
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 50,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void isHoverCallback(value, name) {
    if (value) {
      setState(() {
        this.isMenuHover = value;
      });
    }
  }
}
