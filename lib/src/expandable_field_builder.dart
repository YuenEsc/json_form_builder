import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    isExpanded = widget.fieldSchema.containsKey("value") && 
    widget.fieldSchema.containsKey("expandable") &&
    widget.fieldSchema["expandable"].containsKey("expandWhen") &&
    widget?.fieldSchema["value"] == widget?.fieldSchema["expandable"]["expandWhen"]
    ? true
    : FormBuilder?.of(context)?.initialValue?.containsKey(widget.fieldSchema["name"]) && 
    widget.fieldSchema.containsKey("expandable") &&
    widget.fieldSchema["expandable"].containsKey("expandWhen") && 
    FormBuilder.of(context).initialValue[widget.fieldSchema["name"]] == widget.fieldSchema["expandable"]["expandWhen"] 
    ? true
    : false;
  }

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
