import 'package:desktop_base/app/app_constant.dart';
import 'package:desktop_base/themes/app_style.dart';
import 'package:desktop_base/widgets/content_wrapper.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const String route = '/about';
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentWrapper(
      title: 'About',
      canBack: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppConst.appName, style: AppStyle.headline1),
            Text(AppConst.appTag, style: AppStyle.subtitle3,),
            const SizedBox(height: 30),
            Text(
              'This is Base Code for Desktop Application Project using Flutter Framework\n'
              'The Code was developed using : \n'
              '1. Fluent UI\n'
              '2. Dio\n'
              '3. Moor Database\n',
              style: AppStyle.subtitle4,
            ),
            const Spacer(),
            Text('Created by Varcant',
                style: AppStyle.normal.copyWith(fontWeight: FontWeight.w300)),
            const SizedBox(height: 12),
            Text(AppConst.copyright, style: AppStyle.subtitle4,)
          ],
        ),
      ),
    );
  }
}
