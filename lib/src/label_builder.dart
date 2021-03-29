import 'package:flutter/material.dart';

///Label decorator that wraps the child with a label
///It's intented to be used with a form field
class LabelBuilder extends StatelessWidget {
  const LabelBuilder(
      {Key key, @required this.child, @required this.fieldSchema})
      : super(key: key);

  ///The child that has the label
  final Widget child;

  ///The props of the field
  final Map<String, dynamic> fieldSchema;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: fieldSchema.containsKey("label")
              ? const EdgeInsets.symmetric(vertical: 8.0)
              : null,
          child: Text(
            fieldSchema.containsKey("label") ? fieldSchema["label"] : null,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.left,
          ),
        ),
        child,
      ],
    );
  }
}
