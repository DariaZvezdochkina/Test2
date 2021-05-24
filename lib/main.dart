import 'package:flutter/material.dart';
import 'dart:math';

void main() {

  runApp(MaterialApp(
    title: "App",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Number Generator',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Generator of numbers'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [

              Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Random Number",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
              Container(
                child: RaisedButton(
                  child: Text("Second Page"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NavigatorPage()));
                  },
                ),
              ),
              new Slider(),
            ],
          )),
    );
  }
}

class NavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('All Documents'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Back"),
        ),
      ),
    );
  }
}

class Slider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Random();
  }
}

class _Random extends State<Slider> {
  int _number = 0;

  void GenerateRandomNumber() {
    final _random = Random();
    int next(int min, int max) => min + _random.nextInt(max - min);
    setState(() {
      _number = next(1, 1000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$_number',
        ),
        RaisedButton(
            onPressed: GenerateRandomNumber,
            color: Colors.green,
            child: Text("Generate")),
      ],
    );
  }
}
