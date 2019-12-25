import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../modules/LinearHalfCurve.dart';
import '../modules/responsiveScreen.dart';

class PortfolioApp extends StatefulWidget {
  PortfolioApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PortfolioAppState createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/videos/bgfade.mp4');
  bool _startPortfolio = false;
  ResponsiveScreen _responsiveScreen;

  void _playVideo() {
    setState(() {
      _startPortfolio = true;
    });
    _videoPlayerController.play();
  }

  @override
  void initState() {
    super.initState();
    _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
  }

  Widget _startButton(BuildContext context, ResponsiveScreen responsiveScreen) {
    return FlatButton(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 200),
              child: Text(
                "function init();",
                style: TextStyle(
                    color: Theme.of(context).textTheme.title.color,
                    fontSize: responsiveScreen.titleSize),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "// Press anywhere to initialize",
                style: TextStyle(
                    color: Theme.of(context).textTheme.subtitle.color,
                    fontSize: responsiveScreen.subTitleSize),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      color: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      disabledColor: Colors.transparent,
      onPressed: () {
        if (_startPortfolio == true) {
          return null;
        } else {
          _playVideo();
        }
      },
    );
  }

  Widget _welcomePage(BuildContext context, ResponsiveScreen responsiveScreen) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: Text(
            "\"The World Is So Vast but Yet So Small\",",
            style: TextStyle(
                color: Theme.of(context).textTheme.title.color,
                fontSize: responsiveScreen.titleSize),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _startPage(BuildContext context, ResponsiveScreen responsiveScreen) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 2000),
      firstChild: _startButton(context, responsiveScreen),
      secondChild: _welcomePage(context, responsiveScreen),
      crossFadeState: _startPortfolio
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      firstCurve: LinearHalfCurve(),
      secondCurve: LinearHalfCurve().flipped,
      layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
        return Stack(
          children: <Widget>[
            Positioned(
              key: bottomChildKey,
              child: bottomChild,
            ),
            Positioned(
              key: topChildKey,
              child: topChild,
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _videoPlayerController.value.size?.width ?? 0,
                height: _videoPlayerController.value.size?.height ?? 0,
                child: VideoPlayer(_videoPlayerController),
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraint) {
              if (constraint.maxWidth < 600) {
                _responsiveScreen = ResponsiveScreen(30, 20);
                return FractionallySizedBox(
                  child: _startPage(context, _responsiveScreen),
                );
              } else {
                _responsiveScreen = ResponsiveScreen(60, 30);
                return _startPage(context, _responsiveScreen);
              }
            },
          ),
        ],
      ),
    );
  }
}
