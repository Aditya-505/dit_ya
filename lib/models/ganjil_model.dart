// File: lib/models/ganjil_model.dart

class Ganjil {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  Ganjil({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Ganjil.fromJson(Map<String, dynamic> json) {
    return Ganjil(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}
