import 'package:flutter/material.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/presentation/themes.dart';
import 'package:leaf/view/widgets/inherited_widgets/inherited_post_model.dart';

class PostTimeStamp extends StatelessWidget {
  const PostTimeStamp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData = InheritedPostModel.of(context).postData;
    final TextStyle timeTheme = TextThemes.dateStyle;

    return Container(
      width: double.infinity,
      child: Text(
        postData.postTimeFormatted,
        style: timeTheme,
        textAlign: TextAlign.end,
      ),
    );
  }
}