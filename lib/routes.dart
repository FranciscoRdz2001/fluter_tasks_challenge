import 'package:flutter_tasks_challenge/presentation/home/bindings/home_page_bindings.dart';
import 'package:flutter_tasks_challenge/presentation/home/pages/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage> getPages = [
  GetPage(
    name: '/home',
    page: () => const HomePage(),
    binding: const HomePageBindings(),
  ),
];
