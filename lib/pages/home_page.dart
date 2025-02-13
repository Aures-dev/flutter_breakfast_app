import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/custom_app_bar.dart';
import '../models/category.dart';
import '../models/diet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = '';

  // appelé à chaque fois que ce que l'utilisateur entre change
  void onQueryChanged(String newQuery) {
    setState(() {
      query = newQuery;
    });
  }

  // méthode pour la recherche
  List<Diet> get filteredDiets {
    if (query.isEmpty) return diets;
    return diets
        .where((diet) => diet.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barre de recherche
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: onQueryChanged,
                decoration: InputDecoration(
                  hintText: "Search Diet...",
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  suffixIcon: SvgPicture.asset(
                    'icons/Filter.svg',
                    width: 10,
                    height: 10,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Section Catégories
            const Text(
              "Category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return _buildCategoryItem(categories[index]);
                },
              ),
            ),

            const SizedBox(height: 20),

            // Section Recommandations
            const Text(
              "Recommendation for Diet",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: filteredDiets.length,
                itemBuilder: (context, index) {
                  return _buildDietItem(filteredDiets[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour afficher une catégorie
  Widget _buildCategoryItem(Category category) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.purple.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: SvgPicture.asset(
              category.image,
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(height: 5),
          Text(category.name,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  // Widget pour afficher un régime alimentaire
  Widget _buildDietItem(Diet diet) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(diet.image, width: 60, height: 60),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(diet.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(diet.specifications.join(" | "),
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  //Action vers la page de vue des plats
                  Navigator.pushNamed(
                    context,
                    '/show',
                    arguments: diet, 
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text("View"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
