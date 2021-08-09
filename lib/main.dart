import 'package:flutter/material.dart';
import 'package:flutter_noksan/components/drawer/customDrawer.dart';
import 'package:flutter_noksan/layout/largeHeader.dart';
import 'package:flutter_noksan/layout/smallHeader.dart';
import 'package:flutter_noksan/pages/main.dart';
import 'package:flutter_noksan/utils/sizeChecker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noksan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Noksan'),
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
  @override
  Widget build(BuildContext context) {
    var header =
        (SizeChecker.isSmallScreen(context) ? SmallHeader() : LargeHeader());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: header as PreferredSizeWidget,
      body: SingleChildScrollView(child: Main()),
      drawer: CustomDrawer(context),
    );
  }
}
