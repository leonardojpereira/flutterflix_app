import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;

  const CustomSearch({
    super.key,
    this.controller,
    this.onSubmitted,
    this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22.0, top: 12.0),
      child: SearchBar(
        textStyle:
            MaterialStateProperty.all(const TextStyle(color: Colors.black)),
        hintText: 'Search',
        hintStyle: MaterialStateProperty.all(
            const TextStyle(color: Color.fromARGB(255, 88, 88, 88))),
        leading: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        )),
        controller: controller,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        focusNode: focusNode,
      ),
    );
  }
}
