import 'package:flutter/material.dart';
import 'package:flutter_web/components/drawer/customDrawer.dart';
import 'package:flutter_web/datas/menu.dart';
import 'package:flutter_web/layout/footer.dart';
import 'package:flutter_web/layout/largeHeader.dart';
import 'package:flutter_web/layout/smallHeader.dart';
import 'package:flutter_web/pages/customTab.dart';
import 'package:flutter_web/pages/main.dart';
import 'package:flutter_web/pages/dart.dart';
import 'package:flutter_web/utils/sizeChecker.dart';
import 'package:flutter_web/config/nonweb.dart'
    if (dart.library.html) 'package:flutter_web/config/web.dart';

void main() {
  configureApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter_web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'flutter_web', menu: Menu.main),
      routes: <String, WidgetBuilder>{
        '/dart': (BuildContext context) =>
            MyHomePage(title: 'flutter_web', menu: Menu.dart),
        '/tab': (BuildContext context) =>
            MyHomePage(title: 'flutter_web', menu: Menu.tab),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.menu})
      : super(key: key);

  final String title;
  final Menu menu;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController scrollController = ScrollController();
  double scrollPosition = 0;

  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {
        scrollPosition = scrollController.position.pixels;
      });
    });

    super.initState();
  }

  Widget getMenu() {
    switch (this.widget.menu) {
      case Menu.dart:
        return Self();
      case Menu.tab:
        return CustomTab(position: this.scrollPosition);
      default:
        return Main();
    }
  }

  @override
  Widget build(BuildContext context) {
    var header = (SizeChecker.isSmallScreen(context)
        ? SmallHeader(scrollPosition > 250 ? 1 : 0.5)
        : LargeHeader(scrollPosition > 750 ? 1 : 0.5));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: header as PreferredSizeWidget,
      body: SingleChildScrollView(
        child: Column(children: [getMenu(), Footer()]),
        controller: scrollController,
      ),
      drawer: CustomDrawer(context),
    );
  }
}
