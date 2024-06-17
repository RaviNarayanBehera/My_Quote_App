import 'package:flutter/material.dart';

import 'Screens/Life/edit_page.dart';
import 'Screens/Life/list_page.dart';
import 'Screens/Life/list_screen.dart';
import 'Screens/Life/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => const CategoryScreen(),
      '/life': (context) => const ListScreen(),
      '/final': (context) => const Edit(),
      // '/' : (context) => const Life(),
    });
  }
}
