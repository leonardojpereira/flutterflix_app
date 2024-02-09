import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/components/cart_item.dart';
import 'package:flutter_05_ecommerce/models/cart.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: value.getUserCart().isEmpty
                  ? Container(
                      child: Text(
                        'Your cart is empty.',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: value.getUserCart().length,
                      itemBuilder: (context, index) {
                        Shoe individualShoe = value.getUserCart()[index];
                        return CartItem(
                          shoe: individualShoe,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
