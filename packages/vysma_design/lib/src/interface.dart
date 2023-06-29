import 'package:vysma_design/src/bridge_generated.dart';
import 'package:vysma_design/src/impl/instance_impl.dart';
import 'package:vysma_design/src/instance.dart';

// ignore: directives_ordering
import 'package:vysma_design/src/impl/ffi/stub.dart'
    if (dart.library.io) 'package:vysma_design/src/impl/ffi/io.dart'
    if (dart.library.html) 'package:vysma_design/src/impl/ffi/web.dart';

/// The exposed API to interact with vysma_design
// Instead of just having a VysmaDesign namespace, we have to do this instead,
// because we cannot add static extension methods to a class.
// This approach was taken from Hive, where initFlutter()
// in the hive_flutter package is an extension method.
// To the user this will look like a class/namespace so it is okay.
// ignore: non_constant_identifier_names
final VysmaDesign = VysmaDesignInterface._();

/// The interface of the API to interact with vysma_design
class VysmaDesignInterface {
  // This class should only ever be instantiated *once*, so private constructor
  VysmaDesignInterface._();

  // Internal ffi wrapper that is instantianted lazily.
  // Should only have one instance per process.
  VysmaDesignLayout? _vysmaDesignLayout;

  // Instances map. Should only have one instance per app for streams to work.
  final _instances = <String, VysmaDesignInstance>{};

  /// Creates a VysmaDesignInstance from the given [path] and [library]
  ///
  /// The [path] has to point to a directory; a directory will be
  /// created for you at the given path if one does not already exist.
  ///
  /// [library] is a WasmModule on web & a DynamicLibrary on dart:io platforms.
  /// [library] is used to create the internal ffi object
  /// that is used to call the Rust APIs.
  Future<VysmaDesignInstance> getInstance({
    required String path,
    required ExternalLibrary library,
  }) async {
    _vysmaDesignLayout ??= createWrapperImpl(library);
    // await _vysmaDesignLayout!
    //     .ensureInstanceInitialized(instanceDir: path, tmpDir: tmpDir());
    return _instances.putIfAbsent(
      path,
      () => VysmaDesignInstanceImpl(path, _vysmaDesignLayout!),
    );
  }
}
