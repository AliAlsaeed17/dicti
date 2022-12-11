import 'package:dicti/screens/home/home_screen.dart';
import 'package:dicti/screens/word_details/word_details_screen.dart';
import 'package:dicti/screens/words_list/words_list_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String homeRoute = "/";
  static const String wordsListRoute = "/wordsList";
  static const String wordDetialsRoute = "/wordDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.wordsListRoute:
      //return MaterialPageRoute(builder: (_) => WordsListScreen());
      case Routes.wordDetialsRoute:
      //return MaterialPageRoute(builder: (_) => WordDetailsScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("No route found"),
        ),
      ),
    );
  }
}
