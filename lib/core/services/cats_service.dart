import 'package:cat_facts_flutter/core/models/cat_fact_model.dart';
import 'http_connection.dart';
import 'package:dio/dio.dart';

class CatsService extends HttpConnection {
  Future<List<CatFact>> getCatsList() async {
    Response response = await dio.get('/facts');

    if (response.statusCode == 200) {
      // Assuming the response is a JSON array
      List<dynamic> data = response.data;
      return data.map((item) => CatFact.fromJson(item)).toList();
    } else {
      // Handle non-200 responses
      throw Exception('Failed to load cat facts');
    }
  }
}