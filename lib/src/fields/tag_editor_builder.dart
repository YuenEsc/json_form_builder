import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:json_form_builder/src/label_builder.dart';
import 'package:json_form_builder/src/utils/build_input_decoration.dart';
import 'package:json_form_builder/src/utils/is_field_enabled.dart';
import 'package:json_form_builder/src/utils/text_input_type_builder.dart';
import 'package:json_form_builder/src/utils/validator_builder.dart';
import 'package:material_tag_editor/tag_editor.dart';

class TagEditorBuilder extends StatefulWidget {
  TagEditorBuilder(
      {Key key,
      @required this.fieldSchema,
      this.isExpanded = true,
      this.fbKey,
      this.onChanged})
      : super(key: key);

  final Map<String, dynamic> fieldSchema;
  final GlobalKey<FormBuilderState> fbKey;
  final bool isExpanded;
  final ValueChanged onChanged;

  @override
  _TagEditorBuilderState createState() => _TagEditorBuilderState();
}

class _TagEditorBuilderState extends State<TagEditorBuilder> {
  final FocusNode fn = FocusNode();
  List<String> values = [];

  onDelete(index, field) {
    setState(() {
      values.removeAt(index);
    });
    field.didChange(values);
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      onChanged: widget.onChanged,
      name: widget.fieldSchema["name"],
      initialValue: widget.fieldSchema["value"],
      validator: validatorBuilder(
        context: context,
        fieldSchema: widget.fieldSchema,
        isExpanded: widget.isExpanded,
      ),
      enabled: isFieldEnabled(widget.fieldSchema),
      decoration: buildInputDecoration(fieldSchema: widget.fieldSchema),
      builder: (FormFieldState<dynamic> field) {
        return LabelBuilder(
          fieldSchema: widget.fieldSchema,
          child: TagEditor(
            length: values.length,
            focusNode: fn,
            delimiters: [','],
            hasAddButton: true,
            inputDecoration: buildInputDecoration(fieldSchema: widget.fieldSchema),
            enabled: isFieldEnabled(widget.fieldSchema),
            keyboardType: textInputTypeBuilder(widget.fieldSchema),
            onSubmitted: (outstandingValue) {
              setState(() {
                values.add(outstandingValue);
              });
              field.didChange(values);
            },
            onTagChanged: (newValue) {
              setState(() {
                values.add(newValue);
              });
              field.didChange(values);
            },
            tagBuilder: (context, index) => _Chip(
              index: index,
              label: values[index],
              onDeleted: (index) {
                onDelete(index, field);
              },
            ),
          ),
        );
      },
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    @required this.label,
    @required this.onDeleted,
    @required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
