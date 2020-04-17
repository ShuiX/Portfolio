import 'package:flutter/material.dart';
import 'package:portfolio/pages/activities.dart';
import 'package:portfolio/pages/biography.dart';
import 'package:portfolio/pages/homeApp.dart';
import 'package:portfolio/pages/myProjects.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Here getting the arguement pushed by navigator.push

    switch (settings.name) {
      case '':
        return MaterialPageRoute(
            builder: (_) => PortfolioApp(
                  title: 'Portfolio',
                ));
        break;
      case '/':
        return MaterialPageRoute(
            builder: (_) => PortfolioApp(
                  title: 'Portfolio',
                ));
        break;
      case '/projects':
        return PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) => Projects(),
          opaque: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return _animationBuilder(animation, child, 0.0, 1.0);
          },
        );
        break;
      case '/activities':
        return PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) => Activities(),
          opaque: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return _animationBuilder(animation, child, 1.0, 0.0);
          },
        );
        break;
      case '/biography':
        return PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) => Biography(),
          opaque: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return _animationBuilder(animation, child, -1.0, 0.0);
          },
        );
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

  static dynamic _animationBuilder(Animation<double> animation, Widget child,
      double bOffHor, double bOffVer) {
    var begin = Offset(bOffHor, bOffVer);
    var end = Offset.zero;
    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
