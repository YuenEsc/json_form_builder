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
          onFinish: (values) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(jsonEncode(values)),
            ));
          },
          json: jsonEncode([
            {
              "type":"datepicker",
              "name":"date",
              "label":"date",
              "value":"2021-4-29",
            },
            {
              "type": "textfield",
              "name": "texteditor",
              "label": "Escribe tus comentarios",
            },
            {
              "type": "switch",
              "name": "switch",
              "label": "Escribe tus comentarios",
              "value":true
            },
            {
              "type": "imagepicker",
              "name": "Imagenes",
              "label": "Escribe tus comentarios",
            },
            {
              "type": "checkboxgroup",
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
            },
            {
              "type": "segmentedcontrol",
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
            },
          ]),
        ),
      ),
    );
  }
}
