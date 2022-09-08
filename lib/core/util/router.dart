import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/page/cat_breeds_page.dart';
import 'package:prueba_tecnica/src/page/splash.dart';
import 'constants.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH_ROUTE:
        return MaterialPageRoute(builder: (_) => const Splash());
      case CAT_BREEDS:
        return MaterialPageRoute(builder: (_) => const CatBreedPage());

      default:
        return MaterialPageRoute(builder: (_) => const CatBreedPage());
    }
  }
}
