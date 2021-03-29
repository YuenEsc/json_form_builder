import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_form_builder/json_form_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Json Form Builder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(
        builder: (context) => JsonFormBuilder(
          json: jsonEncode([
            {
              "type": "textField",
              "name": "texteditor",
              "label": "Escribe tus comentarios",
              "value": null,
            },
            {
              "type": "switch",
              "name": "texteditor",
              "label": "Escribe tus comentarios",
              "value": null,
            },
            {
              "type": "imagePicker",
              "name": "Imagenes",
              "label": "Escribe tus comentarios",
              "value": null,
              "validators": {
                "arrayMinLength": 3,
              }
            },
            {
              "type": "checkboxGroup",
              "name": "checkboxgroup1",
              "label": "Selecciona tu artista favorito",
              "options": [
                {
                  "label": "Freddie Mercury",
                  "value": 1,
                },
                {
                  "label": "Roger Taylor",
                  "value": 2,
                },
                {
                  "label": "Bryan May",
                  "value": 3,
                },
                {
                  "label": "John Deacon",
                  "value": 4,
                },
              ],
              "value": null,
            },
            {
              "type": "dropdown",
              "name": "checkboxgroup13",
              "label": "Selecciona tu artista favorito",
              "options": [
                {
                  "label": "Freddie Mercury",
                  "value": 1,
                },
                {
                  "label": "Roger Taylor",
                  "value": 2,
                },
                {
                  "label": "Bryan May",
                  "value": 3,
                },
                {
                  "label": "John Deacon",
                  "value": 4,
                },
              ],
              "value": null,
            },
            {
              "type": "segmentedControl",
              "name": "checkboxgroup2",
              "label": "Selecciona tu artista favorito",
              "options": [
                {
                  "label": "Freddie",
                  "value": 1,
                },
                {
                  "label": "Roger",
                  "value": 2,
                },
                {
                  "label": "Bryan",
                  "value": 3,
                },
                {
                  "label": "John",
                  "value": 4,
                },
              ],
              "value": null,
            },
          ]),
        ),
      ),
    );
  }
}
