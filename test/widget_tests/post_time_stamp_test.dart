import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/widgets/inherited_widgets/inherited_post_model.dart';
import 'package:leaf/view/widgets/post_time_stamp.dart';

final PostModel _postData = DemoValues.posts[0];

void main() {

  group("Testing PostTimeStamp widget", () {
    testWidgets("Exactly one text widget found", (WidgetTester tester) async {
      _runTest(tester, () => expect(find.byType(Text), findsOneWidget));
    });

    testWidgets("Exactly one container widget found", (WidgetTester tester) async {
      _runTest(tester, () => expect(find.byType(Container), findsOneWidget));
    });

    testWidgets("Formatted Date Time found", (WidgetTester tester) async {
      _runTest(tester, () => expect(find.text(_postData.postTimeFormatted), findsOneWidget));
    });
  });
}

void _runTest(WidgetTester tester, Function test) async {
  await tester.pumpWidget(MaterialApp(
    home: InheritedPostModel(postData: _postData, child: PostTimeStamp()),
  ));

  test();
}
