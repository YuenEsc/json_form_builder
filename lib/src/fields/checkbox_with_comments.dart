import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CheckboxWithComments extends StatelessWidget {
  CheckboxWithComments({Key key, this.rawField}) : super(key: key);

  final Map<String, dynamic> rawField;
  final ExpandableController expandableController =
      ExpandableController(initialExpanded: false);
        final FocusNode fn = FocusNode();
        final FocusNode fn1 = FocusNode();
        final FocusNode fn2 = FocusNode();


  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      controller: expandableController,
      child: ExpandablePanel(
        tapHeaderToExpand: false,
        hasIcon: false,
        header: FormBuilderCheckbox(
          focusNode: fn,
          name: rawField["name"],
          title: Text(
            rawField["label"],
            style: Theme.of(context).textTheme.subtitle1,
          ),
          initialValue:
              rawField.containsKey("value") && rawField["value"] == "true"
                  ? rawField["value"]
                  : false,
          onChanged: (value) {
            expandableController.expanded = value;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
        collapsed: SizedBox(
          height: 0,
          width: 0,
        ),
        expanded: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  rawField.containsKey("labelFirstComment")
                      ? const EdgeInsets.symmetric(vertical: 8.0)
                      : null,
              child: Text(
                rawField.containsKey("labelFirstComment")
                    ? rawField["labelFirstComment"]
                    : null,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.left,
              ),
            ),
            FormBuilderTextField(
              focusNode: fn1,
              decoration: InputDecoration(
                  hintText: rawField.containsKey(
                          "placeholderFirstComment")
                      ? rawField["placeholderFirstComment"]
                      : null,
                  border: OutlineInputBorder()),
              name: rawField["nameFirstComment"],
              enabled: rawField.containsKey(
                          "readOnlyFirstComment") &&
                      rawField["readOnlyFirstComment"] ==
                          "true"
                  ? false
                  : true,
              initialValue: rawField["valueFirstComment"],
              validator: rawField.containsKey(
                          "requiredFirstComment") &&
                      rawField["requiredFirstComment"] ==
                          "true"
                  ? FormBuilderValidators.required(context)
                  : null,
              minLines: 3,
              maxLines: 5,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  rawField.containsKey("labelSecondComment")
                      ? const EdgeInsets.symmetric(vertical: 8.0)
                      : null,
              child: Text(
                rawField.containsKey("labelSecondComment")
                    ? rawField["labelSecondComment"]
                    : null,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.left,
              ),
            ),
            FormBuilderTextField(
              focusNode: fn2,
              decoration: InputDecoration(
                  hintText: rawField.containsKey(
                          "placeholderSecondComment")
                      ? rawField["placeholderSecondComment"]
                      : null,
                  border: OutlineInputBorder()),
              name: rawField["nameSecondComment"],
              enabled: rawField.containsKey(
                          "readOnlySecondComment") &&
                      rawField["readOnlySecondComment"] ==
                          "true"
                  ? false
                  : true,
              initialValue: rawField["valueSecondComment"],
              validator: rawField.containsKey(
                          "requiredSecondComment") &&
                      rawField["requiredSecondComment"] ==
                          "true"
                  ? FormBuilderValidators.required(context)
                  : null,
              minLines: 3,
              maxLines: 5,
            )
          ],
        ),
      ),
    );
  }
}
