import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/pages/post_page.dart';
import 'package:leaf/view/widgets/comments_list.dart';
import 'package:leaf/view/widgets/post_stats.dart';
import 'package:leaf/view/widgets/post_time_stamp.dart';
import 'package:leaf/view/widgets/user_details_with_follow.dart';

void main() {
  final PostModel postData = DemoValues.posts[0];

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

    testWidgets("Exactly one Summary widget", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: PostPage(postData: postData)));
      await tester.drag(find.byType(ListView), Offset(0, -100));
      await tester.pump();
      expect(find.byKey(PostPageKeys.summary), findsOneWidget);
    });

    testWidgets("Exactly one PostTimeStamp widget",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: PostPage(postData: postData)));
      await tester.drag(find.byType(ListView), Offset(0, -100));
      await tester.pump();
      expect(find.byType(PostTimeStamp), findsOneWidget);
    });

    testWidgets("Exactly one MainBody widget", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: PostPage(postData: postData)));
      await tester.drag(find.byType(ListView), Offset(0, -100));
      await tester.pump();
      expect(find.byKey(PostPageKeys.mainBody), findsOneWidget);
    });

    testWidgets("Exactly one UserDetailsWithFollow widget",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: PostPage(postData: postData)));
      await tester.drag(find.byType(ListView), Offset(0, -100));
      await tester.pump();
      expect(find.byType(UserDetailsWithFollow), findsOneWidget);
    });

    testWidgets("Exactly one PostStats widget", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: PostPage(postData: postData)));
      await tester.drag(find.byType(ListView), Offset(0, -100));
      await tester.pump();
      expect(find.byType(PostStats), findsOneWidget);
    });

    testWidgets("Exactly one CommentsList widget", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: PostPage(postData: postData)));
      await tester.drag(find.byType(ListView), Offset(0, -100));
      await tester.pump();
      expect(find.byType(CommentsList), findsOneWidget);
    });
  });
}
