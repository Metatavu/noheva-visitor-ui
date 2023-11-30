import "package:flutter/material.dart";
import "package:noheva_visitor_ui/screens/default_screen.dart";

/// Utilities for animated navigation between screens.
class NavigationUtils {
  /// Navigates to [DefaultScreen]
  static Future<void> navigateToDefaultScreen(BuildContext context) async =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DefaultScreen()),
      );
}
