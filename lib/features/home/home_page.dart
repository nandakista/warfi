import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      title: 'Home',
      canBack: false,
      child: Container(),
    );
  }
}