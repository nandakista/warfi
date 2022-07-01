// ignore_for_file: constant_identifier_names
import 'package:desktop_base/app/app_service.dart';

enum Flavors {
  PRODUCTION,
  STAGING,
  DEVELOPMENT,
}

class AppConfig {
  static AppConfig get to => locator<AppConfig>();

  late Config appConfig;
  Config get get => appConfig;
  set setFlavor(Config config) => appConfig = config;

  static init(Flavors flavors) {
    switch (flavors) {
      case Flavors.PRODUCTION:
        AppConfig.to.setFlavor = Config(
          midtransClientKey: 'Mid-client-KS',
          midtransSnap: 'https://app.midt',
          baseUrl: 'https://test.infini',
          socketUrl: 'https://ws.faja',
        );
        break;
      case Flavors.STAGING:
        // TODO: Handle this case.
        break;
      case Flavors.DEVELOPMENT:
        AppConfig.to.setFlavor = Config(
          midtransClientKey: 'SB-Mid-clie',
          midtransSnap: 'https://app.sandbox.mi',
          baseUrl: 'https://test.infi',
          socketUrl: 'https://ws.faja',
        );
        break;
    }
  }
}

class Config {
  Config({
    required this.midtransClientKey,
    required this.midtransSnap,
    required this.baseUrl,
    required this.socketUrl,
  });
  String midtransClientKey;
  String midtransSnap;
  String baseUrl;
  String socketUrl;
}
