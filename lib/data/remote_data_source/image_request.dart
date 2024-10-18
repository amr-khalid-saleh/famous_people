import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:t1/data/models/image_model.dart';

class ImageRequest{
  static Map<String,String> headers={
    "Content-Type":"application/json",
    "Accept":"application/json"
  };
  static Future<ImageModel?> getImage({required num id})async{
    var response = await http.get(Uri.parse("https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b"),headers: headers,);
    if(response.statusCode==200){
      Map<String,dynamic> decoded={};
      decoded= json.decode(response.body);
      return ImageModel.fromJson(decoded);
    }
    else{
      return null;
    }
  }
}
