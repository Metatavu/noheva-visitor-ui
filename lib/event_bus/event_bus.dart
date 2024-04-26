import "package:event_bus/event_bus.dart";
import "package:noheva_visitor_ui/widgets/noheva_widgets.dart";
import "package:noheva_visitor_ui/mqtt/listeners/pages_listener.dart";
import "package:noheva_visitor_ui/screens/page_screen.dart";

/// This module contains the event bus instance and, at the moment, all the events that are used in the app.

final EventBus eventBus = EventBus();

/// Event that is triggered when the user clicks on a play button.
/// [NohevaVideo] then starts playing the video.
class PlayVideoEvent {}

/// Event that is triggered when the [NohevaVideo] wants to toggle the play button.
class HidePlayButtonEvent {
  final bool hide;
  HidePlayButtonEvent(this.hide);
}

/// Event that is triggered when [PagesListener] needs to know what exhibition page is currenty being disabled.
class RequestAchiveExhibitionPageIdEvent {}

/// Event that is sent by [PageScreen] as a response to [RequestAchiveExhibitionPageIdEvent].
class ActiveExhibitionPageIdEvent {
  final String? pageId;
  ActiveExhibitionPageIdEvent(this.pageId);
}

/// Event that is triggered when the software wants to load a new exhibition page.
///
/// e.g. when the device boots and it it attached to an exhibition and has content to be dispayed
class LoadExhibitionPageByIdEvent {
  final String? pageId;
  LoadExhibitionPageByIdEvent(this.pageId);
}

/// Event that is triggered when the software needs to navigate to the management screen.
class OpenManagementScreenEvent {}
