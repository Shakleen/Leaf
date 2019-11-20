import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/view/pages/home_page.dart';

void main() {
  testWidgets("Testing HomePage widget", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // Test: Scaffold widget presence
    expect(find.byType(Scaffold), findsOneWidget);

    // Test: AppBar widget presence
    expect(find.byType(AppBar), findsOneWidget);

    // Test: Text widget presence
    expect(find.byType(Text), findsNWidgets(2));

    // Test: "Leaf" text presence
    expect(find.text("Leaf"), findsOneWidget);

    // Test: "Hello world!" text presence
    expect(find.text("Hello world!"), findsOneWidget);
  });
}
