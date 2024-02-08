import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/components/body_details.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';
import 'package:flutter_05_ecommerce/pages/cart_page.dart';

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
        actions: <Widget>[
          IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage())), icon: Icon(Icons.shopping_cart, color: Colors.white,)),
        ],
      ),
      body: BodyDetails(shoe: shoe,),
    );
  }
}
