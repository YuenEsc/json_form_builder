import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:json_form_builder/src/fields/checkbox_group_builder.dart';
import 'package:json_form_builder/src/fields/checkbox_with_comments/checkbox_with_comments_builder.dart';
import 'package:json_form_builder/src/fields/date_picker_builder.dart';
import 'package:json_form_builder/src/fields/dropdown_builder.dart';
import 'package:json_form_builder/src/fields/filter_chip_builder.dart';
import 'package:json_form_builder/src/fields/image_picker_builder.dart';
import 'package:json_form_builder/src/fields/location_field_builder.dart';
import 'package:json_form_builder/src/fields/radio_group_builder.dart';
import 'package:json_form_builder/src/fields/searchable_dropdown_builder.dart';
import 'package:json_form_builder/src/fields/segmented_control_builder.dart';
import 'package:json_form_builder/src/fields/switch_with_dropdown/switch_with_dropdown_builder.dart';
import 'package:json_form_builder/src/fields/text_field_builder.dart';
import 'package:json_form_builder/src/fields/title_builder.dart';

class JsonFormBuilder extends StatefulWidget {
  JsonFormBuilder(
      {Key key,
      this.json,
      this.buttonLabel = 'Finalizar',
      this.initialValue,
      this.padding = const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      this.onSubmittedAndValid,
      this.onSubmittedAndNotValid,
      this.enabled = true,
      this.showAction = false,
      ScrollController scrollController})
      : scrollController =
            scrollController == null ? ScrollController() : scrollController,
        super(key: key);

  final String json;
  final String buttonLabel;
  final EdgeInsets padding;
  final bool enabled;
  final bool showAction;
  final Function(Map<String, dynamic> result) onSubmittedAndValid;
  final Function(Map<String, dynamic> result) onSubmittedAndNotValid;
  final Map<String, dynamic> initialValue;
  final ScrollController scrollController;

  @override
  _JsonFormBuilderState createState() => _JsonFormBuilderState();
}

class _JsonFormBuilderState extends State<JsonFormBuilder> {
  final GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

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
    List<Map<String, dynamic>> parsedJson =
        List<Map<String, dynamic>>.from(jsonDecode(widget.json));
    parsedJson.forEach(
      (rawField) {
        if (rawField["type"] == 'datepicker') {
          fields.add(DatePickerBuilder(rawField: rawField));
        } else if (rawField["type"] == 'textfield') {
          fields.add(
            TextFieldBuilder(
              rawField: rawField,
            ),
          );
        } else if (rawField["type"] == 'segmentedcontrol') {
          fields.add(SegmentedControlBuilder(rawField: rawField));
        } else if (rawField["type"] == 'radiogroup') {
          fields.add(RadioGroupBuilder(rawField: rawField));
        } else if (rawField["type"] == 'dropdown') {
          fields.add(DropdownBuilder(rawField: rawField));
        } else if (rawField["type"] == 'checkbox') {
          fields.add(CheckboxGroupBuilder(rawField: rawField));
        } else if (rawField["type"] == 'searchabledropdown') {
          fields.add(SearchableDropdownBuilder(rawField: rawField));
        } else if (rawField["type"] == 'filterchip') {
          fields.add(FilterChipBuilder(rawField: rawField));
        } else if (rawField["type"] == 'locationfield') {
          fields.add(LocationFieldBuilder(rawField: rawField, fbKey: fbKey));
        } else if (rawField["type"] == 'checkbox-with-comments') {
          fields.add(CheckboxWithCommentsBuilder(rawField: rawField));
        } else if (rawField["type"] == 'title') {
          fields.add(TitleBuilder(rawField: rawField));
        } else if (rawField["type"] == 'imagepicker') {
          fields.add(ImagePickerBuilder(rawField: rawField));
        } else if (rawField["type"] == 'switch-with-dropdown'){
          fields.add(SwitchWithDropdownBuilder(rawField: rawField,));
        }
        fields.add(
          SizedBox(
            height: 32,
          ),
        );
      },
    );
    if (widget.enabled || (!widget.enabled && widget.showAction)) {
      fields.addAll(
        [
          SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              child: Text(widget.buttonLabel),
              onPressed: () {
                if (fbKey.currentState.saveAndValidate()) {
                  Map<String, dynamic> result = fbKey.currentState.value;
                  widget.onSubmittedAndValid(result);
                } else {
                  Map<String, dynamic> result = fbKey.currentState.value;
                  widget.onSubmittedAndNotValid(result);
                }
              },
            ),
          )
        ],
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: FormBuilder(
        key: fbKey,
        initialValue: widget.initialValue,
        enabled: widget.enabled,
        child: Padding(
          padding: widget.padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: fields,
          ),
        ),
      ),
    );
  }
}
