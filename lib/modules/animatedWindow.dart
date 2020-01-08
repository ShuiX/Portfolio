import 'package:flutter/material.dart';
import 'package:portfolio/modules/animatedBackground.dart';

import 'package:portfolio/modules/responsiveScreen.dart';

class AnimatedWindow extends StatelessWidget {
  final Widget child;

  AnimatedWindow({this.child});

  Widget _responsiveCard(
      BuildContext context, ResponsiveScreen responsiveScreen) {
    return Center(
      child: Card(
        child: FractionallySizedBox(
          heightFactor: responsiveScreen.heightFactor,
          widthFactor: responsiveScreen.widthFactor,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: AnimatedBackground(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  child: Container(
                    height: 50,
                    child: Icon(Icons.close),
                  ),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              this.child,
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
