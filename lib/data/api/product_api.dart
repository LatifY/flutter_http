import 'package:flutter_http/data/api/api.dart';
import 'package:http/http.dart' as http;


class ProductApi extends Api{

  static Future getProducts(){
    var response = http.get(Api.getUri("/products"));
    return response;
  }

  static Future getProductsByCategoryId(int categoryId){
    var response = http.get(Api.getUri("/products?categoryId=$categoryId"));
    return response;
  }
}