import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'health_calculator.dart';
import 'nutrition_calculator.dart';
import 'pola_makan.dart';
import 'program_latihan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/health_calculator': (context) => const HealthCalculatorScreen(),
        '/nutrition_calculator': (context) => const NutritionCalculatorScreen(),
        '/pola_makan': (context) => const MealPlanScreen(),
        '/program_latihan': (context) =>  ProgramLatihan(),
      },
    );
  }
}