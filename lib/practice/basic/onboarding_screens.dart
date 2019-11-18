// -> https://dribbble.com/shots/6278546-Onboarding-Screens

import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

// ------------------- data for purpose ====================== //

var pageList = [
  PageModel(
      imageUrl: "assets/images/onboarding/illustration.png",
      title: "MUSIC",
      body: "EXPERIENCE WICKED PLAYLISTS",
      titleGradient: gradients[0]),
  PageModel(
      imageUrl: "assets/images/onboarding/illustration2.png",
      title: "SPA",
      body: "FEEL THE MAGIC OF WELLNESS",
      titleGradient: gradients[1]),
  PageModel(
      imageUrl: "assets/images/onboarding/illustration3.png",
      title: "TRAVEL",
      body: "LET'S HIKE UP",
      titleGradient: gradients[2]),
];

List<List<Color>> gradients = [
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
];

class PageModel {
  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient = [];
  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}

// ------------------------------------ END ---------------------------------

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;
  PageIndicator(this.currentIndex, this.pageCount);

  _indicator(bool isActive) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height: 4.0,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Color(0xFF3E4750),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 2.0),
                blurRadius: 2.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildPageIndicators() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < pageCount; i++) {
      indicatorList
          .add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: _buildPageIndicators(),
    );
  }
}

class OnboardingScreens extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OnboardingScreensState();
}

class OnboardingScreensState extends State<OnboardingScreens>
    with TickerProviderStateMixin {
  PageController _controller;
  AnimationController animationController;
  Animation<double> _scaleAnim;

  int currentPage = 0;
  bool lastPage = false;

  @override
  void initState() {
    _controller = PageController(initialPage: currentPage);
    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _scaleAnim = Tween(begin: 0.6, end: 1.0).animate(animationController);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF485563), Color(0xFF29323C)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          stops: [0.0, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  if (currentPage == pageList.length - 1) {
                    lastPage = true;
                    animationController.forward();
                  } else {
                    lastPage = false;
                    animationController.fling();
                  }
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, Widget child) {
                        var page = pageList[index];
                        var delta;
                        var y = 1.0;

                        if (_controller.position.haveDimensions) {
                          delta = _controller.page - index;
                          y = 1 - delta.abs().clamp(0.0, 1.0);
                        }

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(page.imageUrl),
                            Container(
                              height: 100.0,
                              margin: EdgeInsets.only(left: 12.0),
                              child: Stack(
                                children: <Widget>[
                                  Opacity(
                                    opacity: .10,
                                    child: GradientText(
                                      page.title,
                                      gradient: LinearGradient(
                                          colors: page.titleGradient),
                                      style: TextStyle(
                                        fontSize: 100.0,
                                        fontFamily: 'Montserrat-B',
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 30.0,
                                      left: 22.0,
                                    ),
                                    child: GradientText(
                                      page.title,
                                      gradient: LinearGradient(
                                          colors: page.titleGradient),
                                      style: TextStyle(
                                        fontSize: 70.0,
                                        fontFamily: 'Montserrat-B',
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12.0,
                                left: 38.0,
                              ),
                              child: Transform(
                                transform: Matrix4.translationValues(
                                    0.0, 50 * (1 - y), 0.0),
                                child: Text(
                                  page.body,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Montserrat-M',
                                    fontSize: 22.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            Positioned(
              left: 30.0,
              bottom: 55.0,
              child: Container(
                width: 160.0,
                child: PageIndicator(currentPage, pageList.length),
              ),
            ),
            lastPage
                ? Positioned(
                    right: 30.0,
                    bottom: 30.0,
                    child: ScaleTransition(
                      scale: _scaleAnim,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
