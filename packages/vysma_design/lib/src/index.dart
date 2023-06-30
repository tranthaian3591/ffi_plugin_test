import 'package:vysma_design/src/bridge_generated.dart';

// ignore: public_member_api_docs
abstract class VysmaDesignIndex {
  /// The path-friendly name (id) of this index
  String get name;

  /// stringToColumnLayoutSetting
  Future<VysmaColumnLayoutSetting?> stringToColumnLayoutSetting({
    required String data,
  });

  /// columnLayoutSettingToString
  Future<String> columnLayoutSettingToString({
    required VysmaColumnLayoutSetting data,
  });

  /// settingToString
  Future<String> settingToString({required dynamic setting});

  /// getColumnLayoutDefaultSetting
  Future<VysmaColumnLayoutSetting> getColumnLayoutDefaultSetting();

  /// stringToSetting
  Future<dynamic> stringToSetting({
    required WidgetType widgetType,
    required String settingAsString,
  });

  /// createRootWidgetTree
  Future<VysmaColumnLayoutSetting> createRootWidgetTree();

  /// widgetTypeToIcon
  Future<String> widgetTypeToIcon({required WidgetType widgetType});

  /// widgetTypeToName
  Future<String> widgetTypeToName({required WidgetType widgetType});

  /// helloWorld
  Future<String> helloWorld();
}
