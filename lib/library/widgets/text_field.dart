import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextFieldState();
  }
}

// Handle changes to a text field --> Playaround
class _TextFieldState extends State<TextFieldCustom> {
  String _value = '';
  String _value1 = '';
  String _value2 = '';
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.addListener(_customFunction);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _customFunction() {
    AlertDialog();
    _value2 = controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'onChange',
                    ),
                    onChanged: (str) {
                      setState(() {
                        _value = str;
                      });
                    },
                  ),
                ),
                Divider(
                  color: Colors.red,
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green[400]),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 5.0,
                          ),
                          child: Text('result -->'),
                        ),
                        Text(_value),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'onSubmitted',
                    ),
                    onSubmitted: (str) {
                      setState(() {
                        _value1 = str;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green[400]),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 5.0,
                          ),
                          child: Text('result -->'),
                        ),
                        Text(_value1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    onTap: () {
                      print('onTap');
                    },
                    autocorrect: false,
                    autofocus: false,
                    textAlign: TextAlign.center,
                    dragStartBehavior: DragStartBehavior.start,
                    enabled: true,
                    enableInteractiveSelection: false,
                    buildCounter: (BuildContext context,
                            {int currentLength,
                            int maxLength,
                            bool isFocused}) =>
                        null,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.print),
                      border: OutlineInputBorder(),
                      hintText: 'Wo ty suka',
                      helperText: 'potrewim?',
                      labelText: 'Controller',
                    ),
                    controller: controller,
                    style: TextStyle(color: Colors.blue[300]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green[400]),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 5.0,
                          ),
                          child: Text('controller implementation -->'),
                        ),
                        Text(_value2),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
