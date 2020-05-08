import 'package:flutter/material.dart';
import 'package:portfolio/modules/LinearHalfCurve.dart';
import 'package:portfolio/modules/animatedWindow.dart';
import 'package:portfolio/modules/responsiveScreen.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  Alignment _alignment1 = Alignment.center;
  Alignment _alignment2 = Alignment.topCenter;
  Alignment _alignment3 = Alignment.topCenter;
  double _padding1 = 0;
  double _opacity1 = 0;
  double _opacity2 = 0;
  double _opacity3 = 0;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() async {
    Future.delayed(Duration(milliseconds: 750)).then((_) {
      setState(() {
        _alignment1 = Alignment.topCenter;
        _padding1 = 55;
      });
    });
    Future.delayed(Duration(milliseconds: 500)).then((_) {
      setState(() {
        _opacity1 = 1;
        _alignment2 = Alignment.topLeft;
      });
    });
    Future.delayed(Duration(milliseconds: 500)).then((_) {
      setState(() {
        _opacity2 = 1;
        _alignment3 = Alignment.topLeft;
      });
    });
    Future.delayed(Duration(milliseconds: 500)).then((_) {
      setState(() {
        _opacity3 = 1;
      });
    });
  }

  Widget _desktopView(BuildContext context, ResponsiveScreen responsiveScreen) {
    return Stack(
      children: [
        this._title(context, responsiveScreen),
        this._interestedText(context, responsiveScreen, 200, 100),
        this._contactMe(context, responsiveScreen, 290, 100),
        this._eMailAndNumber(context, responsiveScreen, 200),
      ],
    );
  }

  Widget _mobileView(BuildContext context, ResponsiveScreen responsiveScreen) {
    return Stack(
      children: [
        this._title(context, responsiveScreen),
        this._interestedText(context, responsiveScreen, 150, 20),
        this._contactMe(context, responsiveScreen, 240, 20),
        this._eMailAndNumber(context, responsiveScreen, 80),
      ],
    );
  }

  Widget _contactMe(BuildContext context, ResponsiveScreen responsiveScreen,
      double paddinTop, double paddingLeft) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 2000),
      opacity: _opacity2,
      curve: LinearHalfCurve().flipped,
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: paddinTop, left: paddingLeft),
        duration: Duration(milliseconds: 2000),
        alignment: _alignment2,
        curve: Curves.easeIn,
        child: Text(
          " Then reach me on E-Mail || Mobile \n (including WhatsApp and Telegram) ",
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontSize: responsiveScreen.subTitleSize - 5,
              ),
        ),
      ),
    );
  }

  Widget _eMailAndNumber(BuildContext context,
      ResponsiveScreen responsiveScreen, double paddingBottom) {
    return AnimatedOpacity(
      opacity: _opacity3,
      curve: LinearHalfCurve().flipped,
      duration: Duration(milliseconds: 2000),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 2000),
        padding: EdgeInsets.only(bottom: paddingBottom),
        alignment: Alignment.bottomCenter,
        child: LayoutBuilder(builder: (context, constraint) {
          if (constraint.maxWidth < 840) {
            return SelectableText(
              "shajith@me.com |\n| +41 78 834 38 64",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontSize: responsiveScreen.titleSize - 10,
                shadows: [
                  Shadow(
                    color: Color.fromRGBO(100, 255, 218, 1),
                    blurRadius: 5,
                  ),
                ],
              ),
            );
          } else {
            return SelectableText(
              "shajith@me.com || +41 78 834 38 64",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontSize: responsiveScreen.titleSize - 10,
                shadows: [
                  Shadow(
                    color: Color.fromRGBO(100, 255, 218, 1),
                    blurRadius: 5,
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  Widget _interestedText(BuildContext context,
      ResponsiveScreen responsiveScreen, double paddinTop, double paddingLeft) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 2000),
      opacity: _opacity1,
      curve: LinearHalfCurve().flipped,
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: paddinTop, left: paddingLeft),
        duration: Duration(milliseconds: 2000),
        alignment: _alignment3,
        curve: Curves.easeIn,
        child: Text(
          " Interested? ",
          style: Theme.of(context).textTheme.subtitle1.copyWith(
            fontSize: responsiveScreen.subTitleSize,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Color.fromRGBO(100, 255, 218, 1),
                blurRadius: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(BuildContext context, ResponsiveScreen responsiveScreen) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 900),
      padding: EdgeInsets.only(top: _padding1),
      alignment: _alignment1,
      curve: Curves.easeInOut,
      child: Text(
        " Contact ",
        style: Theme.of(context).textTheme.headline6.copyWith(
          fontSize: responsiveScreen.titleSize,
          shadows: [
            Shadow(
              color: Color.fromRGBO(100, 255, 218, 1),
              blurRadius: 5,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedWindow(
      child: LayoutBuilder(
        builder: (context, constraint) {
          if (constraint.maxWidth < 840) {
            return this._mobileView(
                context,
                ResponsiveScreen(
                    titleSize: 30,
                    subTitleSize: 20,
                    widthFactor: 1,
                    heightFactor: 1));
          } else {
            return this._desktopView(
                context,
                ResponsiveScreen(
                    titleSize: 60,
                    subTitleSize: 40,
                    widthFactor: 1,
                    heightFactor: 1));
          }
        },
      ),
    );
  }
}
