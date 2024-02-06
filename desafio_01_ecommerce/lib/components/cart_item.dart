import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/models/cart.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;
  CartItem({Key? key, required this.shoe}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItemFromCart() {
    Cart cart = Provider.of<Cart>(context, listen: false);
    if (cart.getUserCart().contains(widget.shoe)) {
      cart.removeItemFromCart(widget.shoe);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
      ),
    );
  }
}