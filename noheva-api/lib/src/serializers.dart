//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:noheva_api/src/date_serializer.dart';
import 'package:noheva_api/src/model/date.dart';

import 'package:noheva_api/src/model/animation.dart';
import 'package:noheva_api/src/model/animation_time_interpolation.dart';
import 'package:noheva_api/src/model/bounds.dart';
import 'package:noheva_api/src/model/content_version.dart';
import 'package:noheva_api/src/model/content_version_active_condition.dart';
import 'package:noheva_api/src/model/content_version_status.dart';
import 'package:noheva_api/src/model/coordinates.dart';
import 'package:noheva_api/src/model/device.dart';
import 'package:noheva_api/src/model/device_approval_status.dart';
import 'package:noheva_api/src/model/device_group_visitor_session_start_strategy.dart';
import 'package:noheva_api/src/model/device_image_load_strategy.dart';
import 'package:noheva_api/src/model/device_key.dart';
import 'package:noheva_api/src/model/device_layout.dart';
import 'package:noheva_api/src/model/device_model.dart';
import 'package:noheva_api/src/model/device_model_capabilities.dart';
import 'package:noheva_api/src/model/device_model_dimensions.dart';
import 'package:noheva_api/src/model/device_model_display_metrics.dart';
import 'package:noheva_api/src/model/device_page.dart';
import 'package:noheva_api/src/model/device_page_resource.dart';
import 'package:noheva_api/src/model/device_request.dart';
import 'package:noheva_api/src/model/device_status.dart';
import 'package:noheva_api/src/model/device_type.dart';
import 'package:noheva_api/src/model/dynamic_page_resource.dart';
import 'package:noheva_api/src/model/dynamic_page_resource_data_source.dart';
import 'package:noheva_api/src/model/dynamic_page_resource_substitute.dart';
import 'package:noheva_api/src/model/dynamic_page_resource_substitute_substitute_inner.dart';
import 'package:noheva_api/src/model/dynamic_page_resource_switch.dart';
import 'package:noheva_api/src/model/dynamic_page_resource_switch_when_inner.dart';
import 'package:noheva_api/src/model/dynamic_page_resource_type.dart';
import 'package:noheva_api/src/model/error.dart';
import 'package:noheva_api/src/model/exhibition.dart';
import 'package:noheva_api/src/model/exhibition_device.dart';
import 'package:noheva_api/src/model/exhibition_device_group.dart';
import 'package:noheva_api/src/model/exhibition_floor.dart';
import 'package:noheva_api/src/model/exhibition_page.dart';
import 'package:noheva_api/src/model/exhibition_page_event.dart';
import 'package:noheva_api/src/model/exhibition_page_event_action_type.dart';
import 'package:noheva_api/src/model/exhibition_page_event_property.dart';
import 'package:noheva_api/src/model/exhibition_page_event_property_type.dart';
import 'package:noheva_api/src/model/exhibition_page_event_transition.dart';
import 'package:noheva_api/src/model/exhibition_page_event_trigger.dart';
import 'package:noheva_api/src/model/exhibition_page_resource.dart';
import 'package:noheva_api/src/model/exhibition_page_resource_type.dart';
import 'package:noheva_api/src/model/exhibition_page_transition.dart';
import 'package:noheva_api/src/model/exhibition_page_transition_options.dart';
import 'package:noheva_api/src/model/exhibition_page_transition_options_morph.dart';
import 'package:noheva_api/src/model/exhibition_page_transition_options_morph_view.dart';
import 'package:noheva_api/src/model/exhibition_room.dart';
import 'package:noheva_api/src/model/layout_type.dart';
import 'package:noheva_api/src/model/mqtt_device_attached_to_exhibition.dart';
import 'package:noheva_api/src/model/mqtt_device_create.dart';
import 'package:noheva_api/src/model/mqtt_device_delete.dart';
import 'package:noheva_api/src/model/mqtt_device_detached_from_exhibition.dart';
import 'package:noheva_api/src/model/mqtt_device_group_create.dart';
import 'package:noheva_api/src/model/mqtt_device_group_delete.dart';
import 'package:noheva_api/src/model/mqtt_device_group_update.dart';
import 'package:noheva_api/src/model/mqtt_device_status.dart';
import 'package:noheva_api/src/model/mqtt_device_update.dart';
import 'package:noheva_api/src/model/mqtt_exhibition_page_create.dart';
import 'package:noheva_api/src/model/mqtt_exhibition_page_delete.dart';
import 'package:noheva_api/src/model/mqtt_exhibition_page_update.dart';
import 'package:noheva_api/src/model/mqtt_exhibition_visitor_session_create.dart';
import 'package:noheva_api/src/model/mqtt_exhibition_visitor_session_delete.dart';
import 'package:noheva_api/src/model/mqtt_exhibition_visitor_session_update.dart';
import 'package:noheva_api/src/model/mqtt_layout_create.dart';
import 'package:noheva_api/src/model/mqtt_layout_delete.dart';
import 'package:noheva_api/src/model/mqtt_layout_update.dart';
import 'package:noheva_api/src/model/mqtt_proximity_update.dart';
import 'package:noheva_api/src/model/mqtt_rfid_antenna_create.dart';
import 'package:noheva_api/src/model/mqtt_rfid_antenna_delete.dart';
import 'package:noheva_api/src/model/mqtt_rfid_antenna_update.dart';
import 'package:noheva_api/src/model/mqtt_trigger_device_group_event.dart';
import 'package:noheva_api/src/model/mqtt_visitor_create.dart';
import 'package:noheva_api/src/model/mqtt_visitor_delete.dart';
import 'package:noheva_api/src/model/mqtt_visitor_update.dart';
import 'package:noheva_api/src/model/page_layout.dart';
import 'package:noheva_api/src/model/page_layout_view.dart';
import 'package:noheva_api/src/model/page_layout_view_html.dart';
import 'package:noheva_api/src/model/page_layout_view_property.dart';
import 'package:noheva_api/src/model/page_layout_view_property_type.dart';
import 'package:noheva_api/src/model/page_layout_widget_type.dart';
import 'package:noheva_api/src/model/page_resource_dynamic_substitute_params.dart';
import 'package:noheva_api/src/model/page_resource_mode.dart';
import 'package:noheva_api/src/model/point.dart';
import 'package:noheva_api/src/model/polygon.dart';
import 'package:noheva_api/src/model/rfid_antenna.dart';
import 'package:noheva_api/src/model/screen_orientation.dart';
import 'package:noheva_api/src/model/stored_file.dart';
import 'package:noheva_api/src/model/sub_layout.dart';
import 'package:noheva_api/src/model/system_memory.dart';
import 'package:noheva_api/src/model/transition.dart';
import 'package:noheva_api/src/model/visitor.dart';
import 'package:noheva_api/src/model/visitor_session.dart';
import 'package:noheva_api/src/model/visitor_session_state.dart';
import 'package:noheva_api/src/model/visitor_session_v2.dart';
import 'package:noheva_api/src/model/visitor_session_variable.dart';
import 'package:noheva_api/src/model/visitor_session_visited_device_group.dart';
import 'package:noheva_api/src/model/visitor_tag.dart';
import 'package:noheva_api/src/model/visitor_variable.dart';
import 'package:noheva_api/src/model/visitor_variable_type.dart';

