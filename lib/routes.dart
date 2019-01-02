
import 'package:flutter/widgets.dart';

class AppRoute {
  final String routeName;
  final WidgetBuilder buildRoute;

  const AppRoute({
    @required this.routeName,
    @required this.buildRoute
  });


  @override
    String toString() {
      return '$runtimeType($routeName)';
    }
}

List<AppRoute> appRoutes = <AppRoute>[
];