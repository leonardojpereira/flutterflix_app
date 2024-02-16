import 'package:desafio_02_movies/components/drawer.dart';
import 'package:desafio_02_movies/components/movie_slider.dart';
import 'package:desafio_02_movies/components/popular_movie_slider.dart';
import 'package:desafio_02_movies/models/movie.dart';
import 'package:desafio_02_movies/services/api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState() {
    super.initState();
    popularMovies = Api().getPopularMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getupcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          height: 49,
          filterQuality: FilterQuality.high,
        ),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
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
                  leading: Icon(
                    Icons.search,
                    color: Colors.grey[700],
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape:
                      MaterialStateProperty.all(const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 22, bottom: 22),
                child: Text(
                  'Popular Movies',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
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
                    }),
              ),
              const SizedBox(
                height: 26,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Top rated movies',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
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
                    }),
              ),
              const SizedBox(
                height: 26,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Upcoming movies',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
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
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
