import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SwitchWithDropdownSwitch extends StatelessWidget {
  SwitchWithDropdownSwitch({Key key, this.rawField, this.onChanged}) : super(key: key);

  final Map<String,dynamic> rawField;
  final Function(dynamic value) onChanged;
  final FocusNode fn = FocusNode();

  @override
  Widget build(BuildContext context) {
    return FormBuilderSwitch(
      focusNode: fn,
      name: rawField["name"],
      title: Text(
        rawField["label"],
        style: Theme.of(context).textTheme.subtitle1,
      ),
      initialValue: rawField.containsKey("value") && rawField["value"] == "true"
          ? rawField["value"]
          : false,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}