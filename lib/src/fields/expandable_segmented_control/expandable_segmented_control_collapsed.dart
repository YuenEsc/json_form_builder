import 'package:flutter/material.dart';

class ExpandableSegmentedControlCollapsed extends StatelessWidget {
  ExpandableSegmentedControlCollapsed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0,
      width: MediaQuery.of(context).size.width,
    );
  }
}