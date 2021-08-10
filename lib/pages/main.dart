import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web/components/button/customInkwellButton.dart';
import 'package:flutter_web/utils/sizeChecker.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Main extends StatefulWidget {
  @override
  State createState() => MainState();
}

class MainState extends State<Main> {
  final CarouselController mainCrouselController = CarouselController();
  final CarouselController weekCrouselController = CarouselController();
  int mainCurrent = 0;
  bool isMenuHover = false;
  int isWeekMenuClickedIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> weekCrouselList = [
      {"index": 0, "url": "jANE8lpoj2c"},
      {"index": 1, "url": "dFaOvNyUykM"},
      {"index": 2, "url": "S8baeh8OyR0"},
      {"index": 3, "url": "Q5BVmwWZkEk"},
    ];

    List<String> weekPictureCrouselList = [
      "https://cdn.imweb.me/thumbnail/20170922/59c4da84ac052.jpg",
      "https://image-notepet.akamaized.net/resize/620x-/seimage/20191113%2Fa0908d3caf2d3b9f07c5d1d931647cf1.png",
      "https://lh3.googleusercontent.com/proxy/p7cCTOSWOTpZmbpew5GOuDxXEeJknmn6tnVgSFeWoLsu4UcLQhhtryeQvxfcRHCVyIVMsJmLTu5FAY7bjLPPbjjb3Gu87Wnj2RNEDncMoFaE8mK5YA"
    ];

    List<Map<String, Object>> mainList = [
      {
        "name": "고양이 긔여워",
        "url": "https://imgc.1300k.com/aaaaaib/goods/215025/29/215025297480.jpg"
      },
      {
        "name": "순진한 고양이 긔여워",
        "url":
            "https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F27738433597DCB1312"
      },
      {
        "name": "오늘도 강아지는 긔여워",
        "url":
            "https://mblogthumb-phinf.pstatic.net/MjAxOTA0MTFfMTU4/MDAxNTU0OTE2MjA0OTg0.dj-DdRFhpIM-cj9qx5jQHO5dTMzd8QkM_BiG5EgXjoEg.u1_iIbWxlGOqQpX4Q4JVnpXimPOqEan2391FZZxOPUMg.JPEG.jubbigi/%EA%B0%95%EC%95%84%EC%A7%80%EC%A7%A48.JPG?type=w800"
      },
      {
        "name": "내일도 고양이 긔여워",
        "url":
            "https://mblogthumb-phinf.pstatic.net/MjAxOTA4MTVfMTcw/MDAxNTY1ODcwMTcxNTUw.Kr8G-JwiZBKKmCCIPc_ZFiZ_sIKRh6i_rxj-TRFjEW8g.aYCyhiZNWAoEvm0ihNnwLhd-fpVKtvt_dm3ZE0ac1iUg.JPEG.choicemilk/%EA%B7%80%EC%97%AC%EC%9A%B4%EB%8F%99%EB%AC%BC_%EA%B7%80%EC%97%AC%EC%9A%B4%EA%B3%A0%EC%96%91%EC%9D%B4_%EB%8F%99%EB%AC%BC%EC%A7%A4_%EA%B7%80%EC%97%AC%EC%9A%B4%EB%8F%99%EB%AC%BC%EC%A7%A4_%EA%B7%80%EC%97%AC%EC%9A%B4%EA%B0%95%EC%95%84%EC%A7%80_7.jpg?type=w800"
      },
      {
        "name": "모레도 고양이 긔여워",
        "url":
            "https://pbs.twimg.com/profile_images/963095939798859776/AyS5pp5K_400x400.jpg"
      },
    ];

    Size screenSize = MediaQuery.of(context).size;
    const player = YoutubePlayerIFrame();

    var divider = Container(
        height: 60,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: VerticalDivider());

    double mainHeight = SizeChecker.isSmallScreen(context) ? 300 : 800;

