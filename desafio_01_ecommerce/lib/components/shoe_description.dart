import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';

class Description extends StatefulWidget {
  const Description({
    super.key,
    required this.shoe,
  });

  final Shoe shoe;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Text(
        'Lorem ipsum dolor sit amet. Et praesentium architecto vel provident exercitationem et nihil nostrum et obcaecati sint. Cum laborum magnam aut quia optio sed minima quis.',
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
