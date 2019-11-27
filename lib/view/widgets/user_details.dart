import 'package:flutter/material.dart';
import 'package:leaf/helper/common.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/widgets/inherited_widgets/inherited_post_model.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[_UserImage(), _UserNameAndEmail()],
      ),
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData = InheritedPostModel.of(context).postData;
    final TextStyle nameTheme = Theme.of(context).textTheme.subtitle;
    final TextStyle emailTheme = Theme.of(context).textTheme.body1;
    final int flex = isLandscape(context) ? 10 : 5;

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(postData.author.name, style: nameTheme),
            SizedBox(height: 2.0),
            Text(postData.author.email, style: emailTheme),
          ],
        ),
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData = InheritedPostModel.of(context).postData;
    return Expanded(
      flex: 1,
      child: CircleAvatar(backgroundImage: AssetImage(postData.author.image)),
    );
  }
}