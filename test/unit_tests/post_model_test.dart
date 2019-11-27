import 'package:flutter_test/flutter_test.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/model/user_model.dart';

void main() {
  PostModel postModel = PostModel(
    id: "3",
    author: UserModel(
      id: "3",
      name: "Shakleen",
      email: "shakleen@gmail.com",
      image: "assets/images/user.jpg",
      followers: 789,
      joined: DateTime(2017, 6, 30),
      posts: 14,
    ),
    title: "Mango Trees",
    summary: "Gives shadow and fruit. Absolute win, no?",
    body:
        "I just love mangos. What's better than mangos? The tree that gives mangos.",
    imageURL: "assets/images/leaf.jpg",
    postTime: DateTime(2019, 11, 27, 7, 36),
    reacts: 213,
    views: 546,
  );

  test("Testing PostModel DateTime Formatting", () {
    expect(postModel.postTimeFormatted, "Wednesday, November 27, 2019");
  });
}
