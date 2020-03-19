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
        AnimatedSwitcher(
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
  
  final String _picPath = "assets/images/gaming.png";
  final String _contentText =
      "As someone who grew up with the internet culture, i was also driven into the gaming topic when it was gaining more popularity on the web. At last it became one of my hobbies.\n\n-Competetive Achievements: Elite Player in Super Smash Bros Ultimate / Ranked Diamond in Overwatch / Doing Speedruns, Challenges (mostly in Kingdom Hearts games)\n\n-Overwatch?: Overwatch is a First Person Shooter that needs strong muscle memories and abstract thinking with your team of 6 people. What makes this game so good is that it is complex. There is no brainless shooting or else its gonna cost the game\n\n-Super Smash Bros Ultimte?: It's brawl a game which includes alot of iconic videogame-characters as playable characters. This game requires alot of foreshadowing of your enemies movements. Observing, reacting and thinking is required to win against your enemy.\n\n-Speedrun / Challenges?: Speedruns and Challenges are mostly on singleplayer platform games. They require alot of precision, memory muscles and most importantly patience.";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: LayoutBuilder(
              builder: (context, constraint) {
                if (constraint.maxWidth < 720) {
                  return Image.asset(
                    _picPath,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                  );
                } else {
                  return Image.asset(
                    _picPath,
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height,
                  );
                }
              },
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.5),
          ),
          child: LayoutBuilder(
            builder: (context, constraint) {
              if (constraint.maxWidth < 720) {
                return SingleChildScrollView(
                  child: Container(
                    child: Text(
                      "\n\n\n" + _contentText,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontSize: 20,
                        color: Color.fromRGBO(100, 255, 218, 1),
                        fontFamily: "Terminal",
                        shadows: [
                          Shadow(
                            color: Color.fromRGBO(100, 255, 218, 1),
                            blurRadius: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Text(
                  _contentText,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontSize: 25,
                    color: Color.fromRGBO(100, 255, 218, 1),
                    fontFamily: "Terminal",
                    shadows: [
                      Shadow(
                        color: Color.fromRGBO(100, 255, 218, 1),
                        blurRadius: 5,
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class EditingActivity extends StatelessWidget {
  EditingActivity();

  final String _picPath = "assets/images/editing.png";
  final String _contentText = "I like to watch alot of movies, animes and youtube videos which brought me into editing later. My goal behind my content is to entertain the viewer behind the screen, so i usually put alot of efforts into my videos (adding transitions, effects and clipping).\n\n\nThese are the tools i use for editing:\n\n- Sony Vegas and Adobe Premier for video-editing\n\n- Adobe Photoshop and 3D Paint for image-editing";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: LayoutBuilder(
              builder: (context, constraint) {
                if (constraint.maxWidth < 720) {
                  return Image.asset(
                    _picPath,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                  );
                } else {
                  return Image.asset(
                    _picPath,
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height,
                  );
                }
              },
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 40, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.5),
          ),
          child: LayoutBuilder(
            builder: (context, constraint) {
              if (constraint.maxWidth < 720) {
                return SingleChildScrollView(
                  child: Container(
                    child: Text(
                      "\n\n\n" + _contentText,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontSize: 20,
                        color: Color.fromRGBO(100, 255, 218, 1),
                        fontFamily: "Terminal",
                        shadows: [
                          Shadow(
                            color: Color.fromRGBO(100, 255, 218, 1),
                            blurRadius: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Text(
                  _contentText,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontSize: 30,
                    color: Color.fromRGBO(100, 255, 218, 1),
                    fontFamily: "Terminal",
                    shadows: [
                      Shadow(
                        color: Color.fromRGBO(100, 255, 218, 1),
                        blurRadius: 5,
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class MusicActivity extends StatelessWidget {
  MusicActivity();

  @override
  Widget build(BuildContext context) {
    return Text("Musician");
  }
}
