import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';

class CartCounter extends StatefulWidget {
    final Shoe shoe;

  const CartCounter({Key? key, required this.shoe}) : super(key: key);


  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int counter = 1;

    double getTotalPrice() {
    return double.parse(widget.shoe.price) * counter;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            setState(() {
              if(counter > 1) {
                widget.shoe.price;
                 counter--;
              }
              return;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            counter.toString().padLeft(2, '0'),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        buildOutlineButton(
          icon: Icons.add,
          press: () {
            setState(() {
              counter++;
            });
          },
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({required IconData icon, required VoidCallback press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: GestureDetector(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon),
        ),
      ),
    );
  }
}