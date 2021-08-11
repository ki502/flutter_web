import 'dart:html';
import 'dart:ui';

import 'package:dart_pad_widget/dart_pad_parser.dart';
import 'package:flutter/material.dart';
import 'package:dart_pad_widget/dart_pad_widget.dart';
import 'package:flutter_web/utils/sizeChecker.dart';
import 'package:html_unescape/html_unescape.dart';

class Self extends StatefulWidget {
  @override
  State createState() => new SelfState();
}

class SelfState extends State<Self> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: 100),
        height: 300,
        child: Column(
          children: [
            CircleAvatar(
                maxRadius: 100,
                child: ClipOval(
                  child: Image.network(
                    'https://cdn.wishket.com/profiles/169258_20201231_ce8bc7cd181cc10c.jpg',
                  ),
                )),
            Container(
                height: 80,
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "개발자 긔여워",
                  style: TextStyle(fontSize: 30),
                ))
          ],
        ),
      ),
      Container(
          height: 100,
          child: Center(
            child: Text(
              "내 맘대로 쓰는 Dart",
              style: TextStyle(
                  fontSize: SizeChecker.isSmallScreen(context) ? 20 : 72),
            ),
          )),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 1,
        color: Colors.blueGrey,
        margin: EdgeInsets.only(
            top: 20,
            bottom: 20,
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 20),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: exampleButtonList.map<Widget>((element) {
                  return exampleButton(
                    title: (element["title"] as String).isEmpty
                        ? "예제 ${exampleButtonList.indexOf(element) + 1}"
                        : element["title"] as String,
                    body: element["body"] as String,
                    code: element["code"] as String,
                  );
                }).toList(),
              )),
          Container(
            padding: EdgeInsets.only(
                top: 20,
                bottom: 50,
                left: MediaQuery.of(context).size.width / 20,
                right: MediaQuery.of(context).size.width / 20),
            child: DartPad(
                key: Key("test"),
                width: MediaQuery.of(context).size.width,
                height: 600,
                flutter: true,
                runImmediately: true,
                darkMode: true,
                split: false,
                code: getDartPadString("")),
          ),
        ],
      ),
    ]);
  }

  void codeChange(code) {
    setState(() {
      IFrameElement ifrelem = document
          .querySelector('flt-platform-view')!
          .shadowRoot!
          .querySelector('iframe') as IFrameElement;

      var m = {
        'sourceCode':
            InjectParser((HtmlUnescape().convert(getDartPadString(code))))
                .read(),
        'type': 'sourceCode'
      };
      ifrelem.contentWindow!.postMessage(m, '*');
    });
  }

  String getDartPadString(String code) {
    return """import 'package:flutter/material.dart';

void main() {
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
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: """ +
        (code.isEmpty
            ? """ Center(
          child: Container(
            child: Text('Hello, World!'),
          )
            ),"""
            : code) +
        """);
  }
}""";
  }

  Widget exampleButton(
      {required String title, required String body, required String code}) {
    return InkWell(
      onTap: () {
        setState(() {
          codeChange(code);
        });
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
              Text(body)
            ],
          ),
        ),
      ),
    );
  }

  final List<Map<String, Object>> exampleButtonList = [
    {
      "title": "",
      "body": "Circle 프로필 만들기",
      "code": '''
                        Card(
                      child: Container(
                        height: 300,
                        child: Column(
                          children: [
                            CircleAvatar(
                            maxRadius: 100,
                            child: ClipOval(
                              child: Image.network(
                                'https://cdn.wishket.com/profiles/169258_20201231_ce8bc7cd181cc10c.jpg', // CORS 문제로 --web-renderer html 옵션 추가가 필요 할 수 있음
                              ),
                            )),
                            Container(
                                height: 80,
                                margin: EdgeInsets.only(top: 20),
                                child: Text(
                                  "개발자 긔여워",
                                  style: TextStyle(fontSize: 30),
                                ))
                          ],
                        ),
                      ),
                    )
                      ''',
    },
    {
      "title": "",
      "body": "반응형 HorizontalScrollView 만들기",
      "code": '''
                        MediaQuery.of(context).size.width < 800 ?
                        SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [// CORS 문제로 --web-renderer html 옵션 추가가 필요 할 수 있음
                                  "https://cdn.imweb.me/thumbnail/20170922/59c4da84ac052.jpg",
                                  "https://image-notepet.akamaized.net/resize/620x-/seimage/20191113%2Fa0908d3caf2d3b9f07c5d1d931647cf1.png",
                                  "https://blog.kakaocdn.net/dn/bawEZG/btqDGItxJy1/zhSaAFFLFk1jpQlTvlANM0/img.png"
                                ].map((element) {
                                  return Builder(
                                      builder: (BuildContext buildContext) {
                                    Size builderSize =
                                        MediaQuery.of(buildContext).size;
                                    double width = builderSize.width / 15;

                                    return Column(
                                      children: [
                                        Card(
                                            child: Image.network(
                                          element,
                                          width: 225 > width ? 225 : width,
                                          height: 225,
                                        )),
                                        Text("Best picture")
                                      ],
                                    );
                                  });
                                }).toList(),
                              ))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [// CORS 문제로 --web-renderer html 옵션 추가가 필요 할 수 있음
                                "https://cdn.imweb.me/thumbnail/20170922/59c4da84ac052.jpg",
                                "https://image-notepet.akamaized.net/resize/620x-/seimage/20191113%2Fa0908d3caf2d3b9f07c5d1d931647cf1.png",
                                "https://blog.kakaocdn.net/dn/bawEZG/btqDGItxJy1/zhSaAFFLFk1jpQlTvlANM0/img.png"
                              ].map((element) {
                                return Builder(
                                    builder: (BuildContext buildContext) {
                                  Size builderSize =
                                      MediaQuery.of(buildContext).size;

                                  return Column(
                                    children: [
                                      Card(
                                          child: Image.network(
                                        element,
                                        width: builderSize.width / 6,
                                        height: builderSize.width / 6,
                                        fit: BoxFit.fill,
                                      )),
                                      Text("Best picture")
                                    ],
                                  );
                                });
                              }).toList(),
                            )
                      ''',
    },
  ];
}
