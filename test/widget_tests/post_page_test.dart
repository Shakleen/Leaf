import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/pages/post_page.dart';

final PostModel postData = DemoValues.posts[0];

void main() {
  group("Testing PostPage widget", () {
    testWidgets("Exactly one Scaffold widget", (WidgetTester tester) async {
      _runTest(tester, () => expect(find.byType(Scaffold), findsOneWidget));
    });

    testWidgets("Exactly one Scaffold widget", (WidgetTester tester) async {
      _runTest(tester, () => expect(find.byType(AppBar), findsOneWidget));
    });

    testWidgets("Exactly one Scaffold widget", (WidgetTester tester) async {
      _runTest(tester, () => expect(find.byType(Text), findsNWidgets(2)));
    });

    testWidgets("Exactly one Scaffold widget", (WidgetTester tester) async {
      _runTest(tester, () => expect(find.text("Leaf"), findsOneWidget));
    });
    
    testWidgets("Exactly one Scaffold widget", (WidgetTester tester) async {
      _runTest(tester, () => expect(find.text(postData.title), findsOneWidget));
    });
  });
}

void _runTest(WidgetTester tester, Function test) async {
  await tester.pumpWidget(MaterialApp(home: PostPage(postData: postData)));
  test();
}
