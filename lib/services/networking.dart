import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper{
  
  final String url;
  NetworkHelper({required this.url});

  Future getData() async {
    var uri = Uri.parse(url); 
   Response response = await get(uri);
    if(response.statusCode == 200){
      String data = response.body;
      return jsonDecode(data);
      
    } else{
        print(response.statusCode);
    }
  }
}