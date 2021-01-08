import 'package:flutter/material.dart';
import 'package:json_form_builder/src/fields/checkbox_with_comments/checkbox_with_comments_comment.dart';

class CheckboxWithCommentsExpanded extends StatelessWidget {
  CheckboxWithCommentsExpanded({Key key, this.rawField, this.isExpanded}) : super(key: key);

  final Map<String, dynamic> rawField;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxWithCommentsComment(
          rawField: rawField,
          labelIdentifier: "labelFirstComment",
          placeholderIndentifier: "placeholderFirstComment",
          nameIdentifier: "nameFirstComment",
          readOnlyIdentifier: "readOnlyFirstComment",
          requiredIdentifier: "requiredFirstComment",
          valueIdentifier: "valueFirstComment",
          isExpanded: isExpanded
        ),
        SizedBox(
          height: 16,
        ),
        CheckboxWithCommentsComment(
          rawField: rawField,
          labelIdentifier: "labelSecondComment",
          placeholderIndentifier: "placeholderSecondComment",
          nameIdentifier: "nameSecondComment",
          readOnlyIdentifier: "readOnlySecondComment",
          requiredIdentifier: "requiredSecondComment",
          valueIdentifier: "valueSecondComment",
          isExpanded: isExpanded
        )
      ],
    );
  }
}