part 'serializers.g.dart';

@SerializersFor([
  Animation,
  AnimationTimeInterpolation,
  Bounds,
  ContentVersion,
  ContentVersionActiveCondition,
  ContentVersionStatus,
  Coordinates,
  Device,
  DeviceApprovalStatus,
  DeviceGroupVisitorSessionStartStrategy,
  DeviceImageLoadStrategy,
  DeviceKey,
  DeviceLayout,
  DeviceModel,
  DeviceModelCapabilities,
  DeviceModelDimensions,
  DeviceModelDisplayMetrics,
  DevicePage,
  DevicePageResource,
  DeviceRequest,
  DeviceStatus,
  DeviceType,
  DynamicPageResource,
  DynamicPageResourceDataSource,
  DynamicPageResourceSubstitute,
  DynamicPageResourceSubstituteSubstituteInner,
  DynamicPageResourceSwitch,
  DynamicPageResourceSwitchWhenInner,
  DynamicPageResourceType,
  Error,
  Exhibition,
  ExhibitionDevice,
  ExhibitionDeviceGroup,
  ExhibitionFloor,
  ExhibitionPage,
  ExhibitionPageEvent,
  ExhibitionPageEventActionType,
  ExhibitionPageEventProperty,
  ExhibitionPageEventPropertyType,
  ExhibitionPageEventTransition,
  ExhibitionPageEventTrigger,
  ExhibitionPageResource,
  ExhibitionPageResourceType,
  ExhibitionPageTransition,
  ExhibitionPageTransitionOptions,
  ExhibitionPageTransitionOptionsMorph,
  ExhibitionPageTransitionOptionsMorphView,
  ExhibitionRoom,
  LayoutType,
  MqttDeviceAttachedToExhibition,
  MqttDeviceCreate,
  MqttDeviceDelete,
  MqttDeviceDetachedFromExhibition,
  MqttDeviceGroupCreate,
  MqttDeviceGroupDelete,
  MqttDeviceGroupUpdate,
  MqttDeviceStatus,
  MqttDeviceUpdate,
  MqttExhibitionPageCreate,
  MqttExhibitionPageDelete,
  MqttExhibitionPageUpdate,
  MqttExhibitionVisitorSessionCreate,
  MqttExhibitionVisitorSessionDelete,
  MqttExhibitionVisitorSessionUpdate,
  MqttLayoutCreate,
  MqttLayoutDelete,
  MqttLayoutUpdate,
  MqttProximityUpdate,
  MqttRfidAntennaCreate,
  MqttRfidAntennaDelete,
  MqttRfidAntennaUpdate,
  MqttTriggerDeviceGroupEvent,
  MqttVisitorCreate,
  MqttVisitorDelete,
  MqttVisitorUpdate,
  PageLayout,
  PageLayoutView,
  PageLayoutViewHtml,
  PageLayoutViewProperty,
  PageLayoutViewPropertyType,
  PageLayoutWidgetType,
  PageResourceDynamicSubstituteParams,
  PageResourceMode,
  Point,
  Polygon,
  RfidAntenna,
  ScreenOrientation,
  StoredFile,
  SubLayout,
  SystemMemory,
  Transition,
  Visitor,
  VisitorSession,
  VisitorSessionState,
  VisitorSessionV2,
  VisitorSessionVariable,
  VisitorSessionVisitedDeviceGroup,
  VisitorTag,
  VisitorVariable,
  VisitorVariableType,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Visitor)]),
        () => ListBuilder<Visitor>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(DevicePage)]),
        () => ListBuilder<DevicePage>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Device)]),
        () => ListBuilder<Device>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(DeviceLayout)]),
        () => ListBuilder<DeviceLayout>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(RfidAntenna)]),
        () => ListBuilder<RfidAntenna>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(StoredFile)]),
        () => ListBuilder<StoredFile>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ExhibitionRoom)]),
        () => ListBuilder<ExhibitionRoom>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Exhibition)]),
        () => ListBuilder<Exhibition>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ExhibitionDeviceGroup)]),
        () => ListBuilder<ExhibitionDeviceGroup>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(VisitorVariable)]),
        () => ListBuilder<VisitorVariable>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ExhibitionDevice)]),
        () => ListBuilder<ExhibitionDevice>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ExhibitionFloor)]),
        () => ListBuilder<ExhibitionFloor>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(VisitorSession)]),
        () => ListBuilder<VisitorSession>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(VisitorSessionV2)]),
        () => ListBuilder<VisitorSessionV2>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SubLayout)]),
        () => ListBuilder<SubLayout>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(DeviceModel)]),
        () => ListBuilder<DeviceModel>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ExhibitionPage)]),
        () => ListBuilder<ExhibitionPage>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ContentVersion)]),
        () => ListBuilder<ContentVersion>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(PageLayout)]),
        () => ListBuilder<PageLayout>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
