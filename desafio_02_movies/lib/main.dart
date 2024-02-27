import 'package:desafio_02_movies/core/singletons/colors.dart';
import 'package:desafio_02_movies/modules/intro/pages/intro_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgColor,
      ),
      home: const IntroScreen(),
    );
  }
}
