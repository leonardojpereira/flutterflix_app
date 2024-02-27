// import 'package:desafio_02_movies/components/movie_slider.dart';
// import 'package:desafio_02_movies/modules/movies/controllers/movie_controller.dart';
// import 'package:desafio_02_movies/modules/movies/models/movie.dart';
// import 'package:desafio_02_movies/modules/movies/services/movie_service.dart';
// import 'package:desafio_02_movies/modules/movies/states/movie_states.dart';
// import 'package:flutter/material.dart';

// class MovieWidget extends StatelessWidget {
//   List<Movie> movies;
//   ValueNotifier<MovieController> movieControllerNotifier =
//       ValueNotifier(MovieController(MovieService()));

//   final bool isSearching;

//   MovieWidget({
//     Key? key,
//     required this.movies,
//     required this.movieControllerNotifier,
//     required this.isSearching,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: movieControllerNotifier,
//       builder: (context, state, child) {
//         if (state is MovieInitialState) {
//           movies;
//           return _buildLoading();
//         } else if (state is MovieLoadingState) {
//           return _buildLoading();
//         } else if (state is MovieSucessState) {
//           movies;

//           if (isSearching) {
//             return Padding(
//               padding: const EdgeInsets.only(top: 40),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 250,
//                     child: MovieSlider(movie: movies),
//                   ),
//                 ],
//               ),
//             );
//           }

//           return Padding(
//             padding: const EdgeInsets.only(top: 40),
//             child: Column(
//               children: [
//                 MovieSlider(movie: movies),
//               ],
//             ),
//           );
//         } else if (state is MovieErrorState) {
//           return const Center(
//             child: Text("Erro ao carregar os filmes"),
//           );
//         }
//         return _buildLoading();
//       },
//     );
//   }

//   Widget _buildLoading() {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }
// }

// class MovieWidget extends StatelessWidget {
//   final ValueNotifier<MovieController> movieController;
//   final bool isSearching;

//   const MovieWidget({
//     Key key,
//     @required this.movieController,
//     @required this.isSearching,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: movieController,
//       builder: (context, state, child) {
//         if (state is MovieInitialState) {
//           movieController.value.getMovies(); // Chame o método apropriado aqui
//           return _buildLoading();
//         } else if (state is MovieLoadingState) {
//           return _buildLoading();
//         } else if (state is MovieSuccessState) {
//           final movies = state.movies;

//           if (isSearching) {
//             return Padding(
//               padding: const EdgeInsets.only(top: 40),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 250,
//                     child: MovieSlider(movie: movies),
//                   ),
//                 ],
//               ),
//             );
//           }

//           return Padding(
//             padding: const EdgeInsets.only(top: 40),
//             child: Column(
//               children: [
//                 // Renderize o widget apropriado aqui com base no tipo de dados
//                 MovieSlider(movie: movies),
//               ],
//             ),
//           );
//         } else if (state is MovieErrorState) {
//           return const Center(
//             child: Text("Erro ao carregar os filmes"),
//           );
//         }
        
//       },
//     );
//   }
// }
