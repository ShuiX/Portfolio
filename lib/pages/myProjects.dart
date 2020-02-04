import 'package:flutter/material.dart';
import 'package:portfolio/modules/LinearHalfCurve.dart';
import 'package:portfolio/modules/animatedBackground.dart';
import 'package:portfolio/modules/animatedWindow.dart';
import 'package:portfolio/modules/responsiveScreen.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  double _opacity = 0;
  Widget _animatedWidget;

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

  void _switchWidget(ResponsiveScreen responsiveScreen) {
    setState(() {
      _animatedWidget = _projectSurvey(context, responsiveScreen);
    });
  }

  Widget _projectSurvey(
      BuildContext context, ResponsiveScreen responsiveScreen) {
    return Card(
      child: FractionallySizedBox(
        heightFactor: responsiveScreen.heightFactor,
        widthFactor: responsiveScreen.widthFactor,
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 55),
          child: Text(
            "FlowSurvey",
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: responsiveScreen.titleSize,
                ),
          ),
        ),
      ),
    );
  }

  Widget _content(BuildContext context, ResponsiveScreen responsiveScreen) {
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
                  .copyWith(fontSize: responsiveScreen.titleSize),
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
              child: _animatedWidget,
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
              onPressed: () => _switchWidget(responsiveScreen),
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
              onPressed: () => _switchWidget(responsiveScreen),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen responsiveScreen;
    return AnimatedWindow(
      child: LayoutBuilder(
        builder: (context, constraint) {
          if (constraint.maxWidth < 840) {
            responsiveScreen = ResponsiveScreen(
                titleSize: 30,
                subTitleSize: 20,
                widthFactor: 1,
                heightFactor: 1);
            this._animatedWidget = _projectSurvey(context, responsiveScreen);
            return this._content(context, responsiveScreen);
          } else {
            responsiveScreen = ResponsiveScreen(
                titleSize: 60,
                subTitleSize: 30,
                widthFactor: 1,
                heightFactor: 1);
            this._animatedWidget = _projectSurvey(context, responsiveScreen);
            return this._content(context, responsiveScreen);
          }
        },
      ),
    );
  }
}
