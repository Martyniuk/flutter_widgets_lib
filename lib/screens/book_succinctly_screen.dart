// Core
import 'package:flutter/material.dart';

class BookSuccinctlyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Succinctly'),
      ),
      body: Form(
        autovalidate: true,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Text('Hello'),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
