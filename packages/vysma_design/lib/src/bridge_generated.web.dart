// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.78.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'bridge_generated.dart';
export 'bridge_generated.dart';

class VysmaDesignLayoutPlatform
    extends FlutterRustBridgeBase<VysmaDesignLayoutWire>
    with FlutterRustBridgeSetupMixin {
  VysmaDesignLayoutPlatform(FutureOr<WasmModule> dylib)
      : super(VysmaDesignLayoutWire(dylib)) {
    setupMixinConstructor();
  }
  Future<void> setup() => inner.init;

// Section: api2wire

  @protected
  String api2wire_String(String raw) {
    return raw;
  }

  @protected
  List<dynamic> api2wire_box_autoadd_vysma_column_layout_setting(
      VysmaColumnLayoutSetting raw) {
    return api2wire_vysma_column_layout_setting(raw);
  }

  @protected
  Uint8List api2wire_uint_8_list(Uint8List raw) {
    return raw;
  }

  @protected
  List<dynamic> api2wire_vysma_column_layout_setting(
      VysmaColumnLayoutSetting raw) {
    return [
      api2wire_String(raw.elementId),
      api2wire_String(raw.parentElementId),
      api2wire_String(raw.icon),
      api2wire_String(raw.label)
    ];
  }

// Section: finalizer
}

// Section: WASM wire module

@JS('wasm_bindgen')
external VysmaDesignLayoutWasmModule get wasmModule;

@JS()
@anonymous
class VysmaDesignLayoutWasmModule implements WasmModule {
  external Object /* Promise */ call([String? moduleName]);
  external VysmaDesignLayoutWasmModule bind(dynamic thisArg, String moduleName);
  external dynamic /* void */ wire_create_root_widget_tree(
      NativePortType port_);

  external dynamic /* void */ wire_column_layout_default_setting(
      NativePortType port_);

  external dynamic /* void */ wire_column_layout_setting_to_string(
      NativePortType port_, List<dynamic> widget_tree);

  external dynamic /* void */ wire_string_to_column_layout_setting(
      NativePortType port_, String data);

  external dynamic /* void */ wire_widget_type_to_name(
      NativePortType port_, int widget_type);

  external dynamic /* void */ wire_widget_type_to_icon(
      NativePortType port_, int widget_type);

  external dynamic /* void */ wire_hello_world(NativePortType port_);
}

// Section: WASM wire connector

class VysmaDesignLayoutWire
    extends FlutterRustBridgeWasmWireBase<VysmaDesignLayoutWasmModule> {
  VysmaDesignLayoutWire(FutureOr<WasmModule> module)
      : super(WasmModule.cast<VysmaDesignLayoutWasmModule>(module));

  void wire_create_root_widget_tree(NativePortType port_) =>
      wasmModule.wire_create_root_widget_tree(port_);

  void wire_column_layout_default_setting(NativePortType port_) =>
      wasmModule.wire_column_layout_default_setting(port_);

  void wire_column_layout_setting_to_string(
          NativePortType port_, List<dynamic> widget_tree) =>
      wasmModule.wire_column_layout_setting_to_string(port_, widget_tree);

  void wire_string_to_column_layout_setting(
          NativePortType port_, String data) =>
      wasmModule.wire_string_to_column_layout_setting(port_, data);

  void wire_widget_type_to_name(NativePortType port_, int widget_type) =>
      wasmModule.wire_widget_type_to_name(port_, widget_type);

  void wire_widget_type_to_icon(NativePortType port_, int widget_type) =>
      wasmModule.wire_widget_type_to_icon(port_, widget_type);

  void wire_hello_world(NativePortType port_) =>
      wasmModule.wire_hello_world(port_);
}
