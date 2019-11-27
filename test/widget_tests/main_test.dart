import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/main.dart';
import 'package:leaf/view/pages/home_page.dart';

void main() {
  group("Testing Leaf widget", () {
    testWidgets(
      "Exactly One MaterialApp widget",
      (WidgetTester tester) async {
        _runTest(
            tester, () => expect(find.byType(MaterialApp), findsOneWidget));
      },
    );

    testWidgets(
      "Exactly one HomePage widget",
      (WidgetTester tester) async {
        _runTest(tester, () => expect(find.byType(HomePage), findsOneWidget));
      },
    );
  });
}

void _runTest(WidgetTester tester, Function test) async {
  await tester.pumpWidget(Leaf());
  test();
}
