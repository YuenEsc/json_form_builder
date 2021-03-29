import 'package:flutter/material.dart';

TextInputType textInputTypeBuilder(Map<String,dynamic> fieldSchema){
  if(fieldSchema.containsKey("keyboardType")){
    if(fieldSchema["keyboardType"] == "email"){
      return TextInputType.emailAddress;
    }
    if(fieldSchema["keyboardType"] == "phone"){
      return TextInputType.phone;
    }
    if(fieldSchema["keyboardType"] == "number"){
      return TextInputType.number;
    }
    if(fieldSchema["keyboardType"] == "streetAddress"){
      return TextInputType.streetAddress;
    }
  }
  return null;
}