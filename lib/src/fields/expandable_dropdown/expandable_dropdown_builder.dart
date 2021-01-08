import 'package:flutter/material.dart';
import 'package:json_form_builder/src/fields/expandable_dropdown/expandable_dropdown.dart';
import 'package:json_form_builder/src/fields/expandable_dropdown/expandable_dropdown_expanded.dart';

class ExpandableDropdownBuilder extends StatefulWidget {
  ExpandableDropdownBuilder({Key key, this.rawField}) : super(key: key);
  
  final Map<String, dynamic> rawField;

  @override
  _ExpandableDropdownBuilderState createState() =>
      _ExpandableDropdownBuilderState();
}

class _ExpandableDropdownBuilderState
    extends State<ExpandableDropdownBuilder> {
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
        ExpandableDropdown(
          rawField: widget.rawField,
          onChanged: (value) {
            setState(() {
              isExpanded = widget.rawField["expandValue"] == value;
            });
          },
        ),
        Visibility(
          visible: isExpanded,
          maintainState: false,
          child: ExpandableDropdownExpanded(
            isExpanded: isExpanded,
            rawFieldList: List<Map<String, dynamic>>.from(
                widget.rawField['expandedFields']),
          ),
        )
      ],
    );
  }
}
