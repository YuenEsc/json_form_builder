import 'package:flutter/material.dart';
import 'package:json_form_builder/src/fields/switch_with_dropdown/switch_with_dropdown_collapsed.dart';
import 'package:json_form_builder/src/fields/switch_with_dropdown/switch_with_dropdown_expanded.dart';
import 'package:json_form_builder/src/fields/switch_with_dropdown/switch_with_dropdown_switch.dart';

class SwitchWithDropdownBuilder extends StatefulWidget {
  SwitchWithDropdownBuilder({Key key, this.rawField}) : super(key: key);

  final Map<String,dynamic> rawField;

  @override
  _SwitchWithDropdownBuilderState createState() => _SwitchWithDropdownBuilderState();
}

class _SwitchWithDropdownBuilderState extends State<SwitchWithDropdownBuilder> {

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.rawField.containsKey("value") &&
            widget.rawField["value"] == "true"
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchWithDropdownSwitch(
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
          firstChild: SwitchWithDropdownCollapsed(),
          secondChild: SwitchWithDropdownExpanded(
            isExpanded: isExpanded,
            rawField: widget.rawField,
          ),
        ),
      ],
    );
  }
}