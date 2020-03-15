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
  String _photoRoute = 'assets/images/_DSC4535.jpg';
  double _padding = 0;
  double _opacity = 0;
  String _name = " Shajith Shantharuban \n";
  String _content = "Programming enthusiast with passion for development and new possibilities. A authentic application represents the personality of the developer. In other words, my work talks the talk and walks the walk. My aim for unique experience and interest of the user is a trait of mine, which effects my work alot. \"Quality over quantity\", that is my motto.";

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
        "About",
        style: Theme.of(context)
            .textTheme
            .headline6
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
          padding: EdgeInsets.only(top: 140, right: 20, left: 20),
          child: SingleChildScrollView(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 1550),
              opacity: _opacity,
              curve: LinearHalfCurve().flipped,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset(
                      _photoRoute,
                      height: MediaQuery.of(context).size.height * 0.64,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 100),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: _name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                  fontSize: responsiveScreen.subTitleSize,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Color.fromRGBO(100, 255, 218, 1),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                              TextSpan(
                                text: _content,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        fontFamily: "Terminal", fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    flex: 2,
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
          padding: EdgeInsets.only(top: 100, right: 20, left: 20, bottom: 20),
          child: SingleChildScrollView(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 1550),
              opacity: _opacity,
              curve: LinearHalfCurve().flipped,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.asset(
                      _photoRoute,
                      height: MediaQuery.of(context).size.height * 0.75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(100, 255, 218, 1),
                    thickness: 1,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: _name,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: responsiveScreen.subTitleSize,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Color.fromRGBO(100, 255, 218, 1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: _content,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontFamily: "Terminal", fontSize: responsiveScreen.subTitleSize * 0.9),
                        ),
                      ],
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

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen responsiveScreen;
    return AnimatedWindow(
      child: LayoutBuilder(
        builder: (context, constraint) {
          if (constraint.maxWidth < 720) {
            responsiveScreen = ResponsiveScreen(
                titleSize: 30, subTitleSize: 20, headlineSize: 15);
            return this._mobileView(context, responsiveScreen);
          } else {
            responsiveScreen = ResponsiveScreen(
                titleSize: 60, subTitleSize: 35, headlineSize: 20);
            return this._desktopView(context, responsiveScreen);
          }
        },
      ),
    );
  }
}
