import 'package:flutter/material.dart';
import 'package:portfolio/modules/responsiveScreen.dart';

class ProjectSurvey extends StatelessWidget {
  ProjectSurvey();

  Widget _content(BuildContext context, ResponsiveScreen responsiveScreen) {
    return Card(
      child: FractionallySizedBox(
        heightFactor: responsiveScreen.heightFactor,
        widthFactor: responsiveScreen.widthFactor,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 55),
              child: Text(
                "FlowSurvey",
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: responsiveScreen.titleSize,
                      fontFamily: "BlackChancery",
                      color: Colors.white,
                    ),
              ),
            ),
          ],
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
