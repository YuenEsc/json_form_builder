import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:json_form_builder/src/label_builder.dart';
import 'package:json_form_builder/src/utils/build_input_decoration.dart';
import 'package:json_form_builder/src/utils/is_field_enabled.dart';
import 'package:json_form_builder/src/utils/validator_builder.dart';

class LocationFieldBuilder extends StatefulWidget {
  LocationFieldBuilder(
      {Key key, this.fieldSchema, this.locale = 'es', this.isExpanded = true})
      : super(key: key);

  final Map<String, dynamic> fieldSchema;
  final String locale;
  final bool isExpanded;

  @override
  _LocationFieldBuilderState createState() => _LocationFieldBuilderState();
}

class _LocationFieldBuilderState extends State<LocationFieldBuilder> {
  String address;
  final FocusNode fn = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getLocation();
  }

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      setState(() {
        address =
            '${placemarks[0].street}, ${placemarks[0].locality} ${placemarks[0].postalCode}, ${placemarks[0].country}  ';
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LabelBuilder(
      fieldSchema: widget.fieldSchema,
      child: FormBuilderTextField(
        focusNode: fn,
        key: UniqueKey(),
        decoration: buildInputDecoration(fieldSchema: widget.fieldSchema),
        enabled: isFieldEnabled(widget.fieldSchema),
        name: widget.fieldSchema["name"],
        initialValue: widget.fieldSchema.containsKey("value")
            ? widget.fieldSchema["value"]
            : FormBuilder.of(context)
                    ?.initialValue
                    ?.containsKey(widget.fieldSchema["name"])
                ? FormBuilder.of(context)
                    .initialValue[widget.fieldSchema["name"]]
                : address,
        validator: validatorBuilder(
            context: context,
            fieldSchema: widget.fieldSchema,
            isExpanded: widget.isExpanded),
      ),
    );
  }
}
