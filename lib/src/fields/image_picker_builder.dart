import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

class ImagePickerBuilder extends StatelessWidget {
  ImagePickerBuilder({Key key, this.rawField}) : super(key: key);

  final Map<String, dynamic> rawField;
  final FocusNode fn = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: rawField.containsKey("label")
              ? const EdgeInsets.symmetric(vertical: 8.0)
              : null,
          child: Text(
            rawField.containsKey("label") ? rawField["label"] : null,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.left,
          ),
        ),
        FormBuilderImagePicker(
          decoration: InputDecoration(
              hintText: rawField.containsKey("placeholder")
                  ? rawField["placeholder"]
                  : null,
              border: InputBorder.none),
          name: rawField["name"],
          enabled:
              rawField.containsKey("readOnly") && rawField["readOnly"] == "true"
                  ? false
                  : true,
          validator:
              rawField.containsKey("required") && rawField["required"] == "true"
                  ? FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ])
                  : null,
          maxImages: 4,
          imageQuality: 50,
        ),
      ],
    );
  }
}
