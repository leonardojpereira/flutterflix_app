import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Air Max 270',
      price: '236',
      imagePath: "lib/images/air_max_270_react_0.png",
      description: 'The forward-thinking design of his latest signature shoe.',
    ),
    Shoe(
      name: 'Air Jordan Low',
      price: '350',
      imagePath: 'lib/images/nike8.png',
      description:
          'You\'ve got the hops and the speed-lace up in shoes that enhance the best.',
    ),
    Shoe(
      name: 'Revolution 7',
      price: '400',
      imagePath: 'lib/images/nike2.png',
      description:
          'You\'ve got the hops and the speed-lace up in shoes that enhance the best.',
    ),
    Shoe(
      name: 'Air Max React',
      price: '350',
      imagePath: 'lib/images/nike1.png',
      description:
          'Step into greatness with Jordan: Elevate your style, embrace your passion, and soar above the rest.',
    ),
    Shoe(
      name: 'Air Jordan GS',
      price: '800',
      imagePath: 'lib/images/nike7.png',
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
