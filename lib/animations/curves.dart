import "dart:math";
import "package:flutter/animation.dart";

/// Accelerate Decelerate Curve
class AccelerateDecelerateCurve extends Curve {
  @override
  double transformInternal(double t) {
    return cos((t + 1) * pi) / 2.0 + 0.5;
  }
}

/// Anticipate Curve
class AnticipateCurve extends Curve {
  final double tension;

  const AnticipateCurve({this.tension = 2.0});

  @override
  double transformInternal(double t) {
    return t * t * ((tension + 1) * t - tension);
  }
}
