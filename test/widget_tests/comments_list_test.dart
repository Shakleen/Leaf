import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/widgets/comments_list.dart';
import 'package:leaf/view/widgets/inherited_widgets/inherited_post_model.dart';

void main() {
  final PostModel postData = DemoValues.posts[0];
  final Widget testWidget = MaterialApp(
    home: Scaffold(
      body: InheritedPostModel(child: CommentsList(), postData: postData),
    ),
  );

  group("Testing CommentsList widget", () {
    testWidgets("Exactly one ExpansionTile", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      final Finder finder = find.byType(ExpansionTile);
      expect(finder, findsOneWidget);
    });

    testWidgets("Exactly one No of comments text", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      final Finder finder = find.text(postData.comments.length.toString());
      expect(finder, findsOneWidget);
    });

    testWidgets("Exactly one No of comments text", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      final Finder finder = find.text("Comments");
      expect(finder, findsOneWidget);
    });

    testWidgets("Exactly one No of comments text", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      final Finder finder = find.text("Comments");
      expect(finder, findsOneWidget);
    });

    testWidgets("Tapping on ExpansionTile", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      final Finder expansionTileFinder = find.byType(ExpansionTile);
      await tester.tap(expansionTileFinder);
      await tester.pump();

      for (int i = 0; i < postData.comments.length; ++i) {
        await tester.drag(expansionTileFinder, const Offset(0, -75));
        await tester.pump();

        expect(
          find.byKey(ValueKey("${CommentsListKeyPrefix.singleComment} $i")),
          findsOneWidget,
        );
        expect(
          find.byKey(ValueKey("${CommentsListKeyPrefix.commentUser} $i")),
          findsOneWidget,
        );
        expect(
          find.byKey(ValueKey("${CommentsListKeyPrefix.commentText} $i")),
          findsOneWidget,
        );
        expect(
          find.byKey(ValueKey("${CommentsListKeyPrefix.commentDivider} $i")),
          findsOneWidget,
        );
      }
    });
  });
}
