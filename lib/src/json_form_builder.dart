import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:json_form_builder/src/expandable_field_builder.dart';

///A form widget that takes a JSON string and builds a form from it
class JsonFormBuilder extends StatefulWidget {
  JsonFormBuilder({
    Key key,
    GlobalKey<FormBuilderState> fbKey,
    ScrollController scrollController,
    @required this.json,
    this.initialValue,
    this.padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    this.onFinish,
    this.showSubmitButton = true,
    this.submitButtonLabel = "Submit",
    this.onFinishFailed,
    this.onChanged,
    this.enabled = true,
    this.onWillPop,
  })  : scrollController =
            scrollController == null ? ScrollController() : scrollController,
        fbKey = fbKey == null ? GlobalKey<FormBuilderState>() : fbKey;

  /// Specify a key for this widget to access to his state
  final GlobalKey<FormBuilderState> fbKey;

  /// The json from witch it will render the json
  final String json;

  /// The padding of the ScrollView that wraps the form component
  final EdgeInsets padding;

  ///Whether the form is able to receive user input.
  ///
  /// Defaults to true.
  ///
  /// When false all the form fields will be disabled - won't accept input - and their enabled state will be ignored.
  final bool enabled;
  final String submitButtonLabel;
  final bool showSubmitButton;
  final Function(Map<String, dynamic> result) onFinish;
  final Function(Map<String, dynamic> result) onFinishFailed;
  final ScrollController scrollController;

  ///An optional Map of field initialValues. Keys correspond to the field's name and value to the initialValue of the field.
  ///
  ///The initialValues set here will be ignored if the field has a local initialValue set.
  final Map<String, dynamic> initialValue;

  ///Enables the form to veto attempts by the user to dismiss the [ModalRoute] that contains the form.
  ///
  ///If the callback returns a Future that resolves to false, the form's route will not be popped.
  ///
  ///See also:
  ///
  ///[WillPopScope], another widget that provides a way to intercept the back button.
  final WillPopCallback onWillPop;

  /// Called when one of the form fields changes.
  ///
  /// In addition to this callback being invoked, all the form fields themselves will rebuild.
  final VoidCallback onChanged;

  @override
  _JsonFormBuilderState createState() => _JsonFormBuilderState();
}

class _JsonFormBuilderState extends State<JsonFormBuilder> {
  List<Widget> fields = [];

  @override
  void initState() {
    super.initState();
    buildFieldsFromJson();
  }

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

  submitForm() {
    if (widget.fbKey.currentState.saveAndValidate()) {
      Map<String, dynamic> values = widget.fbKey.currentState.value;
      if (widget?.onFinish != null) widget?.onFinish(values);
    } else {
      Map<String, dynamic> values = widget.fbKey.currentState.value;
      if (widget?.onFinishFailed != null) widget?.onFinishFailed(values);
    }
  }

  buildFieldsFromJson() {
    fields = [];
    List<Map<String, dynamic>> parsedJson =
        List<Map<String, dynamic>>.from(jsonDecode(widget.json));
    parsedJson.forEach((fieldSchema) {
      fields.add(ExpandableFieldBuilder(
        fieldSchema: fieldSchema,
      ));
      fields.add(SizedBox(
        height: 32.0,
      ));
    });
    if (widget.showSubmitButton) {
      fields.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: submitForm,
              child: Text('Submit'),
            ),
          ),
        ),
      );
    }
    setState(() {
      fields = fields;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: widget.padding,
      child: FormBuilder(
        key: widget.fbKey,
        initialValue: widget.initialValue,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        onWillPop: widget.onWillPop,
        child: Column(
          children: fields,
        ),
      ),
    );
  }
}
