import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/home_screen_model.dart';

class HomeRequest{
  static Uri uri = Uri.parse("https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b");
  static Map<String,String> headers={
    "Content-Type":"application/json",
    "Accept":"application/json"
  };

  static Future<HomeScreenModel?> getData()async{
    var response = await http.get(uri,headers: headers,);
    if(response.statusCode==200){
      Map<String,dynamic> decoded={};
      decoded= json.decode(response.body);
      return HomeScreenModel.fromJson(decoded);
    }
    else{
      return null;
    }

  }
  }
