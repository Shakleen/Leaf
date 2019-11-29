import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/widgets/post_card.dart';
import 'package:leaf/view/widgets/post_stats.dart';
import 'package:leaf/view/widgets/post_time_stamp.dart';
import 'package:leaf/view/widgets/user_details.dart';

void main() {
  final PostModel postData = DemoValues.posts[0];
  final Widget testWidget = MaterialApp(home: PostCard(postData: postData));

  group("Testing PostCard Widget", () {
    testWidgets("Exactly one GestureDetector", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets("Exactly one AspectRatio", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.byType(AspectRatio), findsOneWidget);
    });

    testWidgets("Exactly one Card", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets("Exactly one UserDetails", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.byType(UserDetails), findsOneWidget);
    });

    testWidgets("Exactly one PostStats", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.byType(PostStats), findsOneWidget);
    });

    testWidgets("Exactly one PostTimeStamp", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.byType(PostTimeStamp), findsOneWidget);
    });
  });
}
