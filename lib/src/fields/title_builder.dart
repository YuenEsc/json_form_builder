import 'package:flutter/material.dart';

class TitleBuilder extends StatelessWidget {
  const TitleBuilder({Key key, this.fieldSchema}) : super(key: key);

  final Map<String, dynamic> fieldSchema;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        title: fieldSchema.containsKey("title")
            ? Text(
                fieldSchema["title"],
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white),
              )
            : null,
        subtitle: fieldSchema.containsKey("subtitle")
            ? Text(
                fieldSchema["subtitle"],
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white),
              )
            : null,
      ),
    );
  }
}
