import 'package:test/test.dart';
import 'package:vysma_design/vysma_design.dart';

import 'utils.dart';

void main() {
  test('widgetTypeToName functionality', () async {
    final index = await useTestIndex();
    final widgetName =
        await index.widgetTypeToName(widgetType: WidgetType.Column);

    expect(widgetName, 'Column');
  });
}
