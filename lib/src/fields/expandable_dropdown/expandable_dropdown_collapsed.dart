import 'package:flutter/material.dart';

class ExpandableDropdownCollapsed extends StatelessWidget {
  ExpandableDropdownCollapsed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0,
      width: MediaQuery.of(context).size.width,
    );
  }
}