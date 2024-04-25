import "package:event_bus/event_bus.dart";

/// This module contains the event bus instance and, at the moment, all the events that are used in the app.

final EventBus eventBus = EventBus();

class PlayVideoEvent {}

class HidePlayButtonEvent {
  final bool hide;
  HidePlayButtonEvent(this.hide);
}

class RequestAchiveExhibitionPageIdEvent {}

class ActiveExhibitionPageIdEvent {
  final String? pageId;
  ActiveExhibitionPageIdEvent(this.pageId);
}

class LoadExhibitionPageByIdEvent {
  final String? pageId;
  LoadExhibitionPageByIdEvent(this.pageId);
}

class OpenManagementScreenEvent {}
