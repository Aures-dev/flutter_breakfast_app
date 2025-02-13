class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});

  // Convertir un objet en Map (utile pour le stockage JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }

  // Convertir une Map en objet (utile pour récupérer les données)
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      image: json['image'],
    );
  }
}


// Liste des catégories par défaut
List<Category> categories = [
  Category(name: "Breakfast", image: "icons/pancakes.svg"),
  Category(name: "Plate", image: "icons/plate.svg"),
  Category(name: "Diner", image: "icons/salmon-nigiri.svg"),
];
