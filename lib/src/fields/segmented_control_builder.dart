import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';

class SegmentedControlBuilder extends StatelessWidget {
  SegmentedControlBuilder({Key key, this.rawField, this.isExpanded = true}) : super(key: key);

  final Map<String, dynamic> rawField;
  final FocusNode fn = FocusNode();
  final bool isExpanded;

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
        FormBuilderSegmentedControl<dynamic>(
          focusNode: fn,
          decoration: InputDecoration(
              hintText: rawField.containsKey("placeholder")
                  ? rawField["placeholder"]
                  : null,
              border: InputBorder.none),
          name: rawField["name"],
          initialValue: rawField["value"],
          enabled:
              rawField.containsKey("readOnly") && rawField["readOnly"] == "true"
                  ? false
                  : true,
          validator:
              rawField.containsKey("required") && (rawField["required"] == "true" && isExpanded)
                  ? FormBuilderValidators.required(context)
                  : null,
          options: rawField["options"]
              .map<FormBuilderFieldOption<dynamic>>(
                (option) => FormBuilderFieldOption<dynamic>(
                    child: Text(option["label"]), value: option["value"]),
              )
              .toList(),
        ),
      ],
    );
  }
}
