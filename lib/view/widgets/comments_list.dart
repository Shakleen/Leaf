import 'package:flutter/material.dart';
import 'package:leaf/model/comment_model.dart';
import 'package:leaf/view/widgets/inherited_widgets/inherited_post_model.dart';
import 'package:leaf/view/widgets/user_details_with_follow.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<CommentModel> comments =
        InheritedPostModel.of(context).postData.comments;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ExpansionTile(
        leading: Icon(Icons.comment),
        trailing: Text(comments.length.toString()),
        title: Text("Comments"),
        children: List<Widget>.generate(
          comments.length,
          (int index) => _SingleComment(
            key: ValueKey("Comment $index"),
            index: index,
          ),
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
          UserDetailsWithFollow(
            key: ValueKey("Comment User $index"),
            userData: commentData.user,
          ),
          Text(
            commentData.comment,
            key: ValueKey("Comment text $index"),
            textAlign: TextAlign.left,
          ),
          Divider(
            key: ValueKey("Comment divider $index"),
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
