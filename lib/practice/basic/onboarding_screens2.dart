// -> https://dribbble.com/shots/5965530-Communities-checklists-App-Onboarding-UI
// Core
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// -- utilities styles

final kTitleStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
  fontSize: 32.0,
  height: 1.5,
);

final kSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.2,
);

class OnboardingScreens2App extends StatefulWidget {
  @override
  _OnboardingScreens2AppState createState() => _OnboardingScreens2AppState();
}

class _OnboardingScreens2AppState extends State<OnboardingScreens2App> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];

    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }

    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(microseconds: 250),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }

  Widget _buildBottomSection() {
    bool notLastPage = _currentPage != _numPages - 1;

    return notLastPage
        ? Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                    SizedBox(width: 10.0),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 30.0)
                  ],
                ),
              ),
            ),
          )
        : Text('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              child: GestureDetector(
                onTap: () {},
                child: Center(
                  child: Text(
                    'Get started',
                    style: TextStyle(
                      color: Color(0xFF5B16D0),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 570,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40.0, top: 40.0, right: 40.0),
                        child: Column(
                          children: <Widget>[
                            Image(
                              height: 300.0,
                              image: AssetImage(
                                  'assets/images/onboarding2/on.png'),
                            ),
                            SizedBox(height: 30.0),
                            Text('Connect people around the world',
                                style: kTitleStyle),
                            SizedBox(height: 10.0),
                            Text(
                                'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
                                style: kSubtitleStyle),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40.0, top: 40.0, right: 40.0),
                        child: Column(
                          children: <Widget>[
                            Image(
                              height: 300.0,
                              image: AssetImage(
                                  'assets/images/onboarding2/on1.png'),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Live your life smarter with us!',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40.0, top: 40.0, right: 40.0),
                        child: Column(
                          children: <Widget>[
                            Image(
                              height: 300.0,
                              image: AssetImage(
                                  'assets/images/onboarding2/on2.png'),
                            ),
                            SizedBox(height: 30.0),
                            Text('Get a new experience of imagination',
                                style: kTitleStyle),
                            SizedBox(height: 10.0),
                            Text(
                                'Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue.',
                                style: kSubtitleStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _buildBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
