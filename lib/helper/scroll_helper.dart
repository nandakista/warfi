import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ----- Hide Scroll View
class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
  };
}