import 'package:flutter/material.dart';
import 'package:portfolio/modules/LinearHalfCurve.dart';
import 'package:portfolio/modules/animatedWindow.dart';
import 'package:portfolio/modules/responsiveScreen.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  Alignment _alignment = Alignment.center;
  double _padding = 0;
  double _opacity = 0;
  double _iconSize = 30;
  Widget _currentWidget;

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

  Widget _selection() {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(milliseconds: 1550),
      curve: LinearHalfCurve().flipped,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.videogame_asset),
            iconSize: _iconSize,
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.music_note),
            iconSize: _iconSize,
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.ondemand_video),
            iconSize: _iconSize,
            onPressed: null,
          ),
        ],
      ),
    );
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
            "Activities",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontSize: responsiveScreen.titleSize),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            reverseDuration: Duration(milliseconds: 500),
            child: _currentWidget,
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
            _iconSize = 50;
            return this._content(
              context,
              responsiveScreen,
            );
          } else {
            responsiveScreen =
                ResponsiveScreen(titleSize: 60, subTitleSize: 30);
            _iconSize = 100;
            return this._content(
              context,
              responsiveScreen,
            );
          }
        },
      ),
    );
  }
}
