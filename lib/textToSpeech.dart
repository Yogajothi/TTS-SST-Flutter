import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'main.dart';

void main() => runApp(Tts());

class Tts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(130, 125, 125, 250),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(130, 125, 125, 255),
          leading: BackButton(color: Colors.white,onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
          },),
          title: Text("Text to Speech"),
          centerTitle: true,
        ),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {

    TextEditingController textEditingController = TextEditingController();

    _speak(String text) async{
      await flutterTts.setLanguage('en-GB');
      await flutterTts.setPitch(1.0);
      await flutterTts.setVolume(0.5);
      await flutterTts.setSpeechRate(0.75);
      await flutterTts.speak(text);
    }
    return Container(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter something to speak...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2,color:Colors.grey),
                      )
                  ),
                  controller: textEditingController,
                ),
              ),
              FloatingActionButton(
                onPressed: () => _speak(textEditingController.text),
                child: Icon(Icons.mic),
                backgroundColor: Color.fromARGB(130, 125, 125, 255),
              ),
            ],
          ),
        )
    );
  }
}