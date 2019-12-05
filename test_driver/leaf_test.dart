import 'package:flutter_driver/flutter_driver.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/helper/keys.dart';
import 'package:leaf/model/post_model.dart';
import 'package:test/test.dart';

void main() {
  group('Testing Leaf app', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) driver.close();
    });

    test('HomePage appbar has title Leaf', () async {
      final String foundText = await driver.getText(
        find.byValueKey(HomePageKeys.appBarTitle),
      );
      expect(foundText, "Leaf");
    });

    test('Tapping PostCard to go to PostPage', () async {
      for (final PostModel postData in DemoValues.posts) {
        final SerializableFinder postCardFinder = find.byValueKey(
          HomePageKeys.postCard + postData.title,
        );
        await driver.tap(postCardFinder);

        // Goes to appropriate PostPage.
        // Identified by the Post Title in the app bar
        final SerializableFinder titleFinder = find.byValueKey(
          PostPageKeys.appBarTitle,
        );
        final String returnValue = await driver.getText(titleFinder);
        expect(returnValue, postData.title);

        // Has the right author info

        // Has the right post stats

        // The comment section works

        final SerializableFinder backButtonFinder = find.byValueKey(
          PostPageKeys.backButton,
        );
        await driver.tap(backButtonFinder);
      }
    });
  });
}
