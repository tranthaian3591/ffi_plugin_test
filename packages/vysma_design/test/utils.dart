import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:test/test.dart';
import 'package:vysma_design/vysma_design.dart';

DynamicLibrary useLibrary() {
  const libName = 'vysma_design_layout';
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
  final dylibPath = '../../target/release/$libPrefix$libName.$libSuffix';
  return DynamicLibrary.open(dylibPath);
}

Directory useTmpDir() {
  final dir = Directory.systemTemp.createTempSync();
  addTearDown(() => dir.deleteSync(recursive: true));
  return dir;
}

Future<VysmaDesignInstance> useInstance() {
  final dir = useTmpDir();
  final lib = useLibrary();
  return VysmaDesign.getInstance(path: dir.path, library: lib);
}

Future<VysmaDesignIndex> useTestIndex() async =>
    (await useInstance()).getIndex('test');

List<Map<String, dynamic>> useExercises() {
  final exercisesStr = File('test/assets/exercises.json').readAsStringSync();
  final exerciseLibrary = json.decode(exercisesStr) as Map<String, dynamic>;
  return (exerciseLibrary['exercises'] as List)
      .cast<Map<String, dynamic>>()
      // ignore: avoid_dynamic_calls
      .map((e) => e..['id'] = e['name'].hashCode)
      .toList();
}
