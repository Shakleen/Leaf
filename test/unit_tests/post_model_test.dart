import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/model/post_model.dart';

void main() {
  PostModel postModel = DemoValues.posts[0];

  test("Testing PostModel DateTime Formatting", () {
    expect(postModel.postTimeFormatted, "Wednesday, November 27, 2019");
  });
}
