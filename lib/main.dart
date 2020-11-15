import 'package:flutter/material.dart';
import 'package:leaf/view/pages/home_page.dart';
import 'package:leaf/view/presentation/themes.dart';

void main() => runApp(Leaf());

class Leaf extends StatelessWidget {
  const Leaf({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline6: TextThemes.title,
          subtitle2: TextThemes.subtitle,
          bodyText2: TextThemes.body1,
        ),
      ),
      home: HomePage(),
    );
  }
}
