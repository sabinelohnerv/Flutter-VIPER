import 'package:flutter/material.dart';
import 'package:viper_project/modules/items/view/items_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter VIPER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ItemsScreen(),
    );
  }
}
