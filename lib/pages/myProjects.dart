import 'package:flutter/material.dart';

import '../modules/responsiveScreen.dart';

class Projects extends StatelessWidget {
  Widget _responsiveCard(
      BuildContext context, ResponsiveScreen responsiveScreen) {
    return Card(
      child: FractionallySizedBox(
        heightFactor: responsiveScreen.heightFactor,
        widthFactor: responsiveScreen.widthFactor,
        child: Stack(
          children: <Widget>[],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen responsiveScreen;
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 600) {
          responsiveScreen = ResponsiveScreen(30, 20, 0.9, 0.9);
          return _responsiveCard(context, responsiveScreen);
        } else {
          responsiveScreen = ResponsiveScreen(60, 30, 0.5, 0.7);
          return _responsiveCard(context, responsiveScreen);
        }
      },
    );
  }
}
