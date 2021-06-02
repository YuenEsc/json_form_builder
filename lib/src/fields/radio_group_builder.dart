import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:json_form_builder/src/label_builder.dart';
import 'package:json_form_builder/src/utils/build_input_decoration.dart';
import 'package:json_form_builder/src/utils/is_field_enabled.dart';
import 'package:json_form_builder/src/utils/validator_builder.dart';

class RadioGroupBuilder extends StatelessWidget {
  RadioGroupBuilder(
      {Key key, this.fieldSchema, this.isExpanded = true, this.onChanged})
      : super(key: key);

  final Map<String, dynamic> fieldSchema;
  final bool isExpanded;
  final FocusNode fn = FocusNode();
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return LabelBuilder(
        child: FormBuilderRadioGroup<dynamic>(
          focusNode: fn,
          decoration: buildInputDecoration(fieldSchema: fieldSchema),
          name: fieldSchema["name"],
          enabled: isFieldEnabled(fieldSchema),
          initialValue: fieldSchema["value"],
          validator: validatorBuilder(
            context: context,
            fieldSchema: fieldSchema,
          ),
          onChanged: onChanged,
          options: fieldSchema["options"]
              .map<DropdownMenuItem<dynamic>>(
                (option) => FormBuilderFieldOption<dynamic>(
                  child: Text(option["label"]),
                  value: option["value"],
                ),
              )
              .toList(),
        ),
        fieldSchema: fieldSchema);
  }
}
