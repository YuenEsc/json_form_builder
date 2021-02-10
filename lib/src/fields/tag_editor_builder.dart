import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:material_tag_editor/tag_editor.dart';

class TagEditorBuilder extends StatefulWidget {
  TagEditorBuilder({Key key, this.rawField, this.isExpanded = true, this.fbKey})
      : super(key: key);

  final Map<String, dynamic> rawField;
  final GlobalKey<FormBuilderState> fbKey;
  final bool isExpanded;

  @override
  _TagEditorBuilderState createState() => _TagEditorBuilderState();
}

class _TagEditorBuilderState extends State<TagEditorBuilder> {
  final FocusNode fn = FocusNode();
  List<String> values = [];

  @override
  void initState() { 
    super.initState();
    if(widget.rawField.containsKey("value") && widget.rawField["value"] != null){
     values = List<String>.from(widget.rawField["value"]);
    }
  }

  onDelete(index, field) {
    setState(() {
      values.removeAt(index);
    });
    field.didChange(values);
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: "name",
      initialValue: widget.rawField["value"],
          validator:
              widget.rawField.containsKey("required") && (widget.rawField["required"] == "true" && widget.isExpanded)
                  ? FormBuilderValidators.required(context)
                  : null,
      builder: (FormFieldState<dynamic> field) {
        return Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: widget.rawField.containsKey("label")
                  ? const EdgeInsets.symmetric(vertical: 8.0)
                  : null,
              child: Text(
                widget.rawField.containsKey("label")
                    ? widget.rawField["label"]
                    : null,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.left,
              ),
            ),
            TagEditor(
              length: values.length,
              focusNode: fn,
              delimiters: [','],
              hasAddButton: true,
              enabled: widget.fbKey.currentState.enabled,
              inputDecoration: InputDecoration(
              hintText:
                  widget.rawField.containsKey("placeholder") ? widget.rawField["placeholder"] : null,
              border: OutlineInputBorder()),
              onSubmitted: (outstandingValue) {
                setState(() {
                  values.add(outstandingValue);
                });
                field.didChange(values);
              },
              onTagChanged: (newValue) {
                setState(() {
                  values.add(newValue);
                });
                field.didChange(values);
              },
              tagBuilder: (context, index) => _Chip(
                index: index,
                label: values[index],
                onDeleted: (index) {
                  onDelete(index, field);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    @required this.label,
    @required this.onDeleted,
    @required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
