import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SearchableDropdownBuilder extends StatelessWidget {
  SearchableDropdownBuilder({Key key, this.rawField}) : super(key: key);

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
        FormBuilderSearchableDropdown<String>(
            focusNode: fn,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            enabled: rawField.containsKey("readOnly") &&
                    rawField["readOnly"] == "true"
                ? false
                : true,
            name: rawField["name"],
            initialValue: rawField["value"].toString(),
            validator: rawField.containsKey("required") &&
                    rawField["required"] == "true"
                ? FormBuilderValidators.required(context)
                : null,
            items: List<String>.from(rawField["options"])),
      ],
    );
  }
}
