import 'package:flutter/material.dart';
import 'package:flutter_breakfast_app/pages/show_page.dart';
import 'package:page_transition/page_transition.dart';

import '../models/diet.dart';
import '../pages/home_page.dart';
import '../pages/intro_screen.dart';

class Routing {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return PageTransition(
        type: PageTransitionType.fade,
        child: IntroScreen());
      case '/home':
        return PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 2000),
            child: const HomePage());
      case '/show':
        final diet = routeSettings.arguments as Diet; // Récupérer l'argument
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 2000),
          child: ShowPage(diet: diet), // Passer l'argument à ShowPage
        );

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
