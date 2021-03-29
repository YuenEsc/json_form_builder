import 'package:flutter/material.dart';
import 'package:json_form_builder/src/field_builder.dart';

class ExpandableFieldBuilder extends StatefulWidget {
  const ExpandableFieldBuilder({
    Key key,
    this.fieldSchema,
  }) : super(key: key);

  final Map<String, dynamic> fieldSchema;

  @override
  _ExpandableFieldBuilderState createState() => _ExpandableFieldBuilderState();
}

class _ExpandableFieldBuilderState extends State<ExpandableFieldBuilder> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.fieldSchema.containsKey("expandable") &&
            widget.fieldSchema["expandable"].containsKey("expandWhen") &&
            widget.fieldSchema["expandable"].containsKey("expandedFields")) {
          return Column(
            children: [
              FieldBuilder(
                fieldSchema: widget.fieldSchema,
                onChanged: (value) {
                  setState(() {
                    isExpanded =
                        widget.fieldSchema["expandable"]["expandWhen"] == value
                            ? true
                            : false;
                  });
                },
                isExpanded: isExpanded,
              ),
              Visibility(
                visible: isExpanded,
                maintainState: true,
                child: Builder(
                  builder: (context) {
                    return Column(
                      children: (widget.fieldSchema["expandable"]
                              ["expandedFields"] as List<dynamic>)
                          .map(
                            (fieldSchema) => ExpandableFieldBuilder(
                              fieldSchema:
                                  (fieldSchema as Map<String, dynamic>),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return FieldBuilder(
            fieldSchema: widget.fieldSchema,
          );
        }
      },
    );
  }
}
