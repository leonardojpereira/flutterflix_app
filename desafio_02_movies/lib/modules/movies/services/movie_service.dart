import 'dart:convert';

import 'package:desafio_02_movies/core/singletons/singletons.dart';
import 'package:desafio_02_movies/modules/movies/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieService {
  Future<List<Movie>> getTopRated() async {
    try {
      var url = Api.baseUrl + ApiRoutes.topRatedUrl;

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Something happened');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    try {
      var url = Api.baseUrl + ApiRoutes.popularUrl;

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Something happened.');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }

  Future<List<Movie>> getUpcoming() async {
    try {
      var url = Api.baseUrl + ApiRoutes.upcomingUrl;

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Something happened.');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }
}
