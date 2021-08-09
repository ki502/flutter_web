import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_noksan/components/button/customInkwellButton.dart';
import 'package:flutter_noksan/utils/SizeChecker.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Main extends StatefulWidget {
  @override
  State createState() => MainState();
}

class MainState extends State<Main> {
  final CarouselController mainCrouselController = CarouselController();
  final CarouselController weekCrouselController = CarouselController();
  int mainCurrent = 0;
  var isMenuHover = false;
  var isWeekMenuClickedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    const player = YoutubePlayerIFrame();

    var divider = Container(
        height: 60,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: VerticalDivider());

    return Column(children: <Widget>[
      Container(
        child: Stack(
          children: [
            Container(
              child: SizedBox(
                height: 550,
                width: screenSize.width,
                child: Stack(
                  children: [
                    CarouselSlider(
                      carouselController: mainCrouselController,
                      options: CarouselOptions(
                          height: 550,
                          autoPlay: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              this.mainCurrent = index;
                            });
                          }),
                      items: [
                        0,
                        1,
                      ].map((index) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                decoration:
                                    BoxDecoration(color: Colors.amber[100]),
                                child: Image.network(
                                    "https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png",
                                    fit: BoxFit.fill));
                          },
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 480,
                        left: screenSize.width / 5,
                        right: screenSize.width / 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          0,
                          1,
                        ].map((entry) {
                          return GestureDetector(
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
                    top: 500,
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
        height: SizeChecker.isSmallScreen(context) ? 760 : 600,
      ),
      Container(
        child: Center(
          child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: screenSize.width / 5,
                right: screenSize.width / 5,
              ),
              child: Column(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("이번 주  "),
                ),
                CarouselSlider(
                  carouselController: weekCrouselController,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    height: 300.0,
                    viewportFraction:
                        SizeChecker.isSmallScreen(context) ? 1 : 0.5,
                  ),
                  items: [
                    {"index": 0, "url": "Ffgmq5_Op2A"},
                    {"index": 1, "url": "Ffgmq5_Op2A"},
                    {"index": 2, "url": "iXF3bbFTGyE"},
                    {"index": 3, "url": "iXF3bbFTGyE"},
                  ].map((element) {
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

                                  this
                                      .weekCrouselController
                                      .animateToPage((element["index"] as int));
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
                ),
              ])),
        ),
      ),
      Container(
        height: 50,
      )
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
