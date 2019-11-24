import 'package:leaf/model/post_model.dart';
import 'package:leaf/model/user_model.dart';

class DemoValues {
  static final List<UserModel> users = [
    UserModel(
      id: "1",
      name: "Ishfar",
      email: "ishfar@gmail.com",
      image: "assets/images/user.jpg",
      followers: 123,
      joined: DateTime(2019, 4, 30),
      posts: 12,
    ),
    UserModel(
      id: "2",
      name: "Ishrak",
      email: "ishrak@gmail.com",
      image: "assets/images/user.jpg",
      followers: 456,
      joined: DateTime(2018, 5, 30),
      posts: 13,
    ),
    UserModel(
      id: "3",
      name: "Shakleen",
      email: "shakleen@gmail.com",
      image: "assets/images/user.jpg",
      followers: 789,
      joined: DateTime(2017, 6, 30),
      posts: 14,
    ),
  ];

  static final List<PostModel> posts = [
    PostModel(
      id: "1",
      author: users[0],
      title: "Maple Trees",
      summary: "An in-depth study on maple trees.",
      body: "The study is a lie. I just really really like maple trees.",
      imageURL: "assets/images/leaf.jpg",
      postTime: DateTime(2019, 6, 29),
      reacts: 123,
      views: 456,
    ),
    PostModel(
      id: "2",
      author: users[1],
      title: "Oak Trees",
      summary: "Preaching about oak trees",
      body: "Oak trees are the best. All other trees are sub-par.",
      imageURL: "assets/images/leaf.jpg",
      postTime: DateTime(2019, 4, 13),
      reacts: 321,
      views: 654,
    ),
    PostModel(
      id: "3",
      author: users[2],
      title: "Mango Trees",
      summary: "Gives shadow and fruit. Absolute win, no?",
      body: "I just love mangos. What's better than mangos? The tree that gives mangos.",
      imageURL: "assets/images/leaf.jpg",
      postTime: DateTime(2019, 1, 12),
      reacts: 213,
      views: 546,
    ),
  ];
}
