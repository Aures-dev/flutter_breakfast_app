class Diet {
  final String name;
  final String image;
  final List<String> specifications;

  Diet({
    required this.name,
    required this.image,
    required this.specifications,
  });

  // Convertir en JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'specifications': specifications,
    };
  }

  // Convertir depuis JSON
  factory Diet.fromJson(Map<String, dynamic> json) {
    return Diet(
      name: json['name'],
      image: json['image'],
      specifications: List<String>.from(json['specifications']),
    );
  }
}

// liste des régimes alimentaires par défaut
List<Diet> diets = [
  Diet(
    name: "Végétarien",
    image: "icons/plate.svg",
    specifications: ["Easy", "30 mins", "180KCal"],
  ),
  Diet(
    name: "Canai Bread",
    image: "icons/canai-bread.svg",
    specifications: ["Easy", "20 mins", "230KCal"],
  ),
];

