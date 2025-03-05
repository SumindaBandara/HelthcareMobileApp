import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyApp());

    // Verify initial text does not exist
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap '+' button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify counter increment
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
