import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/components/button_add_cart_description.dart';
import 'package:flutter_05_ecommerce/components/favorite_button.dart';
import 'package:flutter_05_ecommerce/components/shoe_description.dart';
import 'package:flutter_05_ecommerce/components/shoe_title_width_image.dart';
import 'package:flutter_05_ecommerce/models/shoe.dart';

class BodyDetails extends StatelessWidget {
  final Shoe shoe;
  const BodyDetails({
    super.key,
    required this.shoe,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12, left: 24, right: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'Size\n',
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 18)),
                              TextSpan(
                                  text: shoe.size,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold))
                            ])),
                          ),
                          FavoriteButton(),
                        ],
                      ),
                      Description(shoe: shoe),
                      ButtonAddToCartDescription(
                        shoe: shoe,
                      )
                    ],
                  ),
                ),
                ShoeTitleWidthImage(shoe: shoe)
              ],
            ),
          )
        ],
      ),
    );
  }
}
