import 'package:flutter/material.dart';
import './translate_api.dart';

void main() => runApp(MaterialApp(
  home: Home()));

class Home extends StatelessWidget{
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Translate'),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        color: Colors.grey[400],
      child: ListView(
        children: [
          Text('Detect language'),
          SizedBox(height: 10),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter text to translate',
            ),),


          Text('English'),
          SizedBox(height: 10),
          TextField(
            controller: _controller1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),),
          MaterialButton(
            onPressed: () async {
              final translatedText = await TranslateApi().post(_controller.text);
              _controller1.text=translatedText;
            },
            color: Colors.blue,
            child: const Text('Translate to English',
                style: TextStyle(color: Colors.white)),
          ),
        ],
    ),
    ));
  }
}



