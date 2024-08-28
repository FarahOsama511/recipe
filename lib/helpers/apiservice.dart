import 'package:dio/dio.dart';
import 'package:recipe/helpers/Endpoints.dart';

class Apiservice {
  final String _baseurl = "https://api.spoonacular.com/recipes/";
  Dio _dio = Dio();
  Future<Map<String, dynamic>> getAllrecipe() async {
    Response response = await _dio.get('$_baseurl${Endpoints.recipe}' ,queryParameters: {
      "apiKey":"b23812e52ef848a7a493aced39a8a7a9",
    });
    return response.data;
  }
  Future<Map<String, dynamic>> getAlldetails(int id) async {
    Response response = await _dio.get('$_baseurl$id/${Endpoints.details}' ,queryParameters: {
      "apiKey":"b23812e52ef848a7a493aced39a8a7a9",
    });
    return response.data;
  }
}
