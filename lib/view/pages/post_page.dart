import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Leaf")),
      body: Center(child: Text("Post page")),
    );
  }
}
