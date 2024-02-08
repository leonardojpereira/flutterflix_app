import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/models/cart.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';
import 'package:flutter_05_ecommerce/pages/details_page.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final Shoe shoe;
  
  const CartItem({Key? key, required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        void removeItemFromCart() {
          if (cart.getUserCart().contains(shoe)) {
            cart.removeItemFromCart(shoe);
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

        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: GestureDetector(
              onTap: () => navigateToProductDetails(context, shoe),
              child: Image.asset(shoe.imagePath),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: removeItemFromCart,
            ),
            title: Text(shoe.name),
            subtitle: Text('\$${shoe.price}'),
          ),
        );
      },
    );
  }
}
