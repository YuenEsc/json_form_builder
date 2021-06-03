import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:json_form_builder/src/utils/build_input_decoration.dart';
import 'package:json_form_builder/src/utils/is_field_enabled.dart';
import 'package:json_form_builder/src/utils/validator_builder.dart';

class SwitchBuilder extends StatelessWidget {
  SwitchBuilder(
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
    return FormBuilderSwitch(
      focusNode: fn,
      decoration: buildInputDecoration(
        fieldSchema: fieldSchema,
        hasBorder: false,
      ),
      title: fieldSchema.containsKey("label")
          ? Text(
              fieldSchema["label"],
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.w500),
            )
          : null,
      name: fieldSchema["name"],
      enabled: isFieldEnabled(fieldSchema),
      initialValue:
          fieldSchema.containsKey("value") && fieldSchema["value"] == true
              ? true
              : FormBuilder?.of(context)
                      ?.initialValue
                      ?.containsKey(fieldSchema["name"])
                  ? FormBuilder.of(context).initialValue[fieldSchema["name"]]
                  : false,
      validator: validatorBuilder(
        context: context,
        fieldSchema: fieldSchema,
        isExpanded: isExpanded,
      ),
      onChanged: onChanged,
    );
  }
}
