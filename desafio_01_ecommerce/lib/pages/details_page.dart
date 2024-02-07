import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/components/body_details.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';

class ShoeDetailsPage extends StatelessWidget {
  final Shoe shoe;

  const ShoeDetailsPage({Key? key, required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BodyDetails(shoe: shoe,),
    );
  }
}
