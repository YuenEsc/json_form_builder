import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:json_form_builder/src/label_builder.dart';
import 'package:json_form_builder/src/utils/build_input_decoration.dart';
import 'package:json_form_builder/src/utils/is_field_enabled.dart';
import 'package:json_form_builder/src/utils/validator_builder.dart';

class ImagePickerBuilder extends StatelessWidget {
  ImagePickerBuilder(
      {Key key, this.fieldSchema, this.isExpanded = true, this.onChanged})
      : super(key: key);

  final Map<String, dynamic> fieldSchema;
  final bool isExpanded;
  final FocusNode fn = FocusNode();
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return LabelBuilder(
      child: FormBuilderImagePicker(
        decoration: buildInputDecoration(
          fieldSchema: fieldSchema,
          hasBorder: false,
        ),
        enabled: isFieldEnabled(fieldSchema),
        validator: validatorBuilder(
          context: context,
          fieldSchema: fieldSchema,
          isExpanded: isExpanded,
        ),
        maxImages: fieldSchema["validators"]['arrayMaxLength'] ?? 4,
        name: fieldSchema["name"],
        imageQuality: 50,
        onChanged: onChanged,
      ),
      fieldSchema: fieldSchema,
    );
  }
}
