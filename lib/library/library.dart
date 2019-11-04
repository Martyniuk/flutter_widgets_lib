// Core
import 'package:flutter/material.dart';

// Instruments
import 'widgets/container.dart';
import 'widgets/column.dart';
import 'widgets/text_field.dart';
import 'widgets/expanded.dart';
import 'widgets/flexible.dart';
import 'widgets/navigation/navigator_simple.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return NavigatorSimple();
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
