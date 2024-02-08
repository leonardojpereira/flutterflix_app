import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/models/cart.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';
import 'package:provider/provider.dart';

class ButtonAddToCartDescription extends StatelessWidget {
  final Shoe shoe;

  const ButtonAddToCartDescription({Key? key, required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => GestureDetector(
        onTap: () {
          cart.addItemToCart(shoe); // Adiciona o sapato ao carrinho
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Successfully added!'),
              content: Text('Check your cart'),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(top: 46),
          width: 400,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.shop_sharp,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                Text(
                  'Add to cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
