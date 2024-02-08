import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/models/cart.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';
import 'package:flutter_05_ecommerce/pages/details_page.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;

  const CartItem({Key? key, required this.shoe}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int itemCount = 1;

  double getTotalPrice() {
    return double.parse(widget.shoe.price) * itemCount;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        void removeItemFromCart() {
          if (cart.getUserCart().contains(widget.shoe)) {
            cart.removeItemFromCart(widget.shoe);
          }
        }

        void navigateToProductDetails(BuildContext context, Shoe shoe) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShoeDetailsPage(
                shoe: shoe,
              ),
            ),
          );
        }

        void incrementItemCount() {
          setState(() {
            itemCount++;
          });
        }

        void decrementItemCount() {
          if (itemCount > 0) {
            setState(() {
              itemCount--;
              if (itemCount < 1) {
                removeItemFromCart();
              }
            });
          }
        }

        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          margin:const EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: GestureDetector(
              onTap: () => navigateToProductDetails(context, widget.shoe),
              child: Image.asset(widget.shoe.imagePath),
            ),
            
            title: Text(widget.shoe.name, style: TextStyle(fontSize: 16),),
            subtitle: Text(
                '\$${getTotalPrice().toStringAsFixed(0)}'),
                trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: decrementItemCount,
                  icon: const Icon(Icons.remove),
                ),
                Text('$itemCount'),
                IconButton(
                  onPressed: incrementItemCount,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
