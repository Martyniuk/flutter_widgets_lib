// Core
import 'package:flutter/material.dart';

// Instruments
import 'widgets/container.dart';
import 'widgets/text_field.dart';
import 'widgets/expanded.dart';
import 'widgets/flexible.dart';
import 'widgets/navigation/navigator_simple.dart';
import 'widgets/center.dart';
import 'widgets/card.dart';

var data = [
  ContainerCustom(),
  TextFieldCustom(),
  ExpandedCustom(),
  FlexibleCustom(),
  CenterCustom(),
  CardCustom()
];

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
      ),
      // ContainerCustom is cool --> Container with ListView inside
      // TextFieldCustom is cool --> Container
      // ExpandedCustom is cool --> Column
      // FlexibleCustom is cool --> Column
      // CenterCustom is cool --> Column
      // CardCustom is cool --> Column
      // body: ContainerCustom(),
      body: Center(
        // height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          shrinkWrap: false,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            Widget customWidget = data[index];

            return Column(
              children: <Widget>[
                customWidget,
                Divider(
                  color: Colors.red,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
