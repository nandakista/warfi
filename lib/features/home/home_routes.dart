import 'package:desktop_base/features/about/about_page.dart';
import 'package:desktop_base/features/home/home_page.dart';
import 'package:flutter/material.dart';


Widget homeRoute(String? url) {
  switch (url) {
    case HomePage.route:
      return const HomePage();
    case AboutPage.route:
      return const AboutPage();
    default:
      return const HomePage();
  }
}


