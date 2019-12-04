import 'package:flutter/material.dart';
import 'package:leaf/helper/keys.dart';
import 'package:leaf/model/user_model.dart';
import 'package:leaf/view/widgets/user_details.dart';

class UserDetailsWithFollow extends StatelessWidget {
  final UserModel userData;

  const UserDetailsWithFollow({Key key, @required this.userData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: UserDetails(
            key: ValueKey(UserDetailsWithFollowKeys.userDetails),
            userData: userData,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            key: ValueKey(UserDetailsWithFollowKeys.follow),
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
