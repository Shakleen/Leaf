import 'package:leaf/model/user_model.dart';

class CommentModel {
  final UserModel user;
  final String comment;
  final DateTime time;

  const CommentModel({this.user, this.comment, this.time});
}
