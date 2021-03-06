import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CheckboxGroupBuilder extends StatelessWidget {
  CheckboxGroupBuilder({Key key, this.rawField, this.isExpanded = true}) : super(key: key);

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
        FormBuilderCheckboxGroup<dynamic>(
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
              ? List<dynamic>.from(rawField["value"])
              : null,
          validator:
              rawField.containsKey("required") && (rawField["required"] == "true" && isExpanded)
                  ? FormBuilderValidators.required(context)
                  : rawField.containsKey("allRequired") && (rawField["allRequired"] == "true")
                  ? (val){
                    if(val!= null && val.length < rawField["options"].length){
                      return FormBuilderLocalizations.of(context).minLengthErrorText(rawField["options"].length);
                    }
                    return null;
                  }
                  : null,
          options: List<Map<String, dynamic>>.from(rawField["options"])
              .map<FormBuilderFieldOption<dynamic>>(
                (option) => FormBuilderFieldOption(
                  child: Text(option["label"]),
                  value: option["value"],
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
