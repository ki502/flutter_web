import 'package:flutter/material.dart';
import 'package:flutter_web/components/button/customInkwellButton.dart';
import 'package:flutter_web/datas/menu.dart';

class LargeHeader extends StatefulWidget implements PreferredSizeWidget {
  final double opacity;
  final Function? onClickMenu;

  LargeHeader(this.opacity, {this.onClickMenu}) : super();

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
      color: Colors.lightBlue.shade200.withOpacity(this.widget.opacity),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                onClickMenu(Menu.main);
              },
              child: Text(
                '동물의 왕국',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomInkwellButton(
                    "Home",
                    fontColor: Colors.white,
                    hoverFontColor: Colors.blueGrey,
                    hoverCallback: isHoverCallback,
                    tabCallback: () {
                      onClickMenu(Menu.main);
                    },
                  ),
                  SizedBox(width: screenSize.width / 40),
                  CustomInkwellButton(
                    "Dart",
                    fontColor: Colors.white,
                    hoverFontColor: Colors.blueGrey,
                    hoverCallback: isHoverCallback,
                    tabCallback: () {
                      onClickMenu(Menu.dart);
                    },
                  ),
                  SizedBox(width: screenSize.width / 40),
                  CustomInkwellButton("TEST2",
                      fontColor: Colors.white,
                      hoverFontColor: Colors.blueGrey,
                      hoverCallback: isHoverCallback),
                  SizedBox(width: screenSize.width / 40),
                  CustomInkwellButton("TEST2",
                      fontColor: Colors.white,
                      hoverFontColor: Colors.blueGrey,
                      hoverCallback: isHoverCallback),
                  SizedBox(width: screenSize.width / 40),
                  CustomInkwellButton("TEST2",
                      fontColor: Colors.white,
                      hoverFontColor: Colors.blueGrey,
                      hoverCallback: isHoverCallback),
                  SizedBox(width: screenSize.width / 40),
                  CustomInkwellButton("TEST2",
                      fontColor: Colors.white,
                      hoverFontColor: Colors.blueGrey,
                      hoverCallback: isHoverCallback),
                  SizedBox(width: screenSize.width / 40),
                  CustomInkwellButton("TEST2",
                      fontColor: Colors.white,
                      hoverFontColor: Colors.blueGrey,
                      hoverCallback: isHoverCallback),
                  SizedBox(width: screenSize.width / 40),
                  CustomInkwellButton("TEST2",
                      fontColor: Colors.white,
                      hoverFontColor: Colors.blueGrey,
                      hoverCallback: isHoverCallback),
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 50,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
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

  void onClickMenu(Menu menu) {
    if (this.widget.onClickMenu != null) {
      this.widget.onClickMenu!(menu);
    }
  }
}
