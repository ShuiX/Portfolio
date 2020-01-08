import 'package:flutter/material.dart';
import 'package:portfolio/modules/animatedWindow.dart';

class Biography extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedWindow(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              "Hello",
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ],
      ),
    );
  }
}
