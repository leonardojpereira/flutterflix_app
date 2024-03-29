import 'dart:convert';

import 'package:desafio_02_movies/core/singletons/singletons.dart';
import 'package:desafio_02_movies/modules/movies/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _popularUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';

  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

  static const _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  static const _apiKeyParam = 'api_key=${Constants.apiKey}';

  static const _baseUrl = 'https://api.themoviedb.org/3';

  // fiz essa função para pegar todos os filmes da home e exibi-los ao pesquisar na searchbar
  Future<List<Movie>> getAllMovies() async {
    final popularMoviesFuture =
        _fetchMovies('/trending/movie/day?$_apiKeyParam');
    final topRatedMoviesFuture = _fetchMovies('/movie/top_rated?$_apiKeyParam');
    final upcomingMoviesFuture = _fetchMovies('/movie/upcoming?$_apiKeyParam');

    final List<List<Movie>> results = await Future.wait([
      popularMoviesFuture,
      topRatedMoviesFuture,
      upcomingMoviesFuture,
    ]);

    return results.expand((movies) => movies).toList();
  }

  Future<List<Movie>> _fetchMovies(String path) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl$path'));
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
      final response = await http.get(Uri.parse(_popularUrl));
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

  Future<List<Movie>> getTopRatedMovies() async {
    try {
      final response = await http.get(Uri.parse(_topRatedUrl));
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

  Future<List<Movie>> getUpComingMovies() async {
    try {
      final response = await http.get(Uri.parse(_upcomingUrl));
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
