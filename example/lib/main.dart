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
              "type":"tageditorfield",
              "name":"tageditor",
              "label":"hello",
              "value":["Yuen Steven"]
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
