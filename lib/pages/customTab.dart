import 'package:flutter/material.dart';
import 'package:flutter_web/components/button/customInkwellButton.dart';
import 'package:flutter_web/pages/tabs/weather.dart';
import 'package:flutter_web/utils/sizeChecker.dart';

class CustomTab extends StatefulWidget {
  double position = 0;

  CustomTab({required this.position});

  @override
  State<StatefulWidget> createState() => new CustomTabState();
}

class CustomTabState extends State<CustomTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double margin = (SizeChecker.isSmallScreen(context) ? 56 : 66);

    return Stack(
      children: <Widget>[
        Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top: margin + 50),
            child: Column(
              children: [
                Weather(),
              ],
            )),
        Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            margin: EdgeInsets.only(
              top: margin + this.widget.position,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                  height: 50,
                  color: Colors.transparent,
                  child: Row(
                      children: tabMenuList.map((element) {
                    return getTabButton(element["title"] as String);
                  }).toList())),
            )),
      ],
    );
  }

  Widget getTabButton(String title) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: CustomInkwellButton(
          title,
          fontColor: Colors.white,
          hoverFontColor: Colors.blueGrey,
        ));
  }

  final List<Map<String, Object>> tabMenuList = [
    {"title": "뭐하지", "menu": tabMenu.what},
    {"title": "책방", "menu": tabMenu.book},
    {"title": "레시피", "menu": tabMenu.recipe},
    {"title": "게임", "menu": tabMenu.game},
    {"title": "뉴스", "menu": tabMenu.news},
    {"title": "스포츠", "menu": tabMenu.sports},
    {"title": "연예", "menu": tabMenu.entertainment},
    {"title": "쇼핑", "menu": tabMenu.shopping},
    {"title": "패션", "menu": tabMenu.fasion},
  ];
}

enum tabMenu {
  what,
  book,
  recipe,
  game,
  news,
  sports,
  entertainment,
  shopping,
  fasion
}
