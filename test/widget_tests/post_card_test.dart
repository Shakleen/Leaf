import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/widgets/post_card.dart';
import 'package:leaf/view/widgets/post_stats.dart';
import 'package:leaf/view/widgets/post_time_stamp.dart';
import 'package:leaf/view/widgets/user_details.dart';

final PostModel postData = DemoValues.posts[0];

void main() {
  group("Testing PostCard Widget", () {
    testWidgets(
      "Exactly one GestureDetector widget",
      (WidgetTester tester) async {
        _runTest(tester, () => expect(find.byType(GestureDetector), findsOneWidget));
      },
    );

    testWidgets(
      "Exactly one AspectRatio widget",
      (WidgetTester tester) async {
        _runTest(tester, () => expect(find.byType(AspectRatio), findsOneWidget));
      },
    );

    testWidgets(
      "Exactly one Card widget",
      (WidgetTester tester) async {
        _runTest(tester, () => expect(find.byType(Card), findsOneWidget));
      },
    );

    testWidgets(
      "Exactly one UserDetails widget",
      (WidgetTester tester) async {
        _runTest(tester, () => expect(find.byType(UserDetails), findsOneWidget));
      },
    );

    testWidgets(
      "Exactly one PostStats widget",
      (WidgetTester tester) async {
        _runTest(tester, () => expect(find.byType(PostStats), findsOneWidget));
      },
    );

    testWidgets(
      "Exactly one PostTimeStamp widget",
      (WidgetTester tester) async {
        _runTest(tester, () => expect(find.byType(PostTimeStamp), findsOneWidget));
      },
    );
  });
}

void _runTest(WidgetTester tester, Function test) async {
  await tester.pumpWidget(MaterialApp(home: PostCard(postData: postData)));
  test();
}