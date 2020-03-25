import 'package:flutter/material.dart';
import 'package:portfolio/modules/LinearHalfCurve.dart';
import 'package:portfolio/modules/animatedBackground.dart';
import 'package:portfolio/modules/animatedWindow.dart';
import 'package:portfolio/modules/responsiveScreen.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  double _opacity = 0;
  int _projectIndx = 0;
  ResponsiveScreen _responsiveScreen;
  List<Widget> _projects = [ProjectSurvey(), ProjectRPG()];

  @override
  void initState() {
    super.initState();
    _timing();
  }

  void _timing() async {
    Future.delayed(Duration(milliseconds: 750)).then((_) {
      setState(() {
        this._opacity = 1;
      });
    });
  }

  Widget _content(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          duration: Duration(milliseconds: 900),
          opacity: 1 - _opacity,
          curve: Curves.easeInOut,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "My Projects",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontSize: this._responsiveScreen.titleSize),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: AnimatedOpacity(
            opacity: this._opacity,
            duration: Duration(milliseconds: 1550),
            curve: LinearHalfCurve().flipped,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              reverseDuration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) =>
                  FadeTransition(
                child: child,
                opacity: animation,
              ),
              child: _projects[_projectIndx],
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 1550),
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(bottom: 15, left: 15),
            child: FloatingActionButton(
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: AnimatedBackground(),
                  ),
                  Center(
                    child: Icon(Icons.arrow_back),
                  ),
                ],
              ),
              heroTag: "btnBack",
              onPressed: () {
                if (_projectIndx - 1 < 0) {
                  _projectIndx = _projects.length;
                }
                setState(() {
                  --_projectIndx;
                });
              },
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 1550),
          child: Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(bottom: 15, right: 15),
            child: FloatingActionButton(
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: AnimatedBackground(),
                  ),
                  Center(
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
              heroTag: "btnForward",
              onPressed: () {
                if (_projectIndx + 1 >= _projects.length) {
                  _projectIndx = -1;
                }
                setState(() {
                  ++_projectIndx;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedWindow(
      child: LayoutBuilder(
        builder: (context, constraint) {
          if (constraint.maxWidth < 840) {
            this._responsiveScreen = ResponsiveScreen(
                titleSize: 30,
                subTitleSize: 20,
                widthFactor: 1,
                heightFactor: 1);
            return this._content(context);
          } else {
            this._responsiveScreen = ResponsiveScreen(
                titleSize: 60,
                subTitleSize: 30,
                widthFactor: 1,
                heightFactor: 1);
            return this._content(context);
          }
        },
      ),
    );
  }
}

class ProjectRPG extends StatelessWidget {
  ProjectRPG();

  Widget _content(BuildContext context, ResponsiveScreen responsiveScreen,
      double paddingRight, Alignment alignmentForLink) {
    return Card(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: 1.0,
            widthFactor: 1.0,
            child: Image.asset(
              "assets/images/projectDarzana.png",
              fit: BoxFit.cover,
            ),
          ),
          FractionallySizedBox(
            heightFactor: 1.0,
            widthFactor: 1.0,
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 55),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: " Project",
                          style: TextStyle(
                            fontSize: responsiveScreen.titleSize,
                            color: Colors.white,
                            fontFamily: "Terminal",
                            shadows: [
                              Shadow(
                                color: Colors.white.withOpacity(1.0),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: "_",
                          style: TextStyle(
                            fontSize: responsiveScreen.titleSize,
                            color: Colors.blue,
                            fontFamily: "Fantasy",
                            shadows: [
                              Shadow(
                                color: Colors.blue.withOpacity(1.0),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: "Darzana ",
                          style: TextStyle(
                            fontSize: responsiveScreen.titleSize,
                            color: Colors.pink,
                            fontFamily: "Elven",
                            shadows: [
                              Shadow(
                                color: Colors.pink.withOpacity(1.0),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "A Fantasy RPG With \nStorytelling Adventure",
                          style: TextStyle(
                            fontSize: responsiveScreen.titleSize * 0.8,
                            color: Colors.white,
                            fontFamily: "Fantasy",
                            shadows: [
                              Shadow(
                                color: Colors.white.withOpacity(1.0),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: "\n> ",
                          style: TextStyle(
                            fontSize: responsiveScreen.titleSize * 0.6,
                            color: Colors.blue,
                            fontFamily: "Fantasy",
                            shadows: [
                              Shadow(
                                color: Colors.blue.withOpacity(1.0),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: "In Development",
                          style: TextStyle(
                            fontSize: responsiveScreen.titleSize * 0.8,
                            color: Colors.pink,
                            fontFamily: "Fantasy",
                            shadows: [
                              Shadow(
                                color: Colors.pink.withOpacity(1.0),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: alignmentForLink,
                  padding: EdgeInsets.only(bottom: 10, right: paddingRight),
                  child: FlatButton(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "\*Image Taken From Ingame",
                      style: TextStyle(
                        fontSize: responsiveScreen.subTitleSize * 0.7,
                        color: Colors.pink,
                        fontFamily: "Fantasy",
                        shadows: [
                          Shadow(
                            color: Colors.pink.withOpacity(1.0),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () => js.context.callMethod(
                      "open",
                      [
                        "https://shajith-portfolio.web.app/assets/assets/images/projectDarzana.png"
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _paddingRight;
    Alignment _alignmentForLink;
    ResponsiveScreen responsiveScreen;
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 840) {
          responsiveScreen = ResponsiveScreen(
              titleSize: 30, subTitleSize: 20, widthFactor: 1, heightFactor: 1);
          _paddingRight = 0;
          _alignmentForLink = Alignment.bottomCenter;
          return this._content(
              context, responsiveScreen, _paddingRight, _alignmentForLink);
        } else {
          responsiveScreen = ResponsiveScreen(
              titleSize: 60, subTitleSize: 30, widthFactor: 1, heightFactor: 1);
          _paddingRight = 68;
          _alignmentForLink = Alignment.bottomRight;
          return this._content(
              context, responsiveScreen, _paddingRight, _alignmentForLink);
        }
      },
    );
  }
}

class ProjectSurvey extends StatelessWidget {
  ProjectSurvey();

  Widget _content(BuildContext context, ResponsiveScreen responsiveScreen,
      double iconSize) {
    return Card(
      child: FractionallySizedBox(
        heightFactor: responsiveScreen.heightFactor,
        widthFactor: responsiveScreen.widthFactor,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 55),
              child: Text(
                "FlowSurvey\n",
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: responsiveScreen.titleSize,
                      fontFamily: "BlackChancery",
                      color: Colors.white,
                    ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "Survey Done Easy!\nClick on the Arrow for a Demo ",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontSize: responsiveScreen.subTitleSize,
                            color: Colors.white,
                            fontFamily: "BlackChancery",
                          ),
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () => js.context.callMethod(
                        "open",
                        ["https://flowsurvey-2020.web.app/#/startDemo"],
                      ),
                      iconSize: iconSize,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 75, left: 20, right: 20),
              child: Text(
                "//FlowSurvey is still a Work in Progress application and may include some bugs",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: responsiveScreen.subTitleSize * 0.75,
                      color: Colors.white,
                      fontFamily: "BlackChancery",
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen responsiveScreen;
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 840) {
          responsiveScreen = ResponsiveScreen(
              titleSize: 30, subTitleSize: 20, widthFactor: 1, heightFactor: 1);
          return this._content(context, responsiveScreen, 50);
        } else {
          responsiveScreen = ResponsiveScreen(
              titleSize: 65, subTitleSize: 30, widthFactor: 1, heightFactor: 1);
          return this._content(context, responsiveScreen, 100);
        }
      },
    );
  }
}
