import 'package:flutter_vysma_design/flutter_vysma_design.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as pp;

// ignore: always_use_package_imports
import 'ffi/stub.dart'
    if (dart.library.io) 'ffi/io.dart'
    if (dart.library.html) 'ffi/web.dart';

/// Flutter extensions for the VysmaDesignInterface to
/// make it easier to work with
extension FlutterVysmaDesignInterface on VysmaDesignInterface {
  /// Creates the default [VysmaDesignInstance] instance for Flutter
  Future<VysmaDesignInstance> get defaultInstance {
    const defaultName = 'default';
    return getInstanceForName(defaultName);
  }

  /// Creates a [VysmaDesignInstance] with the
  /// given path-friendly [name] for Flutter
  Future<VysmaDesignInstance> getInstanceForName(String name) async {
    try {
      const defaultSubDir = 'vysma_design';
      final appSupportDir = await pp.getApplicationSupportDirectory();
      final path = p.join(appSupportDir.path, defaultSubDir, name);
      return getInstanceForPath(path);
    } on pp.MissingPlatformDirectoryException {
      throw UnsupportedError(
        'Looks like this platform does not have an application support '
        'directory. Please call VysmaDesign.getInstanceForPath(someDirPath) '
        'instead.',
      );
    }
  }

  /// Creates a [VysmaDesignInstance] from the given path for Flutter
  Future<VysmaDesignInstance> getInstanceForPath(String path) =>
      getInstance(path: path, library: createLibraryImpl());
}
