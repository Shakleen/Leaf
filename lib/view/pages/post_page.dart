import 'package:flutter/material.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/presentation/themes.dart';
import 'package:leaf/view/widgets/inherited_widgets/inherited_post_model.dart';
import 'package:leaf/view/widgets/post_stats.dart';
import 'package:leaf/view/widgets/post_time_stamp.dart';
import 'package:leaf/view/widgets/user_details.dart';

class PostPage extends StatelessWidget {
  final PostModel postData;

  const PostPage({Key key, @required this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(postData.title)),
      body: InheritedPostModel(
        postData: postData,
        child: ListView(
          children: <Widget>[_BannerImage(), _NonImageContents()],
        ),
      ),
    );
  }
}

class _NonImageContents extends StatelessWidget {
  const _NonImageContents({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _Summary(),
          PostTimeStamp(),
          _MainBody(),
          _AuthorDetails(),
          PostStats(),
          _Comments(),
        ],
      ),
    );
  }
}

class _BannerImage extends StatelessWidget {
  const _BannerImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData = InheritedPostModel.of(context).postData;

    return Container(
      child: Image.asset(postData.imageURL, fit: BoxFit.fitWidth),
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData = InheritedPostModel.of(context).postData;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(postData.summary, style: TextThemes.title),
    );
  }
}

class _MainBody extends StatelessWidget {
  const _MainBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData = InheritedPostModel.of(context).postData;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(postData.body, style: TextThemes.body1),
    );
  }
}

class _AuthorDetails extends StatelessWidget {
  const _AuthorDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: UserDetails(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.group_add),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Comments extends StatelessWidget {
  const _Comments({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData = InheritedPostModel.of(context).postData;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ExpansionTile(
        leading: Icon(Icons.comment),
        trailing: Text(postData.comments.length.toString()),
        title: Text("Comments"),
        children: List<Widget>.generate(
          postData.comments.length,
          (int index) => _SingleComment(index: index),
        ),
      ),
    );
  }
}

class _SingleComment extends StatelessWidget {
  const _SingleComment({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final PostModel postData = InheritedPostModel.of(context).postData;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _AuthorDetails(),
          Text(postData.comments[index].comment, textAlign: TextAlign.left),
          Divider(color: Colors.black45),
        ],
      ),
    );
  }
}
