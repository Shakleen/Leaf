import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/widgets/post_card.dart';

void main() {
  testWidgets("Testing PostCard widget", (WidgetTester tester) async {
    final PostModel postData = DemoValues.posts[0];

    await tester.pumpWidget(MaterialApp(home: PostCard(postData: postData)));

    // Test: Finds GestureDetector
    expect(find.byType(GestureDetector), findsOneWidget);

    // Test: Finds AspectRatio
    expect(find.byType(AspectRatio), findsOneWidget);

    // Test: Finds Card
    expect(find.byType(Card), findsOneWidget);

    // Test: Finds CircleAvatar
    expect(find.byType(CircleAvatar), findsOneWidget);

    // Test: Finds Image
    expect(find.byType(Image), findsOneWidget);

    // Test: Finds react icon
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    // Test: Finds view icon
    expect(find.byIcon(Icons.remove_red_eye), findsOneWidget);

    // Test: Find text user name
    expect(find.text(postData.author.name), findsOneWidget);

    // Test: Find text user email
    expect(find.text(postData.author.email), findsOneWidget);

    // Test: Find text post title
    expect(find.text(postData.title), findsOneWidget);

    // Test: Find text post summary
    expect(find.text(postData.summary), findsOneWidget);

    // Test: Find text post time
    expect(find.text(postData.postTime.toString()), findsOneWidget);

    // Test: Find post react number
    expect(find.text(postData.reacts.toString()), findsOneWidget);

    // Test: Find post view number
    expect(find.text(postData.views.toString()), findsOneWidget);
  });
}