/// Represents an instance (essentially a group of indices) of VysmaDesign.
///
/// You will often only need one instance, but you can
/// make more if you so choose.
///
/// VysmaDesign is based on Milli (the engine of Meilisearch).
/// While we could embed all of Meilisearch in Flutter, it would hardly
/// make sense; you can just use ffi to access the engine, Milli, directly.
/// With this approach, its easier on constrained resources (no http server)
/// and more simple (no management of the server needed).
abstract class VysmaDesignInstance {
  /// The file-system path for the directory of this instance
  String get path;
}
