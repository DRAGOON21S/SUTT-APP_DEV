import 'package:flutter/material.dart';
import './translate_api.dart';
import './languages.dart';

void main() => runApp(MaterialApp(
  home: Home()));

class Home extends StatefulWidget{


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    ()async{
      await GetLang().getlang();
    };
  }
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  String langcode ='en';
  // String _translatedText = "";

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

              Text('Auto-Detect language'),
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
          DropdownMenu(
              label: const Text('English'),
              helperText: 'select language to translate into',
              width: 250.0 ,
              menuHeight: 100,
              onSelected: (String) {
                if (String != null){
                  setState((){
                    langcode=String;
                  });}} ,
              dropdownMenuEntries:<DropdownMenuEntry<String>> [
                // for (Langdata langdata in codeList2) {
                //   DropdownMenuEntry(value: ${langdata.code}, label: ${langdata.language}')
                //     }
                DropdownMenuEntry(value:'vi',label: 'vietnamese'),
                DropdownMenuEntry(value:'fr',label: 'french')
              ]
          ),
          MaterialButton(
            onPressed: () async {
              showDialog(context: context, builder: (context){
                return Center(child: CircularProgressIndicator());
              });

              String translatedText = await TranslateApi().post(_controller.text, langcode);

              Navigator.of(context).pop();
              setState(() {
                _controller1.text=translatedText;
              });
            },
            color: Colors.blue,
            child: const Text('Translate',
                style: TextStyle(color: Colors.white)),
          ),
        ],
    ),
    ));
  }
}



