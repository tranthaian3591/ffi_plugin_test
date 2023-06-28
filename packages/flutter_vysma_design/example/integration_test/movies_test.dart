import 'package:flutter_vysma_design/flutter_vysma_design.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> pause() => Future.delayed(const Duration(milliseconds: 500));

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Path is not empty', (tester) async {
    final instance = await VysmaDesignLib.defaultInstance;
    expect(instance.path, isNotEmpty);
  });
}
