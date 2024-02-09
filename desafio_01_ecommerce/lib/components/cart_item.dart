import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/models/cart.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';
import 'package:flutter_05_ecommerce/pages/details_page.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;

  const CartItem({Key? key, required this.shoe}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: GestureDetector(
              onTap: () => _navigateToProductDetails(context, widget.shoe),
              child: Image.asset(widget.shoe.imagePath),
            ),
            title: Text(
              widget.shoe.name,
              style: TextStyle(fontSize: 16),
            ),
            subtitle: Text('\$${_getTotalPrice(widget.shoe)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => _decrementItemCount(context),
                  icon: const Icon(Icons.remove),
                ),
                Text('${widget.shoe.quantity}'),
                IconButton(
                  onPressed: () => _incrementItemCount(context),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _getTotalPrice(Shoe shoe) {
    return (double.parse(shoe.price) * shoe.quantity).toStringAsFixed(0);
  }

  void _navigateToProductDetails(BuildContext context, Shoe shoe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShoeDetailsPage(
          shoe: shoe,
        ),
      ),
    );
  }

  void _incrementItemCount(BuildContext context) {
    Provider.of<Cart>(context, listen: false).addItemToCart(widget.shoe);
  }

  void _decrementItemCount(BuildContext context) {
    if (widget.shoe.quantity > 0) {
      setState(() {
        widget.shoe.quantity--;
        if (widget.shoe.quantity < 1) {
          Provider.of<Cart>(context, listen: false)
              .removeItemFromCart(widget.shoe);
        }
      });
    }
  }
}
