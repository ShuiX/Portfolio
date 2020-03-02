import 'package:flutter/material.dart';
import 'package:portfolio/modules/responsiveScreen.dart';

import 'dart:js' as js;

class ProjectSurvey extends StatelessWidget {
  ProjectSurvey();

  Widget _content(BuildContext context, ResponsiveScreen responsiveScreen,
      double iconSize) {
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
                "FlowSurvey\n",
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: responsiveScreen.titleSize,
                      fontFamily: "BlackChancery",
                      color: Colors.white,
                    ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "Survey Done Easy!\nClick on the Arrow for a Demo ",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontSize: responsiveScreen.subTitleSize,
                            color: Colors.white,
                            fontFamily: "BlackChancery",
                          ),
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () => js.context.callMethod(
                        "open",
                        ["https://flowsurvey-2020.web.app/#/startDemo"],
                      ),
                      iconSize: iconSize,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 75, left: 20, right: 20),
              child: Text(
                "//FlowSurvey is still a Work in Progress application and may include some bugs",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: responsiveScreen.subTitleSize * 0.75,
                      color: Colors.white,
                      fontFamily: "BlackChancery",
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
          return this._content(context, responsiveScreen, 50);
        } else {
          responsiveScreen = ResponsiveScreen(
              titleSize: 65, subTitleSize: 30, widthFactor: 1, heightFactor: 1);
          return this._content(context, responsiveScreen, 100);
        }
      },
    );
  }
}
