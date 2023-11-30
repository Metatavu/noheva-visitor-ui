import "dart:async";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:noheva_api/noheva_api.dart";
import 'package:noheva_visitor_ui/actions/key_event_listener.dart';
import "package:noheva_visitor_ui/actions/page_action_provider_factory.dart";
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
  late StreamSubscription<bool?> _managementButtonStreamSubscription;
  final List<KeyEventListener> _keyDownListeners = [];
  final List<KeyEventListener> _keyUpListeners = [];

  @override
  void initState() {
    super.initState();
    _managementButtonStreamSubscription =
        managementStreamController.stream.listen((event) {
      if (event != null) {
        Navigator.push(
          context,
          MaterialPageRoute<NohevaScreen>(
            builder: (_) => const ManagementScreen(),
          ),
        );
      }
    });
    ServicesBinding.instance.keyboard.addHandler(_keyEventHandler);
  }

  @override
  void dispose() {
    _managementButtonStreamSubscription.cancel();
    ServicesBinding.instance.keyboard.removeHandler(_keyEventHandler);
    super.dispose();
  }

  @protected
  void applyPageEventTriggers(List<ExhibitionPageEventTrigger> eventTriggers) {
    for (var eventTrigger in eventTriggers) {
      if (eventTrigger.keyDown != null) {
        _bindKeyCodeEventListener(
          eventTrigger.keyDown!,
          eventTrigger.events?.toList() ?? [],
          true,
        );
      }
      if (eventTrigger.keyUp != null) {
        _bindKeyCodeEventListener(
          eventTrigger.keyUp!,
          eventTrigger.events?.toList() ?? [],
          false,
        );
      }
    }
  }

  bool _keyEventHandler(KeyEvent event) {
    String keyLabel = event.logicalKey.keyLabel;
    if (event is KeyDownEvent) {
      _keyDownListeners.firstWhereOrNull((element) {
        return element.keyLabel == keyLabel;
      })?.listener();

      return false;
    }
    if (event is KeyUpEvent) {
      _keyUpListeners
          .firstWhereOrNull((element) => element.keyLabel == keyLabel)
          ?.listener();

      return false;
    }

    return true;
  }

  void _bindKeyCodeEventListener(
    String keyLabel,
    List<ExhibitionPageEvent> events,
    bool keyDown,
  ) {
    if (keyDown) {
      _keyDownListeners.add(
        KeyEventListener(
          keyLabel: keyLabel,
          listener: () => events.forEach(_triggerEvent),
        ),
      );
    } else {
      _keyUpListeners.add(
        KeyEventListener(
          keyLabel: keyLabel,
          listener: () => events.forEach(_triggerEvent),
        ),
      );
    }
  }

  void _triggerEvent(ExhibitionPageEvent event) {
    List<ExhibitionPageEventProperty> properties = event.properties.toList();
    PageActionProviderFactory.buildProvider(event.action, properties)
        ?.performAction(this);
  }
}
