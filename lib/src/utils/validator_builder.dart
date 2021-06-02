import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

///validar builder that returns a validator compose with all the validators inside of it
String Function(dynamic) validatorBuilder(
    {@required BuildContext context,
   @required  Map<String, dynamic> fieldSchema,
    bool isExpanded = true}) {
  List<String Function(dynamic)> validators = [];
  if (isExpanded && fieldSchema.containsKey("validators")) {
    if (fieldSchema["validators"].containsKey('required')) {
      validators.add(FormBuilderValidators.required(context));
    }
    if (fieldSchema["validators"].containsKey('numeric')) {
      validators.add(FormBuilderValidators.numeric(context));
    }
    if (fieldSchema["validators"].containsKey('ip')) {
      validators.add(FormBuilderValidators.ip(context));
    }
    if (fieldSchema["validators"].containsKey('integer')) {
      validators.add(FormBuilderValidators.integer(context));
    }
    if (fieldSchema["validators"].containsKey('min')) {
      validators.add(
          FormBuilderValidators.min(context, fieldSchema["validators"]["min"]));
    }
    if (fieldSchema["validators"].containsKey('max')) {
      validators.add(
          FormBuilderValidators.max(context, fieldSchema["validators"]["max"]));
    }
    if (fieldSchema["validators"].containsKey('minLength')) {
      validators.add(FormBuilderValidators.minLength(
          context, fieldSchema["validators"]["minLength"]));
    }
    if (fieldSchema["validators"].containsKey('maxLength')) {
      validators.add(FormBuilderValidators.maxLength(
          context, fieldSchema["validators"]["maxLength"]));
    }
    if (fieldSchema["validators"].containsKey('arrayMinLength')) {
      validators.add((valueCandidate) {
        final valueLength = valueCandidate?.length ?? 0;
        return valueLength < fieldSchema["validators"]['arrayMinLength']
            ? FormBuilderLocalizations.of(context)
                .minLengthErrorText(fieldSchema["validators"]['arrayMinLength'])
            : null;
      });
    }
    if (fieldSchema["validators"].containsKey('arrayMaxLength')) {
      validators.add((valueCandidate) {
        final valueLength = valueCandidate?.length ?? 0;
        return valueLength > fieldSchema["validators"]['arrayMaxLength']
            ? FormBuilderLocalizations.of(context)
                .minLengthErrorText(fieldSchema["validators"]['arrayMaxLength'])
            : null;
      });
    }
    if (fieldSchema["validators"].containsKey('email')) {
      validators.add(FormBuilderValidators.email(
        context,
      ));
    }
    if (fieldSchema["validators"].containsKey('equal')) {
      validators.add(FormBuilderValidators.equal(
          context, fieldSchema["validators"]["equal"]));
    }
    if (fieldSchema["validators"].containsKey('notEqual')) {
      validators.add(FormBuilderValidators.notEqual(
          context, fieldSchema["validators"]["notEqual"]));
    }
    if (fieldSchema["validators"].containsKey('url')) {
      validators.add(FormBuilderValidators.url(context));
    }
  }
  return FormBuilderValidators.compose(validators);
}
