import 'package:flutter_api_rest/src/pages/home/subpages/create/create_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

main() {
  testWidgets('CreatePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(CreatePage()));
    final titleFinder = find.text('Create');
    expect(titleFinder, findsOneWidget);
  });
}
