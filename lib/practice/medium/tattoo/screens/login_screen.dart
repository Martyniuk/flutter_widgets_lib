// Core
import 'package:flutter/material.dart';

// widgets
import '../widgets/onboarding_image_clipper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordController = TextEditingController();
  bool visible;

  @override
  void initState() {
    visible = false;
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void updateVisibility() {
    setState(() {
      this.visible = !this.visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(231, 231, 231, 1.0),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: OnboardingImageClipper(),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0.0,
                        left: -10.0,
                        bottom: -110.0,
                        right: 0.0,
                        child: Image.asset(
                          'assets/images/tattoo_app/login.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(0, 211, 145, 1.0),
                                Color.fromRGBO(219, 0, 255, 0.01)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40.0,
                        left: 45.0,
                        child: Text(
                          'NXT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 72.0,
                        left: 69,
                        child: Text(
                          'LVL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120.0,
                        left: 10,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Tattoo',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              TextSpan(
                                text: ' Studio',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 30.0,
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          _buildUsername(),
          SizedBox(height: 20.0),
          _buildPassword(visible, updateVisibility),
        ],
      ),
    );
  }

  Widget _buildPassword(bool visible, Function updateVisibility) {
    return Container(
      width: double.infinity,
      height: 58.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 3.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 5, left: 24, right: 16),
        child: TextField(
          obscureText: visible,
          controller: _passwordController,
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            hintText: 'Password',
            focusColor: Colors.grey,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.4,
            ),
            suffixIcon: IconButton(
              icon:
                  visible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
              onPressed: () {
                updateVisibility();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUsername() {
    return Container(
      width: double.infinity,
      height: 58.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 3.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 5, left: 24, right: 16),
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            hintText: 'Username',
            focusColor: Colors.grey,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.4,
            ),
            suffixIcon: Icon(
              Icons.person_outline,
            ),
          ),
        ),
      ),
    );
  }
}
