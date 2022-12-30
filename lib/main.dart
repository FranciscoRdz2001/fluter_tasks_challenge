import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/presentation/home/bindings/home_page_bindings.dart';
import 'package:flutter_tasks_challenge/presentation/home/pages/home_page.dart';
import 'package:flutter_tasks_challenge/app/utils/routes.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      debugShowCheckedModeBanner: false,
      initialBinding: const HomePageBindings(),
      title: 'Tasks Challenge',
      home: const HomePage(),
    );
  }
}
