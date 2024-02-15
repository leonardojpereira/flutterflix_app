import 'package:desafio_02_movies/components/movie_slider.dart';
import 'package:desafio_02_movies/components/popular_movie_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 22, bottom: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 22, bottom: 22),
                child: Text(
                  'Popular Movies',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              PopularMovieSlider(),
              SizedBox(
                height: 26,
              ),
              Text('Top rated movies',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              MovieSlider(),
              SizedBox(
                height: 26,
              ),
              Text('Upcoming movies',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              MovieSlider(),
            ],
          ),
        ),
      ),
    );
  }
}

