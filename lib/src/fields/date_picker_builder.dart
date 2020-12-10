import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class DatePickerBuilder extends StatelessWidget {
  DatePickerBuilder({Key key, this.rawField}) : super(key: key);

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
        FormBuilderDateTimePicker(
          focusNode: fn,
          decoration: InputDecoration(
              hintText: rawField.containsKey("placeholder")
                  ? rawField["placeholder"]
                  : null,
              border: OutlineInputBorder()),
          name: rawField["name"],
          inputType: InputType.date,
          format: rawField.containsKey("format")
              ? DateFormat(rawField["format"])
              : DateFormat('y-M-d'),
          validator:
              rawField.containsKey("required") && rawField["required"] == true
                  ? FormBuilderValidators.required(context)
                  : null,
          enabled:
              rawField.containsKey("readOnly") && rawField["readOnly"] == "true"
                  ? false
                  : true,
          initialValue: rawField.containsKey("value") && "value" != null
              ? DateTime.parse(rawField["value"])
              : null,
        ),
      ],
    );
  }
}
