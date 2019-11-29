import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/model/user_model.dart';
import 'package:leaf/view/widgets/user_details_with_follow.dart';

void main() {
  final UserModel user = DemoValues.users[0];
  final Widget testWidget = MaterialApp(
    home: Scaffold(body: UserDetailsWithFollow(userData: user)),
  );
  group('Testing UserDetailsWithFollow widget', () {
    testWidgets("Exactly one UserDetails", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.byKey(UserDetailsWithFollowKeys.userDetails), findsOneWidget);
    });

    testWidgets("Exactly one follow", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.byKey(UserDetailsWithFollowKeys.follow), findsOneWidget);
    });

    testWidgets("Exactly one follow icon", (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.byIcon(Icons.group_add), findsOneWidget);
    });

  });
}
