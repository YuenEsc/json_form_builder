import 'package:flutter/material.dart';
import 'package:json_form_builder/src/fields/checkbox_with_comments/checkbox_with_comments_checkbox.dart';
import 'package:json_form_builder/src/fields/checkbox_with_comments/checkbox_with_comments_collapsed.dart';
import 'package:json_form_builder/src/fields/checkbox_with_comments/checkbox_with_comments_expanded.dart';

class CheckboxWithCommentsBuilder extends StatefulWidget {
  CheckboxWithCommentsBuilder({Key key, this.rawField}) : super(key: key);

  final Map<String, dynamic> rawField;

  @override
  _CheckboxWithCommentsBuilderState createState() =>
      _CheckboxWithCommentsBuilderState();
}

class _CheckboxWithCommentsBuilderState
    extends State<CheckboxWithCommentsBuilder> {

  final FocusNode fn = FocusNode();
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.rawField.containsKey("value") &&
            widget.rawField["value"] == "true"
        ? widget.rawField["value"]
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxWithCommentsCheckbox(
          rawField: widget.rawField,
          onChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
        ),
        AnimatedCrossFade(
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 300),
          firstChild: CheckboxWithCommentsCollapsed(),
          secondChild: CheckboxWithCommentsExpanded(
            rawField: widget.rawField,
          ),
        ),
      ],
    );
  }
}
