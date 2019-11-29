import 'package:flutter/material.dart';
import 'package:leaf/model/comment_model.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/model/user_model.dart';
import 'package:leaf/view/presentation/themes.dart';
import 'package:leaf/view/widgets/inherited_widgets/inherited_post_model.dart';
import 'package:leaf/view/widgets/post_stats.dart';
import 'package:leaf/view/widgets/post_time_stamp.dart';
import 'package:leaf/view/widgets/user_details.dart';

class PostPageKeys {
  static final ValueKey wholePage = ValueKey("wholePage");
  static final ValueKey bannerImage = ValueKey("bannerImage");
  static final ValueKey summary = ValueKey("summary");
}

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
          key: PostPageKeys.wholePage,
          children: <Widget>[
            _BannerImage(key: PostPageKeys.bannerImage),
            _NonImageContents(),
          ],
        ),
      ),
    );
  }
}

class _NonImageContents extends StatelessWidget {
  const _NonImageContents({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData = InheritedPostModel.of(context).postData;

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _Summary(key: PostPageKeys.summary),
          PostTimeStamp(),
          _MainBody(),
          _AuthorDetails(author: postData.author),
          SizedBox(height: 8.0),
          PostStats(),
          Comments(),
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
  final UserModel author;

  const _AuthorDetails({Key key, @required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(flex: 2, child: UserDetails(userData: author)),
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
    );
  }
}

class Comments extends StatelessWidget {
  const Comments({Key key}) : super(key: key);

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
  final int index;

  const _SingleComment({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CommentModel commentData =
        InheritedPostModel.of(context).postData.comments[index];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _AuthorDetails(author: commentData.user),
          Text(commentData.comment, textAlign: TextAlign.left),
          Divider(color: Colors.black45),
        ],
      ),
    );
  }
}
