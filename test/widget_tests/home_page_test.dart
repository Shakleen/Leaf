import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/view/pages/home_page.dart';
import 'package:leaf/view/widgets/post_card.dart';

void main() {
  testWidgets("Testing HomePage widget", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // Test: Scaffold widget presence
    expect(find.byType(Scaffold), findsOneWidget);

    // Test: AppBar widget presence
    expect(find.byType(AppBar), findsOneWidget);

    // Test: "Leaf" text presence
    expect(find.text("Leaf"), findsOneWidget);

    // Test: ListView presence
    expect(find.byType(ListView), findsOneWidget);

    // Test: PostCard presence
    expect(find.byType(PostCard), findsWidgets);
  });
}
