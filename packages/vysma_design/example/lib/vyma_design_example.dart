import 'dart:ffi';
import 'dart:io';

import 'package:vysma_design/vysma_design.dart';

Future<void> main() async {
  final tmpDir = getTmpDir();
  try {
    await run(tmpDir.path, getLibrary());
  } finally {
    tmpDir.deleteSync(recursive: true);
  }
}

Future<void> run(String path, DynamicLibrary lib) async {
  // First, we get our instance of vysma_design from:
  // - path, the path to the instance directory (that holds all of our data)
  // - lib, an instance of DynamicLibrary
  //   - lib is an object that enables us to communicate with the db in Rust
  // If you are going to use Flutter, don't pay too much attention to lib;
  // lib will be created for you automatically under the hood.
  // However, in pure Dart, you need to explicity state how to get it.
  final instance = await VysmaDesign.getInstance(path: path, library: lib);

  // Let's create an 'index' of movies that we can search through.
  // An index can be thought of as a grouping of documents of the same type.
  // Instances and indices are created for you on-demand (lazily)
  // if they do not already exist. This is what allows vysma_design to not need
  // async/await when trying ot get an instance or an index!
  final index = instance.getIndex('default');

  index.widgetTypeToName(widgetType: WidgetType.Column);
}

DynamicLibrary getLibrary() {
  // If you are running this example locally, you will need to run
  // `cargo build -r` to generate the needed dylib.
  const libName = 'embedded_milli';
  final libPrefix = {
    Platform.isWindows: '',
    Platform.isMacOS: 'lib',
    Platform.isLinux: 'lib',
  }[true]!;
  final libSuffix = {
    Platform.isWindows: 'dll',
    Platform.isMacOS: 'dylib',
    Platform.isLinux: 'so',
  }[true]!;
  final dylibPath = '../../../target/release/$libPrefix$libName.$libSuffix';
  return DynamicLibrary.open(dylibPath);
}

Directory getTmpDir() => Directory.systemTemp.createTempSync();
