// Core
import 'package:flutter/material.dart';

// Widgets
import 'widgets/message_list.dart';

class ZaisteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // as far as App is inside widgets app - then this kind of workaround is required
    return MessageList();
  }
}
