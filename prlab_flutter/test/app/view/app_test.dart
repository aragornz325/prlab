import 'package:flutter_test/flutter_test.dart';
import 'package:prlab_flutter/app/app.dart';
import 'package:prlab_flutter/counter/counter.dart';
import 'package:prlab_flutter/isar/isar_service.dart';

void main() {
  final isarService = IsarService();

  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await isarService.openDB();
      await tester.pumpWidget(
        App(
          isarService: isarService,
        ),
      );
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
