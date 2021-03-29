import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:json_form_builder/src/utils/build_input_decoration.dart';
import 'package:json_form_builder/src/label_builder.dart';
import 'package:json_form_builder/src/utils/is_field_enabled.dart';
import 'package:json_form_builder/src/utils/validator_builder.dart';

class CheckboxGroupBuilder extends StatelessWidget {
  CheckboxGroupBuilder(
      {Key key,
      @required this.fieldSchema,
      this.isExpanded = true,
      this.onChanged})
      : super(key: key);

  final Map<String, dynamic> fieldSchema;
  final FocusNode fn = FocusNode();
  final bool isExpanded;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return LabelBuilder(
      fieldSchema: fieldSchema,
      child: FormBuilderCheckboxGroup<dynamic>(
        focusNode: fn,
        decoration:
            buildInputDecoration(fieldSchema: fieldSchema, hasBorder: false),
        name: fieldSchema["name"],
        orientation: OptionsOrientation.vertical,
        initialValue: fieldSchema["value"] != null
            ? List<dynamic>.from(fieldSchema["value"])
            : null,
        validator: validatorBuilder(
          context: context,
          fieldSchema: fieldSchema,
          isExpanded: isExpanded,
        ),
        options: List<Map<String, dynamic>>.from(fieldSchema["options"])
            .map<FormBuilderFieldOption<dynamic>>(
              (option) => FormBuilderFieldOption(
                child: Text(option["label"]),
                value: option["value"],
              ),
            )
            .toList(),
        enabled: isFieldEnabled(fieldSchema),
        onChanged: onChanged,
      ),
    );
  }
}
