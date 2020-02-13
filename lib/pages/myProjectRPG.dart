import 'package:flutter/material.dart';
import 'package:portfolio/modules/responsiveScreen.dart';

class ProjectRPG extends StatelessWidget {
  ProjectRPG();

  Widget _content(BuildContext context, ResponsiveScreen responsiveScreen) {
    return Card(
      color: Colors.lightBlue,
      child: FractionallySizedBox(
        heightFactor: responsiveScreen.heightFactor,
        widthFactor: responsiveScreen.widthFactor,
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 55),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Project",
                  style: TextStyle(
                    fontSize: responsiveScreen.titleSize,
                    color: Colors.black,
                    fontFamily: "Terminal",
                  ),
                ),
                TextSpan(
                  text: "_",
                  style: TextStyle(
                    fontSize: responsiveScreen.titleSize,
                    color: Colors.black,
                    fontFamily: "Fantasy",
                  ),
                ),
                TextSpan(
                  text: "Darzana",
                  style: TextStyle(
                    fontSize: responsiveScreen.titleSize,
                    color: Colors.pink,
                    fontFamily: "Elven",
                  ),
                )
              ],
            ),
          ),
        ),
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
