import 'package:flutter/material.dart';

import '../modules/responsiveScreen.dart';

class Projects extends StatelessWidget {
  ResponsiveScreen _responsiveScreen;

  Widget _responsiveCard(BuildContext context) {
    return Card(
      child: FractionallySizedBox(
        heightFactor: this._responsiveScreen.heightFactor,
        widthFactor: this._responsiveScreen.widthFactor,
        child: Stack(
          children: <Widget>[],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 600) {
          _responsiveScreen = ResponsiveScreen(30, 20, 0.9, 0.9);
          return _responsiveCard(context);
        } else {
          _responsiveScreen = ResponsiveScreen(60, 30, 0.5, 0.7);
          return _responsiveCard(context);
        }
      },
    );
  }
}
