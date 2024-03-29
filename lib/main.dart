import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() => runApp(new MaterialApp(
    theme: new ThemeData(primarySwatch: Colors.teal), home: new HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var ListData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("load jason"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_jason/person.json'),
            builder: (context, snapshot){
              //decode json
              var JSON;
              var mydata = json.decode(snapshot.data.toString());
              return new ListView.builder(
                itemBuilder: (BuildContext context , int index){
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("name"+mydata[index]["name"]),
                        new Text("age"+mydata[index]["age"]),
                        new Text("height"+mydata[index]["height"]),
                        new Text("gender"+mydata[index]["gender"]),
                        new Text("hair color"+mydata[index]["hair color"])
                      ],
                    ),
                  );
                },
                itemCount: mydata== null ? 0 :mydata.length,
                  
              );
              
            },
          ),
        ),
      ),
    );
  }
}
