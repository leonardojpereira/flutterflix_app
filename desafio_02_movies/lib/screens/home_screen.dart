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

  @override
  void initState() {
    super.initState();
    popularMovies = Api().getPopularMovies();
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 22, bottom: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        return Center(child: Text(snapshot.error.toString()),);
                      } else if (snapshot.hasData) {
                        return PopularMovieSlider(snapshot: snapshot,);
                      } else {
                        return const Center(child: CircularProgressIndicator(),);
                      }
                    }),
              ),
              const SizedBox(
                height: 26,
              ),
              const Text('Top rated movies',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              const MovieSlider(),
              const SizedBox(
                height: 26,
              ),
             const Text('Upcoming movies',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              const MovieSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
