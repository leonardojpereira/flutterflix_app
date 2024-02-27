import 'package:desafio_02_movies/components/drawer.dart';
import 'package:desafio_02_movies/components/home_body.dart';
import 'package:desafio_02_movies/modules/movies/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      drawer: DrawerWidget(),
      body: HomeBody(),
    );
  }
}
