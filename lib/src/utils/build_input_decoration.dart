import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(
    {Map<String, dynamic> fieldSchema, bool hasBorder = true}) {
  return InputDecoration(
    hintText: fieldSchema.containsKey("placeholder")
        ? fieldSchema["placeholder"]
        : null,
    border: hasBorder ? OutlineInputBorder() : InputBorder.none,
  );
}
