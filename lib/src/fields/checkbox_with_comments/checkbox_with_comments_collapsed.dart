import 'package:flutter/material.dart';

class CheckboxWithCommentsCollapsed extends StatelessWidget {
  CheckboxWithCommentsCollapsed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0,
      width: MediaQuery.of(context).size.width,
    );
  }
}
