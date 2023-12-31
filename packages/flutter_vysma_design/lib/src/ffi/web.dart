import 'package:meta/meta.dart';
import 'package:vysma_design/vysma_design.dart';

@internal
// ignore: public_member_api_docs
WasmModule createLibraryImpl() {
  // Web is currently not supported. If we support web in the future, see:
  // https://github.com/fzyzcjy/flutter_rust_bridge/blob/master/frb_example/with_flutter/lib/ffi.web.dart

  throw UnsupportedError(
    'Web support is not provided by vysma_design (yet). See here:\n'
    'https://github.com/GregoryConrad/mimir/issues/10',
  );
}
