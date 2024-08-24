import 'package:matchflix/data_provider/movie_provider.dart';
import 'package:matchflix/model/Movie.dart';

class MovieRepository{
  static Future<List<Movie> > getTopMovies() async {
    List data = await MovieProvider.getTopMovies();
    return data.map((e)=>Movie.fromJson(e)).toList();
  }

  static String getPhotoUrl(String? path){
    return 'https://image.tmdb.org/t/p/w500$path';
  }
}