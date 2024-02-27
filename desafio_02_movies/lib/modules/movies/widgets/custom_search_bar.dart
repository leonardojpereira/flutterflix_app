import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String) onSearchSubmitted;
  final void Function(String) onSearchTextChanged;
  final FocusNode searchFocusNode;

  const CustomSearchBar({
    super.key,
    required this.searchController,
    required this.onSearchSubmitted,
    required this.onSearchTextChanged,
    required this.searchFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
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
      controller: searchController,
      onSubmitted: onSearchSubmitted, // Chamado quando pressionar Enter
      onChanged: onSearchTextChanged, // Chamado quando o texto muda
      focusNode: searchFocusNode, // Associar o FocusNode ao TextField
    );
  }
}
