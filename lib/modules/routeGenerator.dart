import 'package:flutter/material.dart';
import 'package:portfolio/pages/activities.dart';
import 'package:portfolio/pages/biography.dart';
import 'package:portfolio/pages/homeApp.dart';
import 'package:portfolio/pages/myProjects.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Here getting the arguement pushed by navigator.push
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => PortfolioApp(
                  title: 'Portfolio',
                ));
        break;
      case '/projects':
        return MaterialPageRoute(builder: (_) => Projects());
        break;
      case '/activities':
        return MaterialPageRoute(builder: (_) => Activities());
        break;
      case '/biography':
        return MaterialPageRoute(builder: (_) => Biography());
        break;
      default:
        return _errorRoute();
        break;
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Error',
                  style: TextStyle(
                      fontFamily: 'Terminal',
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 100),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
