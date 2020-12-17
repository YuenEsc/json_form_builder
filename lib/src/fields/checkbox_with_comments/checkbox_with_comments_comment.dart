import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CheckboxWithCommentsComment extends StatelessWidget {
  CheckboxWithCommentsComment({
    Key key,
    this.rawField,
    this.labelIdentifier,
    this.placeholderIndentifier,
    this.nameIdentifier,
    this.readOnlyIdentifier,
    this.requiredIdentifier,
    this.valueIdentifier,
  }) : super(key: key);

  final Map<String, dynamic> rawField;
  final FocusNode fn = FocusNode();
  final String labelIdentifier;
  final String placeholderIndentifier;
  final String nameIdentifier;
  final String readOnlyIdentifier;
  final String requiredIdentifier;
  final String valueIdentifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: rawField.containsKey(labelIdentifier)
              ? const EdgeInsets.symmetric(vertical: 8.0)
              : null,
          child: Text(
            rawField.containsKey(labelIdentifier)
                ? rawField[labelIdentifier]
                : null,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.left,
          ),
        ),
        FormBuilderTextField(
          focusNode: fn,
          decoration: InputDecoration(
              hintText: rawField.containsKey(placeholderIndentifier)
                  ? rawField[placeholderIndentifier]
                  : null,
              border: OutlineInputBorder()),
          name: rawField[nameIdentifier],
          enabled: rawField.containsKey(readOnlyIdentifier) &&
                  rawField[readOnlyIdentifier] == "true"
              ? false
              : true,
          initialValue: rawField[valueIdentifier],
          validator: rawField.containsKey(requiredIdentifier) &&
                  rawField[requiredIdentifier] == "true"
              ? FormBuilderValidators.required(context)
              : null,
          minLines: 3,
          maxLines: 5,
        )
      ],
    );
  }
}
