import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/pages/post_page.dart';

void main() {
  testWidgets("Testing PostPage widget", (WidgetTester tester) async {
    final PostModel postData = DemoValues.posts[0];

    await tester.pumpWidget(MaterialApp(home: PostPage(postData: postData)));

    // Test: Finds Scaffold
    expect(find.byType(Scaffold), findsOneWidget);

    // Test: Finds AppBar
    expect(find.byType(AppBar), findsOneWidget);

    // Test: Finds two Text widgets
    expect(find.byType(Text), findsNWidgets(2));

    // Test: Finds "Leaf" text
    expect(find.text("Leaf"), findsOneWidget);

    // Test: Finds post title text
    expect(find.text(postData.title), findsOneWidget);
  });
}