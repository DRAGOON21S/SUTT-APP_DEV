import 'dart:convert';

import 'package:http/http.dart' as http;
const String baseUrl = 'https://aibit-translator.p.rapidapi.com/api/v1/translator/text';
var client = http.Client();
class TranslateApi {
  Future<dynamic> post(dynamic object) async{
    var url =Uri.parse(baseUrl);
    client.get(url);
    var payload = json.encode(object);
    var headers = {
      'X-Rapidapi-Key': '69dfeff077mshac40cf601f1fd66p1fd8c6jsn097f6ef57576',
      'X-Rapidapi-Host': 'google-translate113.p.rapidapi.com'
    };
    var body = {
      'from': 'auto',
      'to' : 'en',
      'text' : payload,

    };
    var response = await client.post(url, headers: headers, body: body);
    if (response.statusCode == 200){
      final jsonResponse = json.decode(response.body);
      final value = jsonResponse['trans'];
      print(value);
      return value;
    }
    else {
      print("error");
    }
  }
}