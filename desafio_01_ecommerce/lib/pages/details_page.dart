import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/components/body_details.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';
import 'package:flutter_05_ecommerce/pages/cart_page.dart';

class ShoeDetailsPage extends StatefulWidget {
  final Shoe shoe;

  const ShoeDetailsPage({Key? key, required this.shoe}) : super(key: key);

  @override
  State<ShoeDetailsPage> createState() => _ShoeDetailsPageState();
}

class _ShoeDetailsPageState extends State<ShoeDetailsPage> {
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
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage()
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(Icons.shopping_cart, color: Colors.white,),
            ),
          )
          // IconButton(
          //     onPressed: () => Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => const CartPage())),
          //     icon: Icon(
          //       Icons.shopping_cart,
          //       color: Colors.white,
          //     )),
        ],
      ),
      body: BodyDetails(
        shoe: widget.shoe,
      ),
    );
  }
}
