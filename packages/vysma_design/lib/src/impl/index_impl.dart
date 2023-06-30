import 'dart:async';
import 'package:meta/meta.dart';
import 'package:vysma_design/src/bridge_generated.dart';
import 'package:vysma_design/src/impl/instance_impl.dart';
import 'package:vysma_design/src/index.dart';

// ignore_for_file: public_member_api_docs

@internal
class VysmaDesignIndexImpl extends VysmaDesignIndex {
  VysmaDesignIndexImpl(this.instance, this.name);

  final VysmaDesignInstanceImpl instance;

  @override
  final String name;

  String get instanceDir => instance.path;
  VysmaDesignLayout get vysmaDesignLayout => instance.vysmaDesignLayout;

  @override
  Future<VysmaColumnLayoutSetting?> stringToColumnLayoutSetting({
    required String data,
  }) {
    return vysmaDesignLayout.stringToColumnLayoutSetting(data: data);
  }

  @override
  Future<String> columnLayoutSettingToString({
    required VysmaColumnLayoutSetting data,
  }) {
    return vysmaDesignLayout.columnLayoutSettingToString(widgetTree: data);
  }

  @override
  Future<String> settingToString({required dynamic setting}) {
    if (setting is VysmaColumnLayoutSetting) {
      return columnLayoutSettingToString(data: setting);
    }

    return columnLayoutSettingToString(
      data: setting as VysmaColumnLayoutSetting,
    );
  }

  @override
  Future<VysmaColumnLayoutSetting> getColumnLayoutDefaultSetting() {
    return vysmaDesignLayout.columnLayoutDefaultSetting();
  }

  @override
  Future<dynamic> stringToSetting({
    required WidgetType widgetType,
    required String settingAsString,
  }) async {
    switch (widgetType) {
      case WidgetType.Column:
      case WidgetType.Root:
        return stringToColumnLayoutSetting(data: settingAsString);

      case WidgetType.Row:
      case WidgetType.Button:
      case WidgetType.Text:
      case WidgetType.Icon:
        return null;
    }
  }

  @override
  Future<VysmaColumnLayoutSetting> createRootWidgetTree() {
    return vysmaDesignLayout.createRootWidgetTree();
  }

  @override
  Future<String> widgetTypeToIcon({required WidgetType widgetType}) {
    return vysmaDesignLayout.widgetTypeToIcon(widgetType: widgetType);
  }

  @override
  Future<String> widgetTypeToName({required WidgetType widgetType}) {
    return vysmaDesignLayout.widgetTypeToName(widgetType: widgetType);
  }

  @override
  Future<String> helloWorld() {
    return vysmaDesignLayout.helloWorld();
  }
}
