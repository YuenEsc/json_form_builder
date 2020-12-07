import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RadioGroupBuilder extends StatelessWidget {
  RadioGroupBuilder({Key key, this.rawField}) : super(key: key);

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
        FormBuilderRadioGroup(
          focusNode: fn,
          decoration: InputDecoration(
            hintText: rawField.containsKey("placeholder")
                ? rawField["placeholder"]
                : null,
            border: InputBorder.none,
          ),
          name: rawField["name"],
          initialValue: rawField["value"],
          enabled: rawField.containsKey("readOnly") && rawField["readOnly"] == "true"
                  ? false
                  : true,
          validator:
              rawField.containsKey("required") && rawField["required"] == "true"
                  ? FormBuilderValidators.required(context)
                  : null,
          options: rawField["options"]
              .map<FormBuilderFieldOption<String>>(
                (option) => FormBuilderFieldOption<String>(
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
