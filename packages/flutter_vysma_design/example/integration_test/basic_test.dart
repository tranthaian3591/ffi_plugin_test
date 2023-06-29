import 'package:flutter_vysma_design/flutter_vysma_design.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('test get instance work', (tester) async {
    final instance = await VysmaDesign.defaultInstance;

    // Let's create an 'index' of movies that we can search through.
    // An index can be thought of as a grouping of documents of the same type.
    // Instances and indices are created for you on-demand (lazily)
    // if they do not already exist. This is what allows vysma_design to not need
    // async/await when trying ot get an instance or an index!
    final index = instance.getIndex('default');

    final name = index.widgetTypeToName(widgetType: WidgetType.Column);
    expect(name, 'Column');
  });
}
