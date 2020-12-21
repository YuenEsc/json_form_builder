import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';

class SwitchWithDropdownExpanded extends StatelessWidget {
  SwitchWithDropdownExpanded({Key key, this.rawField}) : super(key: key);

  final Map<String, dynamic> rawField;
  final FocusNode fn = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: rawField.containsKey("labelDropdown")
              ? const EdgeInsets.symmetric(vertical: 8.0)
              : null,
          child: Text(
            rawField.containsKey("labelDropdown") ? rawField["labelDropdown"] : null,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.left,
          ),
        ),
        FormBuilderDropdown<String>(
          focusNode: fn,
          decoration: InputDecoration(
            hintText: rawField.containsKey("placeholderDropdown")
                ? rawField["placeholderDropdown"]
                : null,
            border: OutlineInputBorder(),
          ),
          name: rawField["nameDropdown"],
          initialValue: rawField["valueDropdown"],
          enabled:
              rawField.containsKey("readOnlyDropdown") && rawField["readOnlyDropdown"] == "true"
                  ? false
                  : true,
          validator:
              rawField.containsKey("requiredDropdown") && rawField["requiredDropdown"] == "true"
                  ? FormBuilderValidators.required(context)
                  : null,
          items: rawField["optionsDropdown"]
              .map<DropdownMenuItem<String>>(
                (option) => DropdownMenuItem<String>(
                  child: Text(option["label"]),
                  value: option["value"],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
