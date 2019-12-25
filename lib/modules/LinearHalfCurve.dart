import 'package:flutter/material.dart';

class LinearHalfCurve extends Curve {
  @override
  double transformInternal(double t) {
    if(t < 0.5) {
      return t * 2;
    }
    return 1.0;
  }
}