import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_form_builder/src/label_builder.dart';
import 'package:json_form_builder/src/utils/build_input_decoration.dart';
import 'package:json_form_builder/src/utils/is_field_enabled.dart';
import 'package:json_form_builder/src/utils/validator_builder.dart';

class SegmentedControlBuilder extends StatelessWidget {
  SegmentedControlBuilder(
      {Key key, this.fieldSchema, this.isExpanded = true, this.onChanged})
      : super(key: key);

  final Map<String, dynamic> fieldSchema;
  final FocusNode fn = FocusNode();
  final bool isExpanded;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return LabelBuilder(
      fieldSchema: fieldSchema,
      child: FormBuilderSegmentedControl<dynamic>(
        focusNode: fn,
        decoration: buildInputDecoration(
          fieldSchema: fieldSchema,
          hasBorder: false,
        ),
        name: fieldSchema["name"],
        enabled: isFieldEnabled(fieldSchema),
        validator: validatorBuilder(
          context: context,
          fieldSchema: fieldSchema,
          isExpanded: isExpanded,
        ),
        initialValue: fieldSchema["value"],
        onChanged: onChanged,
        options: fieldSchema["options"]
            .map<FormBuilderFieldOption<dynamic>>(
              (option) => FormBuilderFieldOption<dynamic>(
                child: Text(option["label"]),
                value: option["value"],
              ),
            )
            .toList(),
      ),
    );
  }
}
