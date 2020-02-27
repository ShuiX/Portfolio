import 'package:flutter/material.dart';
import 'package:portfolio/modules/responsiveScreen.dart';

import 'dart:js' as js;

class ProjectRPG extends StatelessWidget {
  ProjectRPG();

  Widget _content(BuildContext context, ResponsiveScreen responsiveScreen,
      double paddingRight, Alignment alignmentForLink) {
    return Card(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: 1.0,
            widthFactor: 1.0,
            child: Image.asset(
              "assets/images/projectDarzana.png",
              fit: BoxFit.cover,
            ),
          ),
          FractionallySizedBox(
            heightFactor: 1.0,
            widthFactor: 1.0,
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 55),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: " Project",
                          style: TextStyle(
                            fontSize: responsiveScreen.titleSize,
                            color: Colors.white,
                            fontFamily: "Terminal",
                            shadows: [
                              Shadow(
                                color: Colors.white.withOpacity(1.0),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: "_",
                          style: TextStyle(
                            fontSize: responsiveScreen.titleSize,
                            color: Colors.blue,
                            fontFamily: "Fantasy",
                            shadows: [
                              Shadow(
                                color: Colors.blue.withOpacity(1.0),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: "Darzana ",
                          style: TextStyle(
                            fontSize: responsiveScreen.titleSize,
                            color: Colors.pink,
                            fontFamily: "Elven",
                            shadows: [
                              Shadow(
                                color: Colors.pink.withOpacity(1.0),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "A Fantasy RPG With \nStorytelling Adventure",
                          style: TextStyle(
                            fontSize: responsiveScreen.titleSize * 0.8,
                            color: Colors.white,
                            fontFamily: "Fantasy",
                            shadows: [
                              Shadow(
                                color: Colors.white.withOpacity(1.0),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: "\n> ",
                          style: TextStyle(
                            fontSize: responsiveScreen.titleSize * 0.6,
                            color: Colors.blue,
                            fontFamily: "Fantasy",
                            shadows: [
                              Shadow(
                                color: Colors.blue.withOpacity(1.0),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: "In Development",
                          style: TextStyle(
                            fontSize: responsiveScreen.titleSize * 0.8,
                            color: Colors.pink,
                            fontFamily: "Fantasy",
                            shadows: [
                              Shadow(
                                color: Colors.pink.withOpacity(1.0),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: alignmentForLink,
                  padding: EdgeInsets.only(bottom: 10, right: paddingRight),
                  child: FlatButton(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "\*Image Taken From Ingame",
                      style: TextStyle(
                        fontSize: responsiveScreen.subTitleSize * 0.7,
                        color: Colors.pink,
                        fontFamily: "Fantasy",
                        shadows: [
                          Shadow(
                            color: Colors.pink.withOpacity(1.0),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () => js.context.callMethod(
                      "open",
                      [
                        "https://shuix-portfolio.web.app/assets/assets/images/projectDarzana.png"
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _paddingRight;
    Alignment _alignmentForLink;
    ResponsiveScreen responsiveScreen;
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 840) {
          responsiveScreen = ResponsiveScreen(
              titleSize: 30, subTitleSize: 20, widthFactor: 1, heightFactor: 1);
          _paddingRight = 0;
          _alignmentForLink = Alignment.bottomCenter;
          return this._content(
              context, responsiveScreen, _paddingRight, _alignmentForLink);
        } else {
          responsiveScreen = ResponsiveScreen(
              titleSize: 60, subTitleSize: 30, widthFactor: 1, heightFactor: 1);
          _paddingRight = 68;
          _alignmentForLink = Alignment.bottomRight;
          return this._content(
              context, responsiveScreen, _paddingRight, _alignmentForLink);
        }
      },
    );
  }
}
