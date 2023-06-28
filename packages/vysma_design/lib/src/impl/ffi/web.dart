import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:meta/meta.dart';
import 'package:vysma_design/src/bridge_generated.dart';

/// Represents the external library for mimir
///
/// Will be a DynamicLibrary for dart:io or WasmModule for dart:html
typedef ExternalLibrary = WasmModule;

@internal
// ignore: public_member_api_docs
VysmaDesign createWrapperImpl(ExternalLibrary module) =>
    VysmaDesignImpl.wasm(module);

/// Needed by https://github.com/GregoryConrad/mimir/issues/170
@internal
String? tmpDir() => null;
