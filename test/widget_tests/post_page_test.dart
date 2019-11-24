import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/view/pages/post_page.dart';

void main() {
  testWidgets("Testing PostPage widget", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PostPage()));

    // Test: Finds Scaffold
    expect(find.byType(Scaffold), findsOneWidget);

    // Test: Finds AppBar
    expect(find.byType(AppBar), findsOneWidget);

    // Test: Finds two Text widgets
    expect(find.byType(Text), findsNWidgets(2));

    // Test: Finds "Leaf" text
    expect(find.text("Leaf"), findsOneWidget);

    // Test: Finds "Post page" text
    expect(find.text("Post page"), findsOneWidget);
  });
}