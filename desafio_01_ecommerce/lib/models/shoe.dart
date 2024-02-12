class Shoe {
  final String name;
  final String price;
  final String imagePath;
  final String description;
  final String size;
  int quantity;

  Shoe({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.size,
    this.quantity = 0,
  });
}
