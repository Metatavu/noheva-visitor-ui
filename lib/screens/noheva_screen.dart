import "dart:async";

import "package:flutter/material.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/screens/management_screen.dart";

/// Abstract Noheva Screen
///
/// All screens should extend this class
abstract class NohevaScreen extends StatefulWidget {
  const NohevaScreen({Key? key}) : super(key: key);
}

/// Abstract Noheva Screen State
///
/// All screens states should extend this class.
/// Provides a stream subscription for navigating to management screen when required.
abstract class NohevaScreenState<T extends NohevaScreen> extends State<T> {
  late StreamSubscription _managementButtonStreamSubscription;

  @override
  void initState() {
    super.initState();
    _managementButtonStreamSubscription =
        managementStreamController.stream.listen((event) {
      if (event != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ManagementScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _managementButtonStreamSubscription.cancel();
    super.dispose();
  }
}
