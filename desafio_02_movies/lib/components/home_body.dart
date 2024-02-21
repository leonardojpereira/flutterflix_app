import 'package:flutter/material.dart';
import 'package:desafio_02_movies/components/movie_slider.dart';
import 'package:desafio_02_movies/components/popular_movie_slider.dart';
import 'package:desafio_02_movies/models/movie.dart';
import 'package:desafio_02_movies/services/api.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> searchedMovies;
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    popularMovies = Api().getPopularMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getupcomingMovies();
  }

  void searchMovies(String query) async {
    if (query.isNotEmpty) {
      final List<Movie> movies = await Api().getAllMovies();
      final List<Movie> searchedMoviesList = movies
          .where((movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();

      // Remove filmes duplicados quando pesquisar
      final Map<String, Movie> uniqueMoviesMap = {};
      for (final movie in searchedMoviesList) {
        uniqueMoviesMap[movie.title.toLowerCase()] = movie;
      }
      final List<Movie> uniqueMoviesList = uniqueMoviesMap.values.toList();

      setState(() {
        searchedMovies = Future.value(uniqueMoviesList);
        isSearching = true;
      });
    } else {
      setState(() {
        isSearching = false;
        searchedMovies = Future.value([]);
      });
    }
    searchFocusNode.unfocus();
  }

  void onSearchSubmitted(String value) {
    searchMovies(value);
  }

  void onSearchTextChanged(String value) {
    if (value.isEmpty) {
      setState(() {
        isSearching = false;
      });
    }
  }

  void onTapOutsideSearchBar() {
    searchFocusNode.unfocus();
  }

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
              Padding(
                padding: const EdgeInsets.only(right: 22.0, top: 12.0),
                child: SearchBar(
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.black)),
                  hintText: 'Search',
                  hintStyle: MaterialStateProperty.all(
                      const TextStyle(color: Color.fromARGB(255, 88, 88, 88))),
                  leading: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape:
                      MaterialStateProperty.all(const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
                  controller: searchController,
                  onSubmitted:
                      onSearchSubmitted, // Chamado quando pressionar Enter
                  onChanged: onSearchTextChanged, // Chamado quando o texto muda
                  focusNode:
                      searchFocusNode, // Associar o FocusNode ao TextField
                ),
              ),
              if (isSearching)
                FutureBuilder(
                  future: searchedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 22, bottom: 22),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
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
                      List<Movie> movies = snapshot.data as List<Movie>;
                      return Padding(
                        padding: const EdgeInsets.only(top: 22, bottom: 22),
                        child: Text(
                          'Results: ${movies.length}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      );
                    }
                    return const Text('No Data');
                  },
                ),
              if (isSearching)
                SizedBox(
                  child: FutureBuilder(
                    future: searchedMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MovieSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              if (!isSearching)
                const SizedBox(
                  height: 26,
                ),
              if (!isSearching)
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text('Popular Movies',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
              if (!isSearching)
                SizedBox(
                  child: FutureBuilder(
                    future: popularMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return PopularMovieSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              if (!isSearching)
                const SizedBox(
                  height: 26,
                ),
              if (!isSearching)
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text('Top rated movies',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
              if (!isSearching)
                SizedBox(
                  child: FutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MovieSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              if (!isSearching)
                const SizedBox(
                  height: 26,
                ),
              if (!isSearching)
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text('Upcoming movies',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
              if (!isSearching)
                SizedBox(
                  child: FutureBuilder(
                    future: upcomingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MovieSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
