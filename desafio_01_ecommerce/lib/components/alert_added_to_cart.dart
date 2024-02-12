import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/pages/cart_page.dart';

class AlertAddedToCart extends StatelessWidget {
  const AlertAddedToCart();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Successfully added!'),
      content: InkWell(
        child: Text(
          'Check your cart',
          style: TextStyle(color: Colors.blue),
        ),
        onTap: () {
          Navigator.pop(context); // Fechar o AlertDialog
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartPage()),
          );
        },
      ),
    );
  }
}
