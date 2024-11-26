import 'package:breakingapi/constans/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebService{
  late Dio dio;
  CharactersWebService(){
    BaseOptions options=BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 20) ,
      connectTimeout: const Duration(seconds: 20),
    );
    dio=Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');

      if (response.data is List) {
        return response.data;
      } else if (response.data is Map) {
        return response.data['results'] as List<dynamic>;
      } else {
        throw Exception('Unexpected API response format');
      }
    } catch (e) {
      return [];
    }
  }
}