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
  double _backOpacity = 0;
  double _iconSize = 30;
  bool _inPageState = false;
  Curve _curve = LinearHalfCurve().flipped;
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

  dynamic _changeWidget(String widgetName) {
    if (_inPageState != true) {
      setState(() {
      this._inPageState = true;
      this._backOpacity = 1;
      this._curve = Curves.easeInOut;
      this._opacity = 0;
      switch (widgetName) {
        case "games":
          this._currentWidget = GamingActivity();
          break;
        case "music":
          this._currentWidget = MusicActivity();
          break;
        case "editing":
          this._currentWidget = EditingActivity();
          break;
        default:
          break;
      }
    });
    } else {
      return null;
    }
  }

  dynamic _goBack() {
    setState(() {
      this._inPageState = false;
      this._curve = LinearHalfCurve().flipped;
      this._backOpacity = 0;
      this._currentWidget = null;
      this._opacity = 1;
    });
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
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(milliseconds: 1550),
            curve: _curve,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.videogame_asset),
                  iconSize: _iconSize,
                  tooltip: "Gaming",
                  onPressed: () => _changeWidget("games"),
                ),
                IconButton(
                  icon: Icon(Icons.music_note),
                  iconSize: _iconSize,
                  tooltip: "Music",
                  onPressed: () => _changeWidget("music"),
                ),
                IconButton(
                  icon: Icon(Icons.ondemand_video),
                  iconSize: _iconSize,
                  tooltip: "Video Editing",
                  onPressed: () => _changeWidget("editing"),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 2000),
            reverseDuration: Duration(milliseconds: 750),
            switchInCurve: LinearHalfCurve().flipped,
            transitionBuilder: (Widget child, Animation<double> animation) =>
                ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: _currentWidget,
          ),
        ),
        AnimatedOpacity(
          opacity: _backOpacity,
          duration: Duration(milliseconds: 1250),
          child: Container(
            alignment: Alignment.bottomLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => _goBack(),
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

class GamingActivity extends StatelessWidget {
  GamingActivity();

  @override
  Widget build(BuildContext context) {
    return Text("Gamer");
  }
}

class EditingActivity extends StatelessWidget {
  EditingActivity();

  @override
  Widget build(BuildContext context) {
    return Text("Editing");
  }
}

class MusicActivity extends StatelessWidget {
  MusicActivity();

  @override
  Widget build(BuildContext context) {
    return Text("Musician");
  }
}
