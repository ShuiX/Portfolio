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

  List<String> _contentText = [
    "AnfangAnfangAnfangAnfangAnfangAnfangAnfangAnfangAnfangAnfang",
    "MainMainMainMainMainMainMainMainMainMainMainMain",
    "SchlussSchlussSchlussSchlussSchlussSchlussSchlussSchlussSchlussSchluss"
  ];
  List<String> _bioListText = [
    "Residence: Kanton Zug",
    "Age: 20",
    "Field Of Work: Software Development",
    "Languages: German, English, Tamil",
  ];

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

  Widget _bioList(BuildContext context, ResponsiveScreen responsiveScreen) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _bioListText
          .map((item) => new ListTile(
                title: Text(
                  item,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontSize: responsiveScreen.headlineSize),
                ),
                leading: Icon(
                  Icons.fiber_manual_record,
                  size: 20,
                ),
              ))
          .toList(),
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
                    child: Container(),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      child: _bioList(context, responsiveScreen),
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
          padding: EdgeInsets.only(top: 120, right: 20, left: 20),
          child: SingleChildScrollView(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 1550),
              opacity: _opacity,
              curve: LinearHalfCurve().flipped,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: _bioList(context, responsiveScreen),
                  ),
                  Divider(
                    color: Color.fromRGBO(100, 255, 218, 1),
                    thickness: 1,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      _contentText[1],
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(100, 255, 218, 1),
                    thickness: 1,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      _contentText[2],
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                ],
              ),
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
            responsiveScreen = ResponsiveScreen(
                titleSize: 30, subTitleSize: 20, headlineSize: 15);
            return this._mobileView(context, responsiveScreen);
          } else {
            responsiveScreen = ResponsiveScreen(
                titleSize: 60, subTitleSize: 30, headlineSize: 20);
            return this._desktopView(context, responsiveScreen);
          }
        },
      ),
    );
  }
}
