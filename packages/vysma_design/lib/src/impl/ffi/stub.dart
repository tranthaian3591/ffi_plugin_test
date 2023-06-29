import 'package:meta/meta.dart';
import 'package:vysma_design/src/bridge_generated.dart';

/// Represents the external library for vysma_design
///
/// Will be a DynamicLibrary for dart:io or WasmModule for dart:html
typedef ExternalLibrary = Object;

@internal
// ignore: public_member_api_docs
VysmaDesignLayout createWrapperImpl(ExternalLibrary lib) =>
    throw UnimplementedError();

@internal
String? tmpDir() => null;
