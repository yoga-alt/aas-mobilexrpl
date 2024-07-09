import 'package:flutter/material.dart'; 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MealPlanScreen(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MealPlanScreen extends StatelessWidget {
  const MealPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pola Makan Sehari'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const <Widget>[
            MealCard(
              mealType: 'Sarapan',
              time: '07:00 - 09:00',
              recommendations: [
                'Oatmeal dengan buah segar',
                'Telur rebus',
                'Yogurt rendah lemak'
              ],
              calories: 300,
              icon: Icons.breakfast_dining,
            ),
            MealCard(
              mealType: 'Makan Siang',
              time: '12:00 - 14:00',
              recommendations: [
                'Salad dengan ayam panggang',
                'Sup sayuran',
                'Nasi merah dengan sayuran'
              ],
              calories: 400,
              icon: Icons.lunch_dining,
            ),
            MealCard(
              mealType: 'Makan Malam',
              time: '18:00 - 20:00',
              recommendations: [
                'Ikan panggang dengan sayuran',
                'Quinoa dengan sayuran',
                'Sup kacang merah'
              ],
              calories: 350,
              icon: Icons.dinner_dining,
            ),
            MealCard(
              mealType: 'Camilan',
              time: '10:00, 15:00',
              recommendations: [
                'Buah segar',
                'Kacang almond',
                'Yogurt rendah lemak'
              ],
              calories: 150,
              icon: Icons.fastfood,
            ),
          ],
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final String mealType;
  final String time;
  final List<String> recommendations;
  final int calories;
  final IconData icon;

  const MealCard({super.key, 
    required this.mealType,
    required this.time,
    required this.recommendations,
    required this.calories,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Icon(icon, size: 40, color: Colors.green),
                const SizedBox(width: 10),
                Text(
                  mealType,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Waktu: $time',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 10),
            const Text(
              'Rekomendasi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...recommendations.map((rec) => Text('- $rec', style: const TextStyle(fontSize: 16))).toList(),
            const SizedBox(height: 10),
            Text(
              'Kalori: $calories kcal',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}