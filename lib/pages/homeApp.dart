import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:portfolio/modules/LinearHalfCurve.dart';
import 'package:portfolio/modules/responsiveScreen.dart';

class PortfolioApp extends StatefulWidget {
  PortfolioApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PortfolioAppState createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/videos/bgfade.mp4')
        ..initialize()
        ..setLooping(true)
        ..setVolume(0);
  bool _startPortfolio = false;
  ResponsiveScreen _responsiveScreen;

  void _playVideo() {
    setState(() {
      _startPortfolio = true;
    });
    _videoPlayerController.play();
  }

  Widget _startButton(BuildContext context) {
    return FlatButton(
      child: Padding(
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
                    fontSize: this._responsiveScreen.titleSize),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "// Press anywhere to initialize",
                style: TextStyle(
                    color: Theme.of(context).textTheme.subtitle.color,
                    fontSize: this._responsiveScreen.subTitleSize),
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

  Widget _aboutMeButton(BuildContext context, double size) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person,
              size: 150,
              color: Theme.of(context).iconTheme.color,
            ),
            Text("Who Am I?"),
          ],
        ),
        onPressed: () {
          print("hey");
        },
      ),
      width: MediaQuery.of(context).size.width * size,
      height: 300,
    );
  }

  Widget _myProjectsButton(BuildContext context, double size) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.work,
              size: 150,
              color: Theme.of(context).iconTheme.color,
            ),
            Text("My Works"),
          ],
        ),
        onPressed: () {
          print("hey");
        },
      ),
      width: MediaQuery.of(context).size.width * size,
      height: 300,
    );
  }

  Widget _hobbyButton(BuildContext context, double size) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.bubble_chart,
              size: 150,
              color: Theme.of(context).iconTheme.color,
            ),
            Text("Hobby's"),
          ],
        ),
        onPressed: () {
          print("hey");
        },
      ),
      width: MediaQuery.of(context).size.width * size,
      height: 300,
    );
  }

  Widget _portfolioMenu(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              child: Text(
                "The World Is So Vast but Yet So Small",
                style: TextStyle(
                  color: Theme.of(context).textTheme.title.color,
                  fontSize: this._responsiveScreen.titleSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Text(
                "This Is My Big Journey",
                style: TextStyle(
                  color: Theme.of(context).textTheme.subtitle.color,
                  fontSize: this._responsiveScreen.subTitleSize,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              color: Color.fromRGBO(100, 255, 218, 1),
              width: MediaQuery.of(context).size.width * 0.6,
              height: 2,
            ),
            LayoutBuilder(
              builder: (context, constraint) {
                if (constraint.maxWidth < 840) {
                  return Column(
                    children: <Widget>[
                      _aboutMeButton(context, 0.6),
                      Container(height: 20),
                      _myProjectsButton(context, 0.6),
                      Container(height: 20),
                      _hobbyButton(context, 0.6),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _aboutMeButton(context, 0.2),
                          Container(width: 20),
                          _myProjectsButton(context, 0.2),
                          Container(width: 20),
                          _hobbyButton(context, 0.2),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _startPage(BuildContext context) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 2000),
      firstChild: _startButton(context),
      secondChild: _portfolioMenu(context),
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
            ),
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
                return _startPage(context);
              } else {
                _responsiveScreen = ResponsiveScreen(60, 30);
                return _startPage(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
