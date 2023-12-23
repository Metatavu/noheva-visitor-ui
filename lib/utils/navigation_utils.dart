import "package:flutter/material.dart";
import "package:noheva_api/noheva_api.dart" as noheva_api;
import 'package:noheva_visitor_ui/animations/curves.dart';
import "package:noheva_visitor_ui/screens/default_screen.dart";
import "package:noheva_visitor_ui/screens/device_setup_screen.dart";

/// Utilities for animated navigation between screens.
class NavigationUtils {
  /// Navigates to [DefaultScreen]
  static Future<void> navigateToDefaultScreen(BuildContext context) async =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DefaultScreen()),
      );

  /// Navigates to [DeviceSetupScreen]
  static Future<void> navigateToDeviceSetupScreen(BuildContext context) async =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DeviceSetupScreen()),
      );

  /// Pushes given [screen] to the [context] with given [enterTransition] and [exitTransition].
  static Future<dynamic> navigateTo<T extends StatefulWidget>(
    T screen,
    BuildContext context, {
    noheva_api.ExhibitionPageTransition? enterTransition,
    noheva_api.ExhibitionPageTransition? exitTransition,
  }) async =>
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(
            milliseconds: enterTransition?.transition.duration ?? 300,
          ),
          reverseTransitionDuration: Duration(
            milliseconds: exitTransition?.transition.duration ?? 300,
          ),
          pageBuilder: (_, __, ___) => screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              _buildTransition(
            child,
            animation,
            enterTransition: enterTransition,
            exitTransition: exitTransition,
          ),
        ),
      );

  /// Builds transitions and returns given [child] wrapped in a transition.
  static Widget _buildTransition(
    Widget child,
    Animation<double> animation, {
    noheva_api.ExhibitionPageTransition? enterTransition,
    noheva_api.ExhibitionPageTransition? exitTransition,
  }) {
    if (animation.status == AnimationStatus.reverse) {
      return _getTransition(exitTransition, child, animation);
    } else {
      return _getTransition(enterTransition, child, animation);
    }
  }

  /// Gets correct Flutter transition for given [transition]
  static dynamic _getTransition(
    noheva_api.ExhibitionPageTransition? transition,
    Widget child,
    Animation<double> animation,
  ) {
    CurveTween? curveTween =
        _getCurveTween(transition?.transition.timeInterpolation);
    switch (transition?.transition.animation) {
      case noheva_api.Animation.fade:
        return FadeTransition(
          opacity: curveTween != null ? animation.drive(curveTween) : animation,
          child: child,
        );
      default:
        return child;
    }
  }

  /// gets correct Flutter curve tween for given [animationTimeInterpolation]
  static CurveTween? _getCurveTween(
    noheva_api.AnimationTimeInterpolation? animationTimeInterpolation,
  ) {
    switch (animationTimeInterpolation) {
      case noheva_api.AnimationTimeInterpolation.acceleratedecelerate:
        return CurveTween(curve: AccelerateDecelerateCurve());
      case noheva_api.AnimationTimeInterpolation.accelerate:
        return CurveTween(curve: Curves.easeIn);
      case noheva_api.AnimationTimeInterpolation.anticipate:
        return CurveTween(curve: const AnticipateCurve());
      case noheva_api.AnimationTimeInterpolation.linear:
        return CurveTween(curve: Curves.linear);
      default:
        return null;
    }
  }
}
