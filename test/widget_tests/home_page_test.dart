import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/view/pages/home_page.dart';
import 'package:leaf/view/widgets/post_card.dart';

void main() {
  group("Testing HomePage widget", () {
    testWidgets("Exactly one Scaffold widget", (WidgetTester tester) async {
      _runTest(tester, () => expect(find.byType(Scaffold), findsOneWidget));
    });

    testWidgets("Exactly one AppBar widget", (WidgetTester tester) async {
      _runTest(tester, () => expect(find.byType(AppBar), findsOneWidget));
    });
    
    testWidgets("Exactly one Leaf text", (WidgetTester tester) async {
      _runTest(tester, () => expect(find.text("Leaf"), findsOneWidget));
    });
    
    testWidgets("Exactly one ListView widget", (WidgetTester tester) async {
      _runTest(tester, () => expect(find.byType(ListView), findsOneWidget));
    });
    
    testWidgets("Atleast one PostCard widget", (WidgetTester tester) async {
      _runTest(tester, () => expect(find.byType(PostCard), findsWidgets));
    });
    
  });
}

void _runTest(WidgetTester tester, Function test) async {
  await tester.pumpWidget(MaterialApp(home: HomePage()));
  test();
}
