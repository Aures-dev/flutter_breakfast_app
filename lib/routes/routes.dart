import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/home_page.dart';


class Routing {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/home':
        return PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 2000),
            child: const HomePage());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("La route n'existe pas !!"),
                  ),
                ));
    }
  }
}