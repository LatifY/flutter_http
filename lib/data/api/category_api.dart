import 'package:http/http.dart' as http;
import 'package:flutter_http/data/api/api.dart';

class CategoryApi extends Api{

  static Future getCategories(){
    var response = http.get(Api.getUri("/categories"));
    return response;
  }
}