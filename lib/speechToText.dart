import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'main.dart';

void main() => runApp(Stt());

class Stt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speech to text',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SpeechScreen(),
    );
  }
}

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  stt.SpeechToText _speech;
  bool _isListening = true;
  String _text = 'Tap the button and start to speak';
  double _confidence =1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(130, 125, 125, 250),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(130, 125, 125, 255),
          leading: BackButton(color: Colors.white,onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
          },),
          title: Text('Speech to text',
            style: TextStyle(fontSize: 16),),
          centerTitle: true,

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: _isListening,
          glowColor:  Color.fromARGB(130, 237, 125, 125),
          endRadius: 75.0,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child:FloatingActionButton(
            backgroundColor: Color.fromARGB(130, 125, 125, 255),
            onPressed: _listen,
            child: Icon(_isListening ? Icons.mic : Icons.mic_none),
          ),
        )    ,
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(color: Colors.grey,width: 2)
                ),
                padding: EdgeInsets.all(8.0),
                child:Text("Confidence: ${(_confidence *100.0).toStringAsFixed(1)}%",
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30.0,color: Colors.black)),),
              SingleChildScrollView(
                reverse: true,
                child: Container(
                    padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
                    child: Text(_text,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30.0,color: Colors.black),)
                ),
              ),
            ],
          ),
        )
    );
  }

  void _listen() async{
    if(!_isListening){
      bool avilable = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if(avilable){
        setState(() => _isListening = true);
        _speech.listen(
            onResult: (val) => setState((){
              _text =val.recognizedWords;
              Image.asset('assets/girl.gif');
              if(val.hasConfidenceRating && val.confidence > 0){
                _confidence = val.confidence;
              }
            }
            )
        );
      }
    }else{
      setState(() => _isListening =false);
      _speech.stop();
    }
  }
}
