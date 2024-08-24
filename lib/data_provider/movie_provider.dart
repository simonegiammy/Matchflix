import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieProvider{


  static Future<List> getTopMovies() async {
      final dio = Dio();
      const url = 'https://api.themoviedb.org/3/trending/movie/day?language=it-IT';
      String? apiKey =  dotenv.env['ACCESS_TOKEN'];
      Map<String, dynamic> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${apiKey!}"
      };
    
  try {
    final response = await dio.get(url, options: Options(headers: headers));
    if (response.statusCode == 200) {
      final data = response.data;
      return data['results'];
     } 
  } 
  catch (e) {
    debugPrint('Errore: $e');
  }
  return [];
  }

}