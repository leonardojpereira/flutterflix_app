import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';

class ShoeTitleWidthImage extends StatelessWidget {
  const ShoeTitleWidthImage({
    super.key,
    required this.shoe,
  });

  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Amazing sneakers',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            shoe.name,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: 'Price\n'),
                TextSpan(
                    text: '\$${shoe.price}',
                    style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold))
              ])),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Image.asset(
                    shoe.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}