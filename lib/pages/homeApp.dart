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

  Widget _itemButton(BuildContext context, double size, String valueText,
      IconData iconData, String navigation) {
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
              iconData,
              size: 150,
              color: Theme.of(context).iconTheme.color,
            ),
            Text(valueText),
          ],
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(navigation);
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
                      _itemButton(context, 0.6, "Who Am I?", Icons.person,
                          "/biography"),
                      Container(height: 20),
                      _itemButton(
                          context, 0.6, "My Works", Icons.work, "/projects"),
                      Container(height: 20),
                      _itemButton(context, 0.6, "Hobby's", Icons.bubble_chart,
                          "/activities"),
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
                          this._itemButton(context, 0.2, "Who Am I?",
                              Icons.person, "/biography"),
                          Container(width: 20),
                          this._itemButton(context, 0.2, "My Works", Icons.work,
                              "/projects"),
                          Container(width: 20),
                          this._itemButton(context, 0.2, "Hobby's",
                              Icons.bubble_chart, "/activities"),
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
      firstChild: this._startButton(context),
      secondChild: this._portfolioMenu(context),
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
                width: this._videoPlayerController.value.size?.width ?? 0,
                height: this._videoPlayerController.value.size?.height ?? 0,
                child: VideoPlayer(_videoPlayerController),
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraint) {
              if (constraint.maxWidth < 840) {
                this._responsiveScreen = ResponsiveScreen(30, 20, 0.9, 0.9);
                return _startPage(context);
              } else {
                this._responsiveScreen = ResponsiveScreen(60, 30, 0.5, 0.7);
                return _startPage(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
