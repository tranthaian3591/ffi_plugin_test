import 'package:meta/meta.dart';
import 'package:vysma_design/src/bridge_generated.dart';

/// Represents the external library for mimir
///
/// Will be a DynamicLibrary for dart:io or WasmModule for dart:html
typedef ExternalLibrary = Object;

@internal
// ignore: public_member_api_docs
VysmaDesign createWrapperImpl(ExternalLibrary lib) =>
    throw UnimplementedError();

/// Needed by https://github.com/GregoryConrad/mimir/issues/170
@internal
String? tmpDir() => null;
