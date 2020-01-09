import 'package:flutter/material.dart';
import 'package:portfolio/modules/animatedWindow.dart';
import 'package:portfolio/modules/responsiveScreen.dart';

class Activities extends StatelessWidget {
  Widget _content(BuildContext context, ResponsiveScreen responsiveScreen) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Text(
            "Along with other Skills",
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontSize: responsiveScreen.titleSize),
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
          if (constraint.maxWidth < 840) {
            responsiveScreen =
                ResponsiveScreen(titleSize: 30, subTitleSize: 20);
            return this._content(context, responsiveScreen);
          } else {
            responsiveScreen =
                ResponsiveScreen(titleSize: 60, subTitleSize: 30);
            return this._content(context, responsiveScreen);
          }
        },
      ),
    );
  }
}
