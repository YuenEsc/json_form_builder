import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CheckboxGroupBuilder extends StatelessWidget {
  CheckboxGroupBuilder({Key key, this.rawField}) : super(key: key);

  final Map<String, dynamic> rawField;
  final FocusNode fn = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: rawField.containsKey("label")
              ? const EdgeInsets.symmetric(vertical: 8.0)
              : null,
          child: Text(
            rawField.containsKey("label") ? rawField["label"] : null,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.left,
          ),
        ),
        FormBuilderCheckboxGroup<String>(
          focusNode: fn,
          decoration: InputDecoration(
            hintText: rawField.containsKey("placeholder")
                ? rawField["placeholder"]
                : null,
            border: InputBorder.none,
          ),
          name: rawField["name"],
          orientation: OptionsOrientation.vertical,
          initialValue: rawField["value"] != null
              ? List<String>.from(rawField["value"])
              : null,
          validator:
              rawField.containsKey("required") && rawField["required"] == "true"
                  ? FormBuilderValidators.required(context)
                  : null,
          options: List<Map<String, dynamic>>.from(rawField["options"])
              .map<FormBuilderFieldOption<String>>(
                (option) => FormBuilderFieldOption(
                  child: Text(option["label"]),
                  value: option["value"].toString(),
                ),
              )
              .toList(),
          enabled:
              rawField.containsKey("readOnly") && rawField["readOnly"] == "true"
                  ? false
                  : true,
        ),
      ],
    );
  }
}
