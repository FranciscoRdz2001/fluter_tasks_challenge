import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/presentation/home/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasks Challenge',
      home: HomePage(),
    );
  }
}
