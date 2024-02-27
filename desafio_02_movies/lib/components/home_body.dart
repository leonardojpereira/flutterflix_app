import 'package:desafio_02_movies/modules/movies/widgets/custom_loading.dart';
import 'package:desafio_02_movies/modules/movies/widgets/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:desafio_02_movies/modules/movies/services/movie_service.dart';
import 'package:desafio_02_movies/modules/movies/controllers/movie_controller.dart';
import 'package:desafio_02_movies/modules/movies/models/movie.dart';
import 'package:desafio_02_movies/components/movie_slider.dart';
import 'package:desafio_02_movies/components/popular_movie_slider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late final ValueNotifier<MovieController> movieControllerNotifier;
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  bool isSearching = false;
  List<Movie> searchedMovies = [];
  List<Movie> filteredMovies = [];

  @override
  void initState() {
    super.initState();
    movieControllerNotifier = ValueNotifier(MovieController(MovieService()));

    Future.wait([
      movieControllerNotifier.value.getPopularMovies(),
      movieControllerNotifier.value.getTopRated(),
      movieControllerNotifier.value.getUpcoming(),
    ]).then((_) {
      setState(() {});
    });
  }

  void searchMovies(String query) async {
    if (query.isNotEmpty) {
      List<Movie> movies;
      if (isSearching) {
        movies = searchedMovies;
      } else {
        movies = await movieControllerNotifier.value.getAllMovies();
      }

      final List<Movie> searchedMoviesList = movies
          .where((movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();

      setState(() {
        filteredMovies = searchedMoviesList;
        isSearching = true;
      });
    } else {
      setState(() {
        isSearching = false;
      });
    }
    searchFocusNode.unfocus();
  }

  void onSearchSubmitted(String value) {
    searchMovies(value);
  }

  void onSearchTextChanged(String value) {
    setState(() {
      isSearching = value.isNotEmpty;
    });
  }

  void onTapOutsideSearchBar() => searchFocusNode.unfocus();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapOutsideSearchBar,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 22, bottom: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearch(
                controller: searchController,
                onSubmitted: onSearchSubmitted,
                onChanged: onSearchTextChanged,
                focusNode: searchFocusNode,
              ),
              ValueListenableBuilder<MovieController>(
                valueListenable: movieControllerNotifier,
                builder: (context, movieController, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isSearching) ...[
                        _buildSearchWidget(searchController.text),
                      ],
                      if (!isSearching) ...[
                        const SizedBox(height: 26),
                        _typeMovie('Popular movies'),
                        _buildMovieWidget(
                          movieControllerNotifier.value.getPopularMovies(),
                          true,
                        ),
                        const SizedBox(height: 26),
                        _typeMovie('Top rated movies'),
                        _buildMovieWidget(
                          movieControllerNotifier.value.getTopRated(),
                          false,
                        ),
                        const SizedBox(height: 26),
                        _typeMovie('Upcoming movies'),
                        _buildMovieWidget(
                          movieControllerNotifier.value.getUpcoming(),
                          false,
                        ),
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _typeMovie(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      );

  Widget _buildSearchWidget(String searchMovies) {
    return FutureBuilder<List<Movie>>(
      future: movieControllerNotifier.value.getAllMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomLoading();
        }
        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.only(top: 22, bottom: 22),
            child: Center(
              child: Text(snapshot.error.toString()),
            ),
          );
        }
        if (snapshot.hasData) {
          List<Movie> movies = snapshot.data!;
          Set<int> addedMovieIds = Set<int>();
          List<Movie> searchedMoviesList = [];

          for (Movie movie in movies) {
            if (!addedMovieIds.contains(movie.id) &&
                movie.title
                    .toLowerCase()
                    .contains(searchMovies.toLowerCase())) {
              searchedMoviesList.add(movie);
              addedMovieIds.add(movie.id);
            }
          }

          if (searchedMoviesList.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: _buildMovieWidget(
                Future.value(searchedMoviesList),
                false,
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: const Text(
                'Nenhum filme encontrado',
                style: TextStyle(fontSize: 22),
              ),
            );
          }
        }
        return const Text('Sem dados disponíveis');
      },
    );
  }

  Widget _buildMovieWidget(
    Future<List<Movie>>? future,
    bool isSlider,
  ) {
    return SizedBox(
      child: FutureBuilder<List<Movie>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomLoading();
          }
          if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 22),
              child: Center(
                child: Text(snapshot.error.toString()),
              ),
            );
          }
          if (snapshot.hasData) {
            List<Movie> movies = snapshot.data!;
            return isSlider
                ? PopularMovieSlider(movie: movies)
                : MovieSlider(movie: movies);
          }
          return const Text('Sem dados disponíveis');
        },
      ),
    );
  }
}
