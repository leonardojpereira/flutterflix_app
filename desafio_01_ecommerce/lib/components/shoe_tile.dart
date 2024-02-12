// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:flutter_05_ecommerce/models/shoe.dart";

// ignore: must_be_immutable
class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 250,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Image.asset(
                  shoe.imagePath,
                  width: 200,
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(shoe.description,
                style: TextStyle(color: Colors.grey[600])),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoe.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(
                            width: 60,
                            child: Text(
                              '\$' + shoe.price,
                              style: TextStyle(color: Colors.grey),
                            )),
                        Text(
                          'Size: ${shoe.size}',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
