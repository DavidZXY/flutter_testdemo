import 'package:flutter/material.dart';
import 'package:tests/loginRoute.dart';
import 'package:tests/options.dart';
import 'package:tests/route/homeRoute.dart';
import 'package:tests/route/mineRoute.dart';
import 'package:tests/route/orderRoute.dart';
import 'package:tests/route/shoppingCartRoute.dart';
import 'package:tests/routes.dart';
import 'package:camera/camera.dart';
import 'package:logging/logging.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.black),
      home: MyAppHome(),
      initialRoute: '/loginRoute',
      onGenerateRoute: _getRoute,
      );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/loginRoute') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginRoute(),
      fullscreenDialog: true,
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyAppHome> with TickerProviderStateMixin {
  // AppOptions _options;
  List<BottomNavigationBarItem> _items;
  int _currentIndex = 0;
  var routes = <Widget>[];
  PageController _pageController;

  // Map<String, WidgetBuilder> _buildRoutes() {
  //   return Map<String, WidgetBuilder>.fromIterable(appRoutes,
  //       key: (dynamic route) => '${route.routeName}',
  //       value: (dynamic route) => route.buildRoute);
  // }

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    routes.add(HomeRoute());
    routes.add(OrderRoute());
    routes.add(MineRoute());

    _items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home,),
        title: Text("Home"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment,),
        title: Text("Order"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person,),
        title: Text("Mine"),
      )
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: PageView(
        children: routes,
        controller: _pageController,
        onPageChanged: (index) {
          if (index == _currentIndex) {
            return;
          }

          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        onTap: (int index) {
          if (index == _currentIndex) {
            return;
          }

          _pageController.animateToPage(index,
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 350));
          
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: _items,
      ),
    );
  }

  // Widget _buildTransitionsStack() {
  //   final List<FadeTransition> transitions = <FadeTransition>[];

  //   for (NavigationIconView view in _items)
  //     transitions.add(view.transition(_type, context));

  //   // We want to have the newly animating (fading in) views on top.
  //   transitions.sort((FadeTransition a, FadeTransition b) {
  //     final Animation<double> aAnimation = a.opacity;
  //     final Animation<double> bAnimation = b.opacity;
  //     final double aValue = aAnimation.value;
  //     final double bValue = bAnimation.value;
  //     return aValue.compareTo(bValue);
  //   });

  //   return Stack(children: transitions);
  // }
}

// class NavigationIconView {
//   NavigationIconView({
//     Widget icon,
//     Widget activeIcon,
//     String title,
//     Color color,
//     this.body,
//     TickerProvider vsync,
//   })  : _icon = icon,
//         _color = color,
//         _title = title,
//         item = BottomNavigationBarItem(
//           icon: icon,
//           activeIcon: activeIcon,
//           title: Text(title),
//           backgroundColor: color,
//         ),
//         controller = AnimationController(
//           duration: kAnimationDuration,
//           vsync: vsync,
//         ) {
//     _animation = controller.drive(CurveTween(
//       curve: const Interval(0, 1.0, curve: Curves.elasticInOut),
//     ));
//   }

//   final Widget _icon;
//   final Color _color;
//   final String _title;
//   final BottomNavigationBarItem item;
//   final AnimationController controller;
//   final Widget body;
//   Animation<double> _animation;

//   FadeTransition transition(
//       BottomNavigationBarType type, BuildContext context) {
//     Color iconColor;
//     if (type == BottomNavigationBarType.shifting) {
//       iconColor = _color;
//     } else {
//       final ThemeData themeData = Theme.of(context);
//       iconColor = themeData.brightness == Brightness.light
//           ? themeData.primaryColor
//           : themeData.accentColor;
//     }
    
//     return FadeTransition(
//       opacity: _animation,
//       child: body,
//     );
//   }
// }
