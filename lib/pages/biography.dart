import 'package:flutter/material.dart';
import 'package:portfolio/modules/LinearHalfCurve.dart';
import 'package:portfolio/modules/animatedWindow.dart';
import 'package:portfolio/modules/responsiveScreen.dart';

class Biography extends StatefulWidget {
  @override
  _BiographyState createState() => _BiographyState();
}

class _BiographyState extends State<Biography> {
  Alignment _alignment = Alignment.center;
  double _padding = 0;
  double _opacity = 0;

  List<String> _contentText = ["Anfang", "Main", "Schluss"];

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() async {
    Future.delayed(Duration(milliseconds: 750)).then((_) {
      setState(() {
        this._alignment = Alignment.topCenter;
        this._padding = 55;
        this._opacity = 1;
      });
    });
  }

  Widget _title(BuildContext context, ResponsiveScreen responsiveScreen) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 900),
      padding: EdgeInsets.only(top: _padding),
      alignment: _alignment,
      curve: Curves.easeInOut,
      child: Text(
        "Biography",
        style: Theme.of(context)
            .textTheme
            .title
            .copyWith(fontSize: responsiveScreen.titleSize),
      ),
    );
  }

  Widget _desktopView(BuildContext context, ResponsiveScreen responsiveScreen) {
    return Stack(
      children: <Widget>[
        _title(context, responsiveScreen),
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 150, right: 20, left: 20),
          child: SingleChildScrollView(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 1550),
              opacity: _opacity,
              curve: LinearHalfCurve().flipped,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      child: Text(
                        _contentText[0],
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        _contentText[1],
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        _contentText[2],
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _mobileView(BuildContext context, ResponsiveScreen responsiveScreen) {
    return Stack(
      children: <Widget>[
        _title(context, responsiveScreen),
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 80, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[],
            ),
          ),
        )
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
            return this._mobileView(context, responsiveScreen);
          } else {
            responsiveScreen =
                ResponsiveScreen(titleSize: 60, subTitleSize: 30);
            return this._desktopView(context, responsiveScreen);
          }
        },
      ),
    );
  }
}
