import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:meta/meta.dart';
import 'package:vysma_design/src/bridge_generated.dart';

/// Represents the external library for vysma_design
///
/// Will be a DynamicLibrary for dart:io or WasmModule for dart:html
typedef ExternalLibrary = WasmModule;

@internal
// ignore: public_member_api_docs
VysmaDesignLayout createWrapperImpl(ExternalLibrary module) =>
    VysmaDesignLayoutImpl.wasm(module);

@internal
String? tmpDir() => null;
