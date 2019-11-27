import 'package:flutter/material.dart';
import 'package:leaf/model/post_model.dart';
import 'package:leaf/view/widgets/inherited_widgets/inherited_post_model.dart';

class PostStats extends StatelessWidget {
  const PostStats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData = InheritedPostModel.of(context).postData;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _ShowStat(
          icon: Icons.favorite,
          number: postData.reacts,
          color: Colors.red,
        ),
        _ShowStat(
          icon: Icons.remove_red_eye,
          number: postData.views,
          color: Colors.green[900],
        ),
      ],
    );
  }
}

class _ShowStat extends StatelessWidget {
  final IconData icon;
  final int number;
  final Color color;

  const _ShowStat({
    Key key,
    @required this.icon,
    @required this.number,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 2.0),
          child: Icon(icon, color: color),
        ),
        Text(number.toString()),
      ],
    );
  }
}