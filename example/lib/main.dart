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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
        body: JsonFormBuilder(
          buttonLabel: 'Enviar',
          json: jsonEncode([
            {
              "type": "title",
              "title":"Title",
              "subtitle":"Subtitle",
            },
            {
              "type": "title",
              "title":"Title",
            },
            {
              "type": "title",
              "subtitle":"Title",
            },
            {
              "label": "Ingresa tu ubicación",
              "type": "checkbox-with-comments",
              "name": "location",
              "required": "true",
              "labelFirstComment": "Label 1",
              "labelSecondComment": "Label 2"
            },
            {
              "label": "Mensaje",
              "type": "textfield",
              "required": "true",
              "name": "text"
            },
            {
              "label": "Fecha",
              "type": "datepicker",
              "name": "date",
              "required": "true"
            },
            {
              "label": "¿Le gustó usar la plataforma?",
              "type": "segmentedcontrol",
              "name": "boolean",
              "required": "true",
              "options": [
                {"label": "si", "value": "true"},
                {"label": "no", "value": "false"},
                {"label": "n/a", "value": "na"},
              ],
            },
            {
              "type": "radiogroup",
              "label": "Seleccione un videojuego",
              "name": "videogame",
              "required": "true",
              "options": [
                {"label": "South Park Stick of truth", "value": "southpark"},
                {"label": "Breath of the wild", "value": "Breath of the wild"},
                {"label": "Yugioh forbidden memories", "value": "yugioh"},
              ],
            },
            {
              "label": "Seleccione un videojuego",
              "type": "dropdown",
              "name": "language",
              "required": "true",
              "options": [
                {"label": "Español", "value": "southpark"},
                {"label": "English", "value": "Breath of the wild"},
                {"label": "Yugioh forbidden memories", "value": "yugioh"},
              ],
            },
            {
              "label": "Selecciona tus artistas favoritos",
              "type": "checkbox",
              "name": "artist2",
              "required": "true",
              "options": [
                {"label": "Brian May", "value": "brian"},
                {"label": "Roger Taylor", "value": "roger"},
                {"label": "Freddie Mercury", "value": "freddie"},
                {"label": "John Deacon", "value": "john"}
              ]
            },
            {
              "label": "Selecciona tus artistas favoritos",
              "type": "searchabledropdown",
              "name": "artist",
              "required": "true",
              "options": [
                "Brian May",
                "Roger Taylor",
                "Freddie Mercury",
                "John Deacon"
              ]
            },
            {
              "label": "Selecciona tus artistas favoritos",
              "type": "filterchip",
              "name": "artist3",
              "required": "true",
              "options": [
                {"label": "Brian May", "value": "brian"},
                {"label": "Roger Taylor", "value": "roger"},
                {"label": "Freddie Mercury", "value": "freddie"},
                {"label": "John Deacon", "value": "john"},
                {"label": "David Bowie", "value": "bowie"},
                {"label": "Natalia Lafourcade", "value": "lafourcade"},
                {"label": "Michael Jackson", "value": "jackson"},
                {"label": "Elvis Presley", "value": "presley"},
                {"label": "Mon Laferte", "value": "laferte"},
                {"label": "Axl Rose", "value": "axl"},
                {"label": "Elthon John", "value": "elthon"},
                {"label": "Ringo Star", "value": "ringo"},
                {
                  "label":
                      "Un Artista con un nombre extremadamente largo jajdfljklsdfjlasdjflsdkj dsjfklajdsklfjkalsdjfkljskdljfk",
                }
              ]
            },
            {
              "label": "Ingresa tu ubicación",
              "type": "locationfield",
              "name": "location",
              "required": "true"
            }
          ]),
          onSubmitted: (results) {
            print(results);
          },
        ));
  }
}
