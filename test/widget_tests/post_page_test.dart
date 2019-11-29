import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/pages/post_page.dart';

final PostModel postData = DemoValues.posts[0];

void main() {
  group("Testing PostPage widget", () {
    testWidgets("Exactly one Scaffold widget", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: PostPage(postData: postData)));
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets("Exactly one AppBar widget", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: PostPage(postData: postData)));
      expect(find.byType(AppBar), findsOneWidget);
    });
    
    testWidgets("Exactly one title text", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: PostPage(postData: postData)));
      expect(find.text(postData.title), findsOneWidget);
    });
    
    testWidgets("Exactly one whole page widget", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: PostPage(postData: postData)));
      expect(find.byKey(PostPageKeys.wholePage), findsOneWidget);
    });
    
    testWidgets("Exactly one BannerImage widget", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: PostPage(postData: postData)));
      expect(find.byKey(PostPageKeys.bannerImage), findsOneWidget);
    });
  });
}