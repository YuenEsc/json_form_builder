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
      body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString("assets/jsa_field_generic.json"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return JsonFormBuilder(
                initialValue: {
                  "question74_generic":true,
                },
                onFinish: (values) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(jsonEncode(values["question74_generic"])),
                  ));
                },
                onFinishFailed: (values) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${values["question74_generic"].runtimeType}"),
                  ));
                },
                json: jsonEncode(jsonDecode(snapshot.data)["es"]),
              );
            }
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }),
    );
  }
}
