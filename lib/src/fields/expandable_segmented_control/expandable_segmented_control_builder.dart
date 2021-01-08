import 'package:flutter/material.dart';
import 'package:json_form_builder/src/fields/expandable_segmented_control/expandable_segmented_control.dart';
import 'package:json_form_builder/src/fields/expandable_segmented_control/expandable_segmented_control_collapsed.dart';
import 'package:json_form_builder/src/fields/expandable_segmented_control/expandable_segmented_control_expanded.dart';

class ExpandableSegmentedControlBuilder extends StatefulWidget {
  ExpandableSegmentedControlBuilder({Key key, this.rawField}) : super(key: key);

  final Map<String, dynamic> rawField;

  @override
  _ExpandableSegmentedControlBuilderState createState() =>
      _ExpandableSegmentedControlBuilderState();
}

class _ExpandableSegmentedControlBuilderState
    extends State<ExpandableSegmentedControlBuilder> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.rawField.containsKey("value") &&
            widget.rawField["value"] == widget.rawField["expandValue"]
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandableSegmentedControl(
          rawField: widget.rawField,
          onChanged: (value) {
            setState(() {
              isExpanded = widget.rawField["expandValue"] == value;
            });
          },
        ),
        AnimatedCrossFade(
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 300),
          firstChild: ExpandableSegmentedControlCollapsed(),
          secondChild: ExpandableSegmentedControlExpanded(
            isExpanded: isExpanded,
            rawFieldList: List<Map<String, dynamic>>.from(
                widget.rawField['expandedFields']),
          ),
        ),
      ],
    );
  }
}
