import 'package:flutter/material.dart';
import 'package:json_form_builder/src/fields/checkbox_with_comments/checkbox_with_comments_comment.dart';

class CheckboxWithCommentsExpanded extends StatelessWidget {
  CheckboxWithCommentsExpanded({Key key, this.rawField}) : super(key: key);

  final Map<String, dynamic> rawField;

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
        )
      ],
    );
  }
}
