import 'package:flutter/material.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}


// Racine de l'application 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Breakfast App',
      theme: ThemeData(
        fontFamily: 'Poppins', // Police globale
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: Routing.generateRoutes,
    );
  }
}
