import 'package:desafio_02_movies/modules/movies/models/models.dart';
import 'package:desafio_02_movies/modules/movies/services/movie_service.dart';
import 'package:desafio_02_movies/modules/movies/states/movie_states.dart';
import 'package:flutter/material.dart';

class MovieController extends ValueNotifier<MovieStates> {
  final MovieService movieService;

  MovieController(this.movieService) : super(MovieInitialState());

  Future<List<Movie>> getAllMovies() async {
    try {
      value = MovieLoadingState();
      final popularMoviesFuture = movieService.getPopularMovies();
      final topRatedMoviesFuture = movieService.getTopRated();
      final upcomingMoviesFuture = movieService.getUpcoming();

      final List<List<Movie>> results = await Future.wait([
        popularMoviesFuture,
        topRatedMoviesFuture,
        upcomingMoviesFuture,
      ]);

      return results.expand((movies) => movies).toList();
    } catch (err) {
      value = MovieErrorState(err.toString());
      return [];
    }
  }

  Future<List<Movie>> getTopRated() async {
    try {
      value = MovieLoadingState();
      final movies = await movieService.getTopRated();
      value = MovieSucessState(movies: movies);
      return movies;
    } catch (err) {
      value = MovieErrorState(err.toString());
      return [];
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    try {
      value = MovieLoadingState();
      final movies = await movieService.getPopularMovies();
      value = MovieSucessState(movies: movies);
      return movies;
    } catch (err) {
      value = MovieErrorState(err.toString());
      return [];
    }
  }

  Future<List<Movie>> getUpcoming() async {
    try {
      value = MovieLoadingState();
      final movies = await movieService.getUpcoming();
      value = MovieSucessState(movies: movies);
      return movies;
    } catch (err) {
      value = MovieErrorState(err.toString());
      return [];
    }
  }
}
