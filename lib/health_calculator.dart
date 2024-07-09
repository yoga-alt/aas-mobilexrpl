import 'package:flutter/material.dart';

class HealthCalculatorScreen extends StatefulWidget {
  const HealthCalculatorScreen({super.key});

  @override
  _HealthCalculatorScreenState createState() => _HealthCalculatorScreenState();
}

class _HealthCalculatorScreenState extends State<HealthCalculatorScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = '';

  void calculateIdealWeight() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text) / 100;

    double bmi = weight / (height * height);
    String category;
    if (bmi < 18.5) {
      category = 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      category = 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      category = 'Overweight';
    } else {
      category = 'Obesity';
    }

    double minIdealWeight = 18.5 * height * height;
    double maxIdealWeight = 24.9 * height * height;

    setState(() {
      _result = 'BMI Anda: ${bmi.toStringAsFixed(2)}\n'
          'Kategori BMI: $category\n'
          'Berat badan ideal Anda berkisar antara ${minIdealWeight.toStringAsFixed(2)} kg hingga ${maxIdealWeight.toStringAsFixed(2)} kg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Kesehatan'),
      ),
      body: Stack(
        children: <Widget>[
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/ftobackground.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
              ),
            ),
          ),
          // Your content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Berat Badan (kg)',
                  ),
                ),
                TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Tinggi Badan (cm)',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateIdealWeight,
                  child: const Text('Hitung'),
                ),
                const SizedBox(height: 20),
                Text(
                  _result,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
  home: HealthCalculatorScreen(),
));