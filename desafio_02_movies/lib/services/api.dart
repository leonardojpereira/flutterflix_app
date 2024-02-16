import 'dart:convert';

import 'package:desafio_02_movies/constants.dart';
import 'package:desafio_02_movies/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _popularUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(_popularUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened.');
    }
  }
}
