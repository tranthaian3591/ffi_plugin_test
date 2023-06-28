import 'package:meta/meta.dart';
import 'package:vysma_design/vysma_design.dart';
import 'package:vysma_design/src/bridge_generated.dart';

// ignore_for_file: public_member_api_docs

@internal
class VysmaDesignInstanceImpl extends VysmaDesignInstance {
  VysmaDesignInstanceImpl(this.path, this.vysmaDesign);

  final VysmaDesign vysmaDesign;

  @override
  final String path;
}
