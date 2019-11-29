import 'package:flutter/material.dart';
import 'package:leaf/model/comment_model.dart';
import 'package:leaf/view/widgets/inherited_widgets/inherited_post_model.dart';
import 'package:leaf/view/widgets/user_details_with_follow.dart';

class CommentsListKeyPrefix {
  static final String singleComment = "Comment";
  static final String commentUser = "Comment User";
  static final String commentText = "Comment Text";
  static final String commentDivider = "Comment Divider";
}

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
            key: ValueKey("${CommentsListKeyPrefix.singleComment} $index"),
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
            key: ValueKey("${CommentsListKeyPrefix.commentUser} $index"),
            userData: commentData.user,
          ),
          Text(
            commentData.comment,
            key: ValueKey("${CommentsListKeyPrefix.commentText} $index"),
            textAlign: TextAlign.left,
          ),
          Divider(
            key: ValueKey("${CommentsListKeyPrefix.commentDivider} $index"),
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
