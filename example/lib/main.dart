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
      body: Builder(
        builder: (context) => JsonFormBuilder(
          buttonLabel: 'Enviar',
          json: jsonEncode([
            {
              "type":"expandable-segmentedcontrol",
              "label":"hello",
              "options": [
                {
                  "label":"true",
                  "value":"true"
                },
                {
                  "label":"false",
                  "value":"false"
                }
              ],
              "expandValue":"true",
              "expandedFields":[
                {
                  "type":"checkbox",
                  "label":"Are you ok?",
                  "name":"arufine6",
                  "allRequired":"true",
                  "options": [
                    {"label":"hello","value":"hello"},
                    {"label":"hello1","value":"hello1"},
                    {"label":"hello4","value":"hello4"},
                    {"label":"hello2","value":"hello2"},
                    {"label":"hello3","value":"hello3"}
                  ]
                },
                {
                  "type":"checkbox",
                  "label":"Are you ok?",
                  "name":"arufine6",
                  "allRequired":"true",
                  "options": [
                    {"label":"hello","value":"hello"},
                    {"label":"hello1","value":"hello1"},
                    {"label":"hello4","value":"hello4"},
                    {"label":"hello2","value":"hello2"},
                    {"label":"hello3","value":"hello3"}
                  ]
                },
              ]
            }
          ]),
          onSubmittedAndValid: (results) {
            print(results);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(jsonEncode(results)),
            ));
          },
          onSubmittedAndNotValid: (results) {
            print(results);
          },
        ),
      ),
    );
  }
}
