// import 'dart:core';
//
// // import 'package:flutter/'
// class Lang{
//   String langcode;
//   String languages;
//
//   Lang(this.langcode, this.languages);
//
//   Lang.fromJson(Map <String ,dynamic> json){
//     langcode=json['code'];
//     languages=json['language'];
//   }
// }
import 'dart:convert';

import 'package:http/http.dart' as http;


var client = http.Client();
class GetLang{
  List<Langdata> codeList = [];
  Future<List<Langdata>> getlang()async{
    var url=Uri.parse('https://aibit-translator.p.rapidapi.com/api/v1/translator/support-languages?69dfeff077mshac40cf601f1fd66p1fd8c6jsn097f6ef57576');
    client.get(url);
    var headers = {
      'X-Rapidapi-Key': '69dfeff077mshac40cf601f1fd66p1fd8c6jsn097f6ef57576',
      'X-Rapidapi-Host': 'google-translate113.p.rapidapi.com'
    };
  var response = await client.get(url, headers: headers);
  var data = jsonDecode(response.body);
  // print(response.body);
  if(response.statusCode == 200){
    for (Map i in data){
      dynamic codes = Langdata(code: i['code'], language: i['language']);
      codeList.add(codes);
      // print(codeList);

    }
    // // print(${langdata.code});
    // for (Langdata langdata in codeList) {
    //   print('Code: ${langdata.code}, Language: ${langdata.language}');
    // }
    // print('hi');
    return codeList;}
  else{
    print("error in lang data");
    return codeList;

  }
  }

}
class Langdata {
  String code;
  String language;

  Langdata({
    required this.code,
    required this.language,
  });
  @override
  String toString() {
    return 'Langdata(code: $code, language: $language)';
  }

}