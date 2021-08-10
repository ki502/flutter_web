import 'package:flutter/material.dart';
import 'package:flutter_web/components/drawer/customDrawer.dart';
import 'package:flutter_web/layout/footer.dart';
import 'package:flutter_web/layout/largeHeader.dart';
import 'package:flutter_web/layout/smallHeader.dart';
import 'package:flutter_web/pages/main.dart';
import 'package:flutter_web/utils/sizeChecker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter_web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'flutter_web'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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

  @override
  Widget build(BuildContext context) {
    var header = (SizeChecker.isSmallScreen(context)
        ? SmallHeader(scrollPosition > 250 ? 1 : 0.5)
        : LargeHeader(scrollPosition > 750 ? 1 : 0.5));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: header as PreferredSizeWidget,
      body: SingleChildScrollView(
        child: Column(children: [Main(), Footer()]),
        controller: scrollController,
      ),
      drawer: CustomDrawer(context),
    );
  }
}
