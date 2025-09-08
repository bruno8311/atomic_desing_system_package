import 'package:flutter/material.dart';
import 'presentation/screens/home_showcase_menu_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atomic Design Showcase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeShowcaseMenuList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ...existing code...
