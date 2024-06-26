import "dart:async";
import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:noheva_api/noheva_api.dart";
import 'package:noheva_visitor_ui/actions/key_event_listener.dart';
import "package:noheva_visitor_ui/actions/page_action_provider_factory.dart";
import "package:noheva_visitor_ui/event_bus/event_bus.dart";
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
  late StreamSubscription<OpenManagementScreenEvent>
      _managementButtonEventSubscription;
  final List<KeyEventListener> _keyDownListeners = [];
  final List<KeyEventListener> _keyUpListeners = [];

  @override
  void initState() {
    super.initState();
    _managementButtonEventSubscription =
        eventBus.on<OpenManagementScreenEvent>().listen((_) {
      Navigator.push(
        context,
        MaterialPageRoute<NohevaScreen>(
          builder: (_) => const ManagementScreen(),
        ),
      );
    });
    ServicesBinding.instance.keyboard.addHandler(_keyEventHandler);
  }

  @override
  void dispose() {
    _managementButtonEventSubscription.cancel();
    ServicesBinding.instance.keyboard.removeHandler(_keyEventHandler);
    super.dispose();
  }

  /// Applies page [eventTriggers] not bound to a particular widget
  @protected
  void applyPageEventTriggers(List<ExhibitionPageEventTrigger> eventTriggers) {
    eventTriggers.forEach(_applyPageEventTrigger);
  }

  /// Applies single page [eventTrigger] not bound to a particular widget
  void _applyPageEventTrigger(ExhibitionPageEventTrigger eventTrigger) {
    var events = eventTrigger.events?.toList() ?? [];
    if (eventTrigger.delay != null) {
      _scheduledTimedEvents(eventTrigger.delay!, events);
    }
    if (eventTrigger.keyDown != null) {
      _bindKeyCodeEventListener(
        eventTrigger.keyDown!,
        events,
        true,
      );
    }
    if (eventTrigger.keyUp != null) {
      _bindKeyCodeEventListener(
        eventTrigger.keyUp!,
        events,
        false,
      );
    }
  }

  /// Schedules timed page [events]
  void _scheduledTimedEvents(int delay, List<ExhibitionPageEvent> events) {
    Timer(Duration(milliseconds: delay), () => events.forEach(_triggerEvent));
  }

  /// Handles Flutter key [event] and triggers page events bound to them
  bool _keyEventHandler(KeyEvent event) {
    String keyLabel = event.logicalKey.keyLabel;
    if (event is KeyDownEvent) {
      _keyDownListeners
          .firstWhereOrNull((element) => element.keyLabel == keyLabel)
          ?.listener();

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

  /// Binds page [events] to a key code [keyLabel]
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

  /// Triggers page [event]
  void _triggerEvent(ExhibitionPageEvent event) {
    List<ExhibitionPageEventProperty> properties = event.properties.toList();
    PageActionProviderFactory.buildProvider(event.action, properties)
        ?.performAction(this);
  }
}
