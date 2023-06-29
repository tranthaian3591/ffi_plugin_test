import 'package:vysma_design/vysma_design.dart';

// ignore: public_member_api_docs
abstract class VysmaDesignInstance {
  /// The file-system path for the directory of this instance
  String get path;

  /// Gets the index with the given name (also acts as its id).
  /// One will be created for you if an index with the same name
  /// does not yet exist.
  ///
  /// The name of the index must be filesystem-path safe.
  /// When in doubt, just stick with a-z, A-Z, 0-9, -, and _ for the name.
  ///
  /// If you know any settings of the index in advance (such as a primary key),
  VysmaDesignIndex getIndex(String name);
}
