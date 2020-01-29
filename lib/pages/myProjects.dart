import 'package:flutter/material.dart';
import 'package:portfolio/modules/LinearHalfCurve.dart';
import 'package:portfolio/modules/animatedWindow.dart';
import 'package:portfolio/modules/responsiveScreen.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  Alignment _alignment = Alignment.center;
  double _padding = 0;
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
        this._alignment = Alignment.topCenter;
        this._padding = 55;
        this._opacity = 1;
      });
    });
  }

  Widget _projectSurvey(
      BuildContext context, ResponsiveScreen responsiveScreen) {
    return Container();
  }

  Widget _content(BuildContext context, ResponsiveScreen responsiveScreen) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 900),
          padding: EdgeInsets.only(top: _padding),
          alignment: _alignment,
          curve: Curves.easeInOut,
          child: Text(
            "My Projects",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontSize: responsiveScreen.titleSize),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: AnimatedOpacity(
            opacity: this._opacity,
            duration: Duration(milliseconds: 1550),
            curve: LinearHalfCurve().flipped,
            child: AnimatedSwitcher(
              duration: Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) =>
                  RotationTransition(
                child: child,
                turns: animation,
              ),
              child: _animatedWidget,
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
            responsiveScreen =
                ResponsiveScreen(titleSize: 30, subTitleSize: 20);
            return this._content(context, responsiveScreen);
          } else {
            responsiveScreen =
                ResponsiveScreen(titleSize: 60, subTitleSize: 30);
            return this._content(context, responsiveScreen);
          }
        },
      ),
    );
  }
}
