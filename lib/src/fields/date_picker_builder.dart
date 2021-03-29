import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:json_form_builder/src/label_builder.dart';
import 'package:json_form_builder/src/utils/build_input_decoration.dart';
import 'package:json_form_builder/src/utils/is_field_enabled.dart';

class DatePickerBuilder extends StatelessWidget {
  DatePickerBuilder({
    Key key,
    this.fieldSchema,
    this.isExpanded = true,
    this.onChanged,
  }) : super(key: key);

  final Map<String, dynamic> fieldSchema;
  final bool isExpanded;
  final FocusNode fn = FocusNode();
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return LabelBuilder(
        child: FormBuilderDateTimePicker(
          focusNode: fn,
          decoration: buildInputDecoration(fieldSchema: fieldSchema),
          name: fieldSchema["name"],
          inputType: InputType.date,
          format: fieldSchema.containsKey("format")
              ? DateFormat(fieldSchema["format"])
              : DateFormat('y-M-d'),
          valueTransformer: (DateTime dateTime) {
            if (fieldSchema.containsKey("format")) {
              return DateFormat(fieldSchema["format"]).format(dateTime);
            }
            return DateFormat('y-M-d').format(dateTime);
          },
          initialValue: fieldSchema.containsKey("value") ? DateFormat('y-M-d').parse(fieldSchema["value"]) : null,
          enabled: isFieldEnabled(fieldSchema),
          onChanged: onChanged,
        ),
        fieldSchema: fieldSchema);
  }
}