    return Column(children: <Widget>[
      Container(
        child: Stack(
          children: [
            Container(
              child: SizedBox(
                height: mainHeight,
                width: screenSize.width,
                child: Stack(
                  children: [
                    CarouselSlider(
                      carouselController: mainCrouselController,
                      options: CarouselOptions(
                          height: mainHeight,
                          autoPlay: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              this.mainCurrent = index;
                            });
                          }),
                      items: mainList.map((element) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                child: Stack(
                              children: [
                                Image.network(element["url"] as String,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill),
                                Container(
                                  padding: EdgeInsets.only(
                                      bottom: SizeChecker.isSmallScreen(context)
                                          ? 100
                                          : 300),
                                  child: Center(
                                    child: Card(
                                        color: Colors.black54,
                                        child: Text(
                                          element["name"] as String,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  SizeChecker.isSmallScreen(
                                                          context)
                                                      ? 32
                                                      : 72,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Hind"),
                                        )),
                                  ),
                                )
                              ],
                            ));
                          },
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: mainHeight - 70,
                        left: screenSize.width / 5,
                        right: screenSize.width / 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          0,
                          1,
                          2,
                          3,
                          4,
                        ].map((entry) {
                          return InkWell(
                            onTap: () =>
                                mainCrouselController.animateToPage(entry),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(
                                          mainCurrent == entry ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.only(
                    top: mainHeight - 50,
                    left: screenSize.width / 5,
                    right: screenSize.width / 5,
                  ),
                  child: SizeChecker.isSmallScreen(context)
                      ? Column(children: [
                          Container(
                              height: 40,
                              margin: EdgeInsets.only(
                                top: 20,
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomInkwellButton("test21234",
                                      hoverFontColor: Colors.grey)
                                ],
                              )),
                          Container(
                              height: 40,
                              margin: EdgeInsets.only(
                                top: 20,
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomInkwellButton("test21234",
                                      hoverFontColor: Colors.grey)
                                ],
                              )),
                          Container(
                              height: 40,
                              margin: EdgeInsets.only(
                                top: 20,
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomInkwellButton("test21234",
                                      hoverFontColor: Colors.grey)
                                ],
                              )),
                          Container(
                              height: 40,
                              margin: EdgeInsets.only(
                                top: 20,
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomInkwellButton("test21234",
                                      hoverFontColor: Colors.grey)
                                ],
                              ))
                        ])
                      : Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: CustomInkwellButton("test21234",
                                        hoverFontColor: Colors.grey)),
                                divider,
                                Expanded(
                                    child: CustomInkwellButton("test21234",
                                        hoverFontColor: Colors.grey)),
                                divider,
                                Expanded(
                                    child: CustomInkwellButton("test21234",
                                        hoverFontColor: Colors.grey)),
                                divider,
                                Expanded(
                                    child: CustomInkwellButton("test21234",
                                        hoverFontColor: Colors.grey)),
                              ]),
                        )),
            ),
          ],
        ),
        height: SizeChecker.isSmallScreen(context)
            ? mainHeight + 250
            : mainHeight + 50,
      ),
      Container(
        padding: EdgeInsets.only(
            left:
                SizeChecker.isSmallScreen(context) ? 20 : screenSize.width / 5,
            right:
                SizeChecker.isSmallScreen(context) ? 20 : screenSize.width / 5),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  "이번 주 사진",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Hind"),
                ),
              ),
              SizeChecker.isSmallScreen(context)
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: weekPictureCrouselList.map((element) {
                          return Builder(builder: (BuildContext buildContext) {
                            Size builderSize = MediaQuery.of(buildContext).size;
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
                      children: weekPictureCrouselList.map((element) {
                        return Builder(builder: (BuildContext buildContext) {
                          Size builderSize = MediaQuery.of(buildContext).size;

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
            ]),
      ),
      Container(
        padding: EdgeInsets.only(bottom: 50),
        child: Center(
            child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 100, bottom: 50),
            alignment: Alignment.center,
            child: Text(
              "이번 주 영상",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Hind"),
            ),
          ),
          Stack(
            children: [
              SizeChecker.isSmallScreen(context)
                  ? Positioned.fill(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: IconButton(
                              onPressed: () {
                                this.weekCrouselController.previousPage();

                                setState(() {
                                  this.isWeekMenuClickedIndex = -1;
                                });
                              },
                              icon: Icon(Icons.arrow_left),
                              iconSize: 50,
                            ),
                          )),
                    )
                  : Positioned.fill(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: screenSize.width / 5 - 120,
                            ),
                            child: IconButton(
                              onPressed: () {
                                this.weekCrouselController.previousPage();

                                setState(() {
                                  this.isWeekMenuClickedIndex = -1;
                                });
                              },
                              icon: Icon(Icons.arrow_left),
                              iconSize: 72,
                            ),
                          )),
                    ),
              Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    left: SizeChecker.isSmallScreen(context)
                        ? screenSize.width / 10
                        : screenSize.width / 5,
                    right: SizeChecker.isSmallScreen(context)
                        ? screenSize.width / 10
                        : screenSize.width / 5,
                  ),
                  child: CarouselSlider(
                    carouselController: weekCrouselController,
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      height: MediaQuery.of(context).size.width / 3,
                      viewportFraction:
                          SizeChecker.isSmallScreen(context) ? 1 : 0.8,
                    ),
                    items: weekCrouselList.map((element) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      this.isWeekMenuClickedIndex =
                                          element["index"] as int;
                                    });

                                    this.weekCrouselController.animateToPage(
                                        (element["index"] as int));
                                  },
                                  child: isWeekMenuClickedIndex ==
                                          (element["index"] as int)
                                      ? YoutubePlayerControllerProvider(
                                          controller: YoutubePlayerController(
                                            initialVideoId:
                                                element["url"] as String,
                                            params: const YoutubePlayerParams(
                                              autoPlay: true,
                                              mute: true,
                                              captionLanguage: 'ko',
                                              enableCaption: false,
                                              showControls: true,
                                              enableJavaScript: true,
                                              showFullscreenButton: true,
                                              interfaceLanguage: 'ko',
                                              showVideoAnnotations: false,
                                              loop: false,
                                              playsInline: true,
                                              strictRelatedVideos: false,
                                              startAt: Duration.zero,
                                              desktopMode: false,
                                              privacyEnhanced: false,
                                              useHybridComposition: false,
                                            ),
                                          ),
                                          child: player,
                                        )
                                      : Image.network(
                                          YoutubePlayerController.getThumbnail(
                                            videoId: element["url"].toString(),
                                            quality: ThumbnailQuality.max,
                                            webp: true,
                                          ),
                                          fit: BoxFit.fill)));
                        },
                      );
                    }).toList(),
                  )),
              SizeChecker.isSmallScreen(context)
                  ? Positioned.fill(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: IconButton(
                              onPressed: () {
                                this.weekCrouselController.nextPage();

                                setState(() {
                                  this.isWeekMenuClickedIndex = -1;
                                });
                              },
                              icon: Icon(Icons.arrow_right),
                              iconSize: 50,
                            ),
                          )),
                    )
                  : Positioned.fill(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.only(
                              right: screenSize.width / 5 - 120,
                            ),
                            child: IconButton(
                              onPressed: () {
                                this.weekCrouselController.nextPage();

                                setState(() {
                                  this.isWeekMenuClickedIndex = -1;
                                });
                              },
                              icon: Icon(Icons.arrow_right),
                              iconSize: 72,
                            ),
                          )),
                    )
            ],
          ),
        ])),
      ),
    ]);
  }

  void isHoverCallback(value, name) {
    if (value) {
      setState(() {
        this.isMenuHover = value;
      });
    }
  }
}
