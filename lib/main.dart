import 'package:flutter/material.dart';
import 'package:recipe/helpers/db_helper.dart';
import 'package:recipe/widgets/BottomNavbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RecipeProvider.instance.open();
  await RecipeProvider.instance.getrecipe();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: BottomNavigation());
  }
}
