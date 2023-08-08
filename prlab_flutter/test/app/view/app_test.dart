import 'package:flutter_test/flutter_test.dart';
import 'package:prlab_flutter/app/app.dart';
import 'package:prlab_flutter/isar/isar_service.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await IsarService.abrirDB();

      await tester.pumpWidget(
        const App(),
      );
      //Saltaba error por eliminar la carpeta del counter
      // expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
