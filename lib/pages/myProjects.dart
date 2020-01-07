import 'package:flutter/material.dart';

import '../modules/responsiveScreen.dart';

class Projects extends StatelessWidget {
  Widget _responsiveCard(
      BuildContext context, ResponsiveScreen responsiveScreen) {
    return Center(
      child: Card(
        child: FractionallySizedBox(
          heightFactor: responsiveScreen.heightFactor,
          widthFactor: responsiveScreen.widthFactor,
          child: Stack(
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.close),
                label: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
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
          responsiveScreen = ResponsiveScreen(30, 20, 0.9, 0.9);
          return _responsiveCard(context, responsiveScreen);
        } else {
          responsiveScreen = ResponsiveScreen(60, 30, 0.7, 0.85);
          return _responsiveCard(context, responsiveScreen);
        }
      },
    );
  }
}
