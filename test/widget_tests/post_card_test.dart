import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/view/widgets/post_card.dart';

void main() {
  testWidgets("Testing PostCard widget", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PostCard()));

    // Test: Finds AspectRatio
    expect(find.byType(AspectRatio), findsOneWidget);

    // Test: Finds Card
    expect(find.byType(Card), findsOneWidget);

    // Test: Finds CircleAvatar
    expect(find.byType(CircleAvatar), findsOneWidget);

    // Test: Finds Image
    expect(find.byType(Image), findsOneWidget);

    // Test: Find text user name
    expect(find.text(DemoValues.userName), findsOneWidget);

    // Test: Find text user email
    expect(find.text(DemoValues.userEmail), findsOneWidget);

    // Test: Find text post title
    expect(find.text(DemoValues.postTime), findsOneWidget);

    // Test: Find text post summary
    expect(find.text(DemoValues.postSummary), findsOneWidget);

    // Test: Find text post time
    expect(find.text(DemoValues.postTime), findsOneWidget);
  });
}