import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 22, bottom: 22),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
