import 'package:intl/intl.dart';
import 'package:leaf/model/comment_model.dart';
import 'package:leaf/model/user_model.dart';

class PostModel {
  final String id, title, summary, body, imageURL;
  final DateTime postTime;
  final int reacts, views;
  final UserModel author;
  final List<CommentModel> comments;

  const PostModel({
    this.id,
    this.title,
    this.summary,
    this.body,
    this.imageURL,
    this.author,
    this.postTime,
    this.reacts,
    this.views,
    this.comments,
  });

  String get postTimeFormatted => DateFormat.yMMMMEEEEd().format(postTime);
}
