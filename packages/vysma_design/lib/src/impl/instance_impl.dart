import 'package:meta/meta.dart';
import 'package:vysma_design/src/bridge_generated.dart';
import 'package:vysma_design/src/impl/index_impl.dart';
import 'package:vysma_design/vysma_design.dart';

// ignore_for_file: public_member_api_docs

@internal
class VysmaDesignInstanceImpl extends VysmaDesignInstance {
  VysmaDesignInstanceImpl(this.path, this.vysmaDesignLayout);

  final VysmaDesignLayout vysmaDesignLayout;

  @override
  final String path;

  final _indices = <String, VysmaDesignIndexImpl>{};

  @override
  VysmaDesignIndexImpl getIndex(String name) =>
      _indices.putIfAbsent(name, () => VysmaDesignIndexImpl(this, name));
}
