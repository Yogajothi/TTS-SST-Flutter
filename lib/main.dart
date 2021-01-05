import 'package:flutter/material.dart';
import 'speechToText.dart';
import 'textToSpeech.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
//        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Tts and Stt'),
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
        backgroundColor: Color.fromARGB(130, 125, 125, 250),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          backgroundColor: Color.fromARGB(130, 125, 125, 237),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 250,
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ttos.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:Color.fromARGB(130, 125, 125, 250),width: 2)
                ),
                child: Stack(
                  children: <Widget>[
                    new Positioned(
                      left: 10,
                      top: 5.0,
                      child: new Text(
                        'TEXT TO SPEECH',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black),
                      ),
                    ),
                    new Positioned(
                      bottom: 20.0,
                      right: 20.0,
                      child: new RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(width: 2,color: Color.fromARGB(130, 150, 125, 250))
                        ),
                        padding: EdgeInsets.all(20),
                        child: Text('Go >>'),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Tts()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/stot.jpg"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:Color.fromARGB(130, 150, 125, 250),width: 2)
                ),
                child: Stack(
                  children: <Widget>[
                    new Positioned(
                      left: 10,
                      top: 5.0,
                      child: new Text(
                        'SPEECH TO TEXT',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black),
                      ),
                    ),
                    new Positioned(
                      bottom: 20.0,
                      right: 20,
                      child: new RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(width: 2,color: Color.fromARGB(130, 125, 125, 250))
                        ),
                        padding: EdgeInsets.all(20),
                        child: Text('Go >>'),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => Stt()));
                        },
                      ),
                    ),
                  ],
                ),
              )],
          ),
        ));
  }
}
