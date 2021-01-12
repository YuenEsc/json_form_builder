import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CheckboxWithCommentsCheckbox extends StatelessWidget {
  CheckboxWithCommentsCheckbox({Key key, this.rawField, this.onChanged}) : super(key: key);

  final Map<String,dynamic> rawField;
  final Function(dynamic value) onChanged;
  final FocusNode fn = FocusNode();

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      focusNode: fn,
      name: rawField["name"],
      title: Text(
        rawField["label"],
        style: Theme.of(context).textTheme.subtitle1,
      ),
      initialValue: rawField.containsKey("value") && rawField["value"] == "true"
          ? true
          : false,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}
