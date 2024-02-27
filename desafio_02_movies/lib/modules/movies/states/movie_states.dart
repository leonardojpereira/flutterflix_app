import 'package:desafio_02_movies/modules/movies/models/models.dart';

abstract class MovieStates {}

class MovieInitialState extends MovieStates {}

class MovieLoadingState extends MovieStates {}

class MovieSucessState extends MovieStates {
  final List<Movie> movies;
  MovieSucessState({required this.movies});
}

class MovieErrorState extends MovieStates {
  final String message;
  MovieErrorState(this.message);
}
