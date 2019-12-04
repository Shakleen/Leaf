import 'package:intl/intl.dart';

class UserModel {
  final String id, name, email, image;
  final int followers;
  final DateTime joined;
  final int posts;

  const UserModel({
    this.id,
    this.name,
    this.email,
    this.image,
    this.followers,
    this.joined,
    this.posts,
  });

  String get postTimeFormatted => DateFormat.yMMMMEEEEd().format(joined);
}
