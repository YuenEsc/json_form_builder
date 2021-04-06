import 'package:flutter/material.dart';
import 'package:json_form_builder/src/fields/date_picker_builder.dart';
import 'package:json_form_builder/src/fields/fields.dart';
import 'package:json_form_builder/src/fields/image_picker_builder.dart';
import 'package:json_form_builder/src/fields/location_field_builder.dart';

///delegates the field constructor to the corresponding type based on it
class FieldBuilder extends StatelessWidget {
  const FieldBuilder({
    Key key,
    this.fieldSchema,
    this.onChanged,
    this.isExpanded = true,
  }) : super(key: key);

  final Map<String, dynamic> fieldSchema;
  final ValueChanged onChanged;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (fieldSchema.containsKey('type')) {
          if (fieldSchema["type"] == "textfield") {
            return TextFieldBuilder(
              fieldSchema: fieldSchema,
              isExpanded: isExpanded,
              onChanged: onChanged,
            );
          }
          if (fieldSchema["type"] == "checkboxgroup") {
            return CheckboxGroupBuilder(
              fieldSchema: fieldSchema,
              onChanged: onChanged,
            );
          }
          if (fieldSchema["type"] == "datepicker") {
            return DatePickerBuilder(
              fieldSchema: fieldSchema,
              onChanged: onChanged,
            
            );
          }
          if (fieldSchema["type"] == "imagepicker") {
            return ImagePickerBuilder(
              fieldSchema: fieldSchema,
              onChanged: onChanged,
            
            );
          }
          if (fieldSchema["type"] == "segmentedcontrol") {
            return SegmentedControlBuilder(
              fieldSchema: fieldSchema,
              onChanged: onChanged,
            
            );
          }
          if (fieldSchema["type"] == "switch") {
            return SwtichBuilder(
              fieldSchema: fieldSchema,
              onChanged: onChanged,
            
            );
          }
          if (fieldSchema["type"] == "checkbox") {
            return CheckboxBuilder(
              fieldSchema: fieldSchema,
              onChanged: onChanged,
            
            );
          }
          if (fieldSchema["type"] == "dropdown") {
            return DropdownBuilder(
              fieldSchema: fieldSchema,
              onChanged: onChanged,
            );
          }
           if (fieldSchema["type"] == "tageditor") {
            return TagEditorBuilder(
              fieldSchema: fieldSchema,
              onChanged: onChanged,
            );
          }
          if (fieldSchema["type"] == "title") {
            return TitleBuilder(
              fieldSchema: fieldSchema,
            );
          }if (fieldSchema["type"] == "locationfield") {
            return LocationFieldBuilder(
              fieldSchema: fieldSchema,
            );
          }
          return SizedBox.shrink();
        } else {
          throw FormatException("type property must be specified");
        }
      },
    );
  }
}
