import 'package:fluent_ui/fluent_ui.dart';

class BaseNavigator extends StatelessWidget {
  final Widget Function(String?) pages;
  final String? initialRoute;

  const BaseNavigator({
    Key? key,
    required this.pages,
    this.initialRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalKey<NavigatorState>(),
      initialRoute: initialRoute.toString(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return FluentPageRoute(
          settings: routeSettings,
          builder: (context) {
            return pages(routeSettings.name);
          },
        );
      },
    );
  }
}
