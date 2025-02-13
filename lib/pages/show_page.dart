import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/diet.dart';

class ShowPage extends StatelessWidget {
  final Diet diet;

  const ShowPage({super.key, required this.diet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image du Diet
            Center(
              child: SvgPicture.asset(
                diet.image,
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 20),

            // Nom du Diet
            Center(
              child: Text(
                diet.name,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            // Spécifications sous forme de badges
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: diet.specifications.map((spec) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.purple.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    spec,
                    style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Description
            const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "This is a delicious and healthy meal option that is easy to prepare and full of nutrients. Perfect for any time of the day!",
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 20),

            // Bouton Commander
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Ajouter une action plus tard
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Order Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
