import 'package:flutter/material.dart';

class ButtonAddToCartDescription extends StatelessWidget {
  const ButtonAddToCartDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 46),
      width: 400,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12.0),
        
      ),
      child: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.shop_sharp, color: Colors.white, size: 26,),
          ),
          Text('Add to cart', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
        ],
      )),
    );
  }
}
