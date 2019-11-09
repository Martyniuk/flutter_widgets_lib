// Core
import 'package:flutter/material.dart';

// Instruments
// import 'widgets/container.dart';
// import 'widgets/column.dart';
// import 'widgets/text_field.dart';
// import 'widgets/expanded.dart';
// import 'widgets/flexible.dart';
// import 'widgets/navigation/navigator_simple.dart';
// import 'widgets/center.dart';
import 'widgets/card.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Library'),
        ),
        body: CardCustom(),
      ),
    );
    // return Container(
    //   child: Center(
    //     // child: TextFieldCustom(),
    //     // child: ExpandedCustom(),
    //     // child: FlexibleCustom(),
    //     child: ContainerCustom(),
    //   ),
    // );
  }
}
