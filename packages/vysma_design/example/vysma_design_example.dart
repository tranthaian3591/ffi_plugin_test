import 'dart:ffi';
import 'dart:io';

import 'package:vysma_design/vysma_design.dart';

final uri = Uri.parse(
  'https://raw.githubusercontent.com/prust/wikipedia-movie-data/master/movies.json',
);

Future<void> main() async {
  final tmpDir = getTmpDir();
  try {
    await run(tmpDir.path, getLibrary());
  } finally {
    tmpDir.deleteSync(recursive: true);
  }
}

Future<void> run(String path, DynamicLibrary lib) async {
  // First, we get our instance of Mimir from:
  // - path, the path to the instance directory (that holds all of our data)
  // - lib, an instance of DynamicLibrary
  //   - lib is an object that enables us to communicate with the db in Rust
  // If you are going to use Flutter, don't pay too much attention to lib;
  // lib will be created for you automatically under the hood.
  // However, in pure Dart, you need to explicity state how to get it.
  final instance = await VysmaDesignLib.getInstance(path: path, library: lib);

  print(instance.path);
}

DynamicLibrary getLibrary() {
  // If you are running this example locally, you will need to run
  // `cargo build -r` to generate the needed dylib.
  const libName = 'vysma_design';
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
  final dylibPath =
      '/Users/tranthaian3591/Desktop/myrepo/vysma/vysma_design/target/debug/$libPrefix$libName.$libSuffix';
  return DynamicLibrary.open(dylibPath);
}

Directory getTmpDir() => Directory.systemTemp.createTempSync();
