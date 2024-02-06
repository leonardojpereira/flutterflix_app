import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Air Max 270',
        price: '236',
        imagePath: "lib/images/air_max_270_react_0.png",
        description:
            'The forward-thinking design of his latest signature shoe.'),
    Shoe(
      name: 'Air Max',
      price: '350',
      imagePath: 'lib/images/air_max_270_react_2.png',
      description:
          'You\'ve got the hops and the speed-lace up in shoes that enhance the best.',
    ),
    Shoe(
      name: 'Jordan Max',
      price: '400',
      imagePath: 'lib/images/jordan_max_200_0.png',
      description:
          'You\'ve got the hops and the speed-lace up in shoes that enhance the best.',
    ),
    Shoe(
      name: 'Air Max React',
      price: '350',
      imagePath: 'lib/images/air_max_270_react_1.png',
      description:
          'Step into greatness with Jordan: Elevate your style, embrace your passion, and soar above the rest.',
    ),
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

}
