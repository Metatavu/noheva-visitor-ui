import "package:flutter/material.dart";
import "package:html/dom.dart" as dom;
import "package:noheva_api/noheva_api.dart";

abstract class NohevaWidget extends StatefulWidget {
  bool? hidden;
  final dom.Element element;
  final List<ExhibitionPageEventTrigger> eventTriggers;
  final List<ExhibitionPageTransition> enterTransitions;
  final List<ExhibitionPageTransition> exitTransitions;
  final Map<String, void Function(NohevaWidgetState widget)>
      customOnTapCallbacks;

  NohevaWidget({
    Key? key,
    required this.element,
    this.hidden,
    required this.eventTriggers,
    required this.enterTransitions,
    required this.exitTransitions,
    required this.customOnTapCallbacks,
  }) : super(key: key);
}

abstract class NohevaWidgetState<T extends NohevaWidget> extends State<T> {
  dom.Element get element => widget.element;
  List<ExhibitionPageEventTrigger> get eventTriggers => widget.eventTriggers;
  List<ExhibitionPageTransition> get enterTransitions =>
      widget.enterTransitions;
  List<ExhibitionPageTransition> get exitTransitions => widget.exitTransitions;
  Map<String, void Function(NohevaWidgetState widget)>
      get customOnTapCallbacks => widget.customOnTapCallbacks;

  bool hidden = false;

  void toggleHidden() {
    setState(() {
      hidden = !hidden;
    });
  }

  void setHidden(bool value) {
    setState(() {
      hidden = value;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.hidden != null) {
      hidden = widget.hidden!;
    }
  }
}
