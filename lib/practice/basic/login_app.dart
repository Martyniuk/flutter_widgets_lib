// --> https://www.uplabs.com/posts/login-99a29cbb-2952-4550-a977-5081bada091d
// Core
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  'assets/images/login/image_01.png',
                ),
              ),
              Spacer(),
              // Expanded(
              //   child: Container(),
              // ),
              Image.asset('assets/images/login/image_02.png')
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 28.0,
                right: 28.0,
                top: 60.0,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/login/logo.png',
                        width: ScreenUtil.getInstance().setWidth(110),
                        height: ScreenUtil.getInstance().setHeight(110),
                      ),
                      Text(
                        'LOGO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-B',
                          fontSize: ScreenUtil.getInstance().setSp(46),
                          letterSpacing: .6,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(180),
                  ),
                  Container(
                    width: double.infinity,
                    height: ScreenUtil.getInstance().setHeight(500),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 15.0),
                          blurRadius: 10.0,
                        ),
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, -10.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins-B',
                              letterSpacing: .6,
                              fontSize: ScreenUtil.getInstance().setSp(45),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Username',
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(45),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'Poppins-M',
                                  fontSize: ScreenUtil.getInstance().setSp(28),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(60),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value;
                              });
                            },
                          ),
                          Text(
                            'Remember Me',
                            style: TextStyle(
                              height: 2.5,
                              color: Colors.grey,
                              fontFamily: 'Poppins-M',
                              fontSize: ScreenUtil.getInstance().setSp(26),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 180.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(20, 225, 228, 1.0),
                                Color.fromRGBO(94, 117, 228, 1.0),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[500],
                                offset: Offset(0.0, 1.5),
                                blurRadius: 1.5,
                              ),
                            ]),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'LogIn',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins-M',
                                  fontSize: 16.0,
                                  letterSpacing: .9,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _drawLine(),
                      Text(
                        'Social Login',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontFamily: 'Poppins-M',
                          fontSize: 18.0,
                        ),
                      ),
                      _drawLine(),
                    ],
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        colors: [
                          Color(0xFF102397),
                          Color(0xFF187adf),
                          Color(0xFF00eaf8),
                        ],
                        iconData: CustomIcons.facebook,
                        onPressed: () {},
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFFff4f38),
                          Color(0xFFff355d),
                        ],
                        iconData: CustomIcons.googlePlus,
                        onPressed: () {},
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFF17ead9),
                          Color(0xFF6078ea),
                        ],
                        iconData: CustomIcons.twitter,
                        onPressed: () {},
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFF00c6fb),
                          Color(0xFF005bea),
                        ],
                        iconData: CustomIcons.linkedin,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'New User?',
                        style: TextStyle(fontFamily: 'Poppins-M'),
                      ),
                      SizedBox(width: ScreenUtil.getInstance().setWidth(10)),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.blue, fontFamily: 'Poppins-M'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawLine() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      width: 120.0,
      height: 1.0,
      color: Colors.grey[400],
    );
  }
}

class CustomIcons {
  static const IconData twitter = IconData(0xe900, fontFamily: 'Social');
  static const IconData facebook = IconData(0xe901, fontFamily: 'Social');
  static const IconData googlePlus = IconData(0xe902, fontFamily: 'Social');
  static const IconData linkedin = IconData(0xe903, fontFamily: 'Social');
}

class SocialIcon extends StatelessWidget {
  final List<Color> colors;
  final IconData iconData;
  final Function onPressed;

  SocialIcon({this.colors, this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: colors, tileMode: TileMode.clamp),
        ),
        child: RawMaterialButton(
          onPressed: this.onPressed,
          shape: CircleBorder(),
          child: Icon(this.iconData, color: Colors.white),
        ),
      ),
    );
  }
}
