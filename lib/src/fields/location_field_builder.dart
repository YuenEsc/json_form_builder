import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationFieldBuilder extends StatefulWidget {
  const LocationFieldBuilder(
      {Key key, this.rawField, this.locale = 'es', this.fbKey})
      : super(key: key);

  final Map<String, dynamic> rawField;
  final String locale;
  final GlobalKey<FormBuilderState> fbKey;

  @override
  _LocationFieldBuilderState createState() => _LocationFieldBuilderState();
}

class _LocationFieldBuilderState extends State<LocationFieldBuilder> {
  String address = '';
  final FocusNode fn = FocusNode();


  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude,
          localeIdentifier: widget.locale);
      placemarks.forEach((element) {
        print(element);
      });
      setState(() {
        address =
            '${placemarks[0].street}, ${placemarks[0].locality} ${placemarks[0].postalCode}, ${placemarks[0].country}  ';
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: widget.rawField.containsKey("label")
              ? const EdgeInsets.symmetric(vertical: 8.0)
              : null,
          child: Text(
            widget.rawField.containsKey("label")
                ? widget.rawField["label"]
                : null,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.left,
          ),
        ),
        FormBuilderTextField(
          focusNode: fn,
          key: UniqueKey(),
          decoration: InputDecoration(
              hintText: widget.rawField.containsKey("placeholder")
                  ? widget.rawField["placeholder"]
                  : null,
              border: OutlineInputBorder()),
          enabled: widget.rawField.containsKey("readOnly") &&
                  widget.rawField["readOnly"] == "true"
              ? false
              : true,
          name: widget.rawField["name"],
          initialValue: address,
          validator: widget.rawField.containsKey("required") &&
                  widget.rawField["required"] == "true"
              ? FormBuilderValidators.required(context)
              : null,
        ),
      ],
    );
  }
}
