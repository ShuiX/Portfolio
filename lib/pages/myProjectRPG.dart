import 'package:flutter/material.dart';
import 'package:portfolio/modules/responsiveScreen.dart';

class ProjectRPG extends StatelessWidget {
  ProjectRPG();

  Widget _content(BuildContext context, ResponsiveScreen responsiveScreen) {
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen responsiveScreen;
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 840) {
          responsiveScreen = ResponsiveScreen(
              titleSize: 30, subTitleSize: 20, widthFactor: 1, heightFactor: 1);
          return this._content(context, responsiveScreen);
        } else {
          responsiveScreen = ResponsiveScreen(
              titleSize: 60, subTitleSize: 30, widthFactor: 1, heightFactor: 1);
          return this._content(context, responsiveScreen);
        }
      },
    );
  }
}
