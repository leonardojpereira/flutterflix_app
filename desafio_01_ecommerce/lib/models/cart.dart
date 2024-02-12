import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Air Max 270',
      price: '236',
      imagePath: "lib/images/air_max_270_react_0.png",
      size: '6.5',
      description: 'The forward-thinking design of his latest signature shoe.',
    ),
    Shoe(
      name: 'Jordan Mid',
      price: '350',
      imagePath: 'lib/images/nike8.png',
      size: '9',
      description:
          'You\'ve got the hops and the speed-lace up in shoes that enhance the best.',
    ),
    Shoe(
      name: 'Speed Rival',
      price: '400',
      imagePath: 'lib/images/nike2.png',
      size: '7.5',
      description:
          'You\'ve got the hops and the speed-lace up in shoes that enhance the best.',
    ),
    Shoe(
      name: 'LunarGlide',
      price: '350',
      imagePath: 'lib/images/nike1.png',
      size: '8',
      description:
          'Step into greatness with Jordan: Elevate your style, embrace your passion, and soar above the rest.',
    ),
    Shoe(
      name: 'Jordan Low',
      price: '400',
      imagePath: 'lib/images/nike7.png',
      size: '10',
      description:
          'The Air Jordan 1 Alternate Black Royal GS was a addition to the catalog of the American sport and lifestyle brand',
    )
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    int index = userCart.indexWhere((item) => item.name == shoe.name);
    if (index != -1) {
      userCart[index].quantity++;
    } else {
      shoe.quantity = 1;
      userCart.add(shoe);
    }
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
