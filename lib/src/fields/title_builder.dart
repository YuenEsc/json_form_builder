import 'package:flutter/material.dart';

class TitleBuilder extends StatelessWidget {
  const TitleBuilder({Key key, this.rawField}) : super(key: key);

  final Map<String, dynamic> rawField;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.red,
      title: rawField.containsKey("title") ? Text(
        rawField["title"],
        style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
      ) : null,
      subtitle: rawField.containsKey("subtitle") ? Text(
        rawField["subtitle"],
        style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white),
      ) : null,
    );
  }
}
