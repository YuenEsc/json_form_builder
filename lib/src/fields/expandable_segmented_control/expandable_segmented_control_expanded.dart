import 'package:flutter/material.dart';
import 'package:json_form_builder/src/fields/checkbox_group_builder.dart';
import 'package:json_form_builder/src/fields/date_picker_builder.dart';
import 'package:json_form_builder/src/fields/dropdown_builder.dart';
import 'package:json_form_builder/src/fields/expandable_dropdown/expandable_dropdown_builder.dart';
import 'package:json_form_builder/src/fields/filter_chip_builder.dart';
import 'package:json_form_builder/src/fields/radio_group_builder.dart';
import 'package:json_form_builder/src/fields/segmented_control_builder.dart';
import 'package:json_form_builder/src/fields/text_field_builder.dart';

class ExpandableSegmentedControlExpanded extends StatefulWidget {
  ExpandableSegmentedControlExpanded({Key key, this.rawFieldList, this.isExpanded})
      : super(key: key);

  final List<Map<String, dynamic>> rawFieldList;
  final bool isExpanded;

  @override
  _ExpandableSegmentedControlExpandedState createState() =>
      _ExpandableSegmentedControlExpandedState();
}

class _ExpandableSegmentedControlExpandedState
    extends State<ExpandableSegmentedControlExpanded> {
  List<Widget> fields = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    buildFieldsFromJson();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    buildFieldsFromJson();
  }

  buildFieldsFromJson() {
    fields = [];
    widget.rawFieldList.forEach(
      (rawField) {
        if (rawField["type"] == 'datepicker') {
          fields.add(DatePickerBuilder(rawField: rawField, isExpanded: widget.isExpanded,));
        } else if (rawField["type"] == 'textfield') {
          fields.add(
            TextFieldBuilder(
              rawField: rawField,
              isExpanded: widget.isExpanded,
            ),
          );
        } else if (rawField["type"] == 'segmentedcontrol') {
          fields.add(SegmentedControlBuilder(rawField: rawField, isExpanded: widget.isExpanded,));
        } else if (rawField["type"] == 'radiogroup') {
          fields.add(RadioGroupBuilder(rawField: rawField, isExpanded: widget.isExpanded,));
        } else if (rawField["type"] == 'dropdown') {
          fields.add(DropdownBuilder(rawField: rawField, isExpanded: widget.isExpanded,));
        } else if (rawField["type"] == 'checkbox') {
          fields.add(CheckboxGroupBuilder(rawField: rawField, isExpanded: widget.isExpanded,));
        } else if (rawField["type"] == 'filterchip') {
          fields.add(FilterChipBuilder(rawField: rawField, isExpanded: widget.isExpanded,));
        } else if (rawField["type"] == 'expandable-dropdown') {
          fields.add(
            ExpandableDropdownBuilder(
              rawField: rawField,
            ),
          );
        }
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: fields,
    );
  }
}
