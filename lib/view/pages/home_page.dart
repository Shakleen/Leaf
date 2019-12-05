import 'package:flutter/material.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/helper/keys.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/widgets/post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leaf",
          key: ValueKey(HomePageKeys.appBarTitle),
        ),
      ),
      body: ListView.builder(
        key: ValueKey(HomePageKeys.listView),
        itemCount: DemoValues.posts.length,
        itemBuilder: (BuildContext context, int index) {
          final PostModel postData = DemoValues.posts[index];
          return PostCard(
            key: ValueKey(HomePageKeys.postCard + postData.title),
            postData: postData,
          );
        },
      ),
    );
  }
}
