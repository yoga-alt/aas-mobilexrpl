import 'package:flutter/material.dart';

class NutritionCalculatorScreen extends StatefulWidget {
  const NutritionCalculatorScreen({super.key});

  @override
  _NutritionCalculatorScreenState createState() => _NutritionCalculatorScreenState();
}

class _NutritionCalculatorScreenState extends State<NutritionCalculatorScreen> {
  String? _selectedFruit;
  String? _selectedMeat;
  String? _selectedVegetable;
  String? _selectedCarbohydrate;
  String? _selectedProtein;
  String? _selectedCalorie;
  String? _selectedSnack;
  String _result = '';

  final Map<String, Map<String, dynamic>> nutritionData = {
    'Apel': {'calories': 52, 'protein': 0.3, 'carbs': 14, 'fat': 0.2},
    'Pisang': {'calories': 89, 'protein': 1.1, 'carbs': 23, 'fat': 0.3},
    'Ayam': {'calories': 239, 'protein': 27, 'carbs': 0, 'fat': 14},
    'Daging Sapi': {'calories': 250, 'protein': 26, 'carbs': 0, 'fat': 15},
    'Wortel': {'calories': 41, 'protein': 0.9, 'carbs': 10, 'fat': 0.2},
    'Brokoli': {'calories': 34, 'protein': 2.8, 'carbs': 7, 'fat': 0.4},
    'Nasi': {'calories': 130, 'protein': 2.7, 'carbs': 28, 'fat': 0.3},
    'Roti': {'calories': 265, 'protein': 9, 'carbs': 49, 'fat': 3.2},
    'Telur': {'calories': 155, 'protein': 13, 'carbs': 1.1, 'fat': 11},
    'Kacang': {'calories': 567, 'protein': 25.8, 'carbs': 16.1, 'fat': 49.2},
    'Coklat': {'calories': 546, 'protein': 4.9, 'carbs': 61, 'fat': 31},
    'Keripik': {'calories': 536, 'protein': 7, 'carbs': 53, 'fat': 34},
  };

  void calculateNutrition() {
    double totalCalories = 0;
    double totalProteins = 0;
    double totalCarbs = 0;
    double totalFats = 0;

    if (_selectedFruit != null) {
      var fruitNutrition = nutritionData[_selectedFruit]!;
      totalCalories += fruitNutrition['calories'];
      totalProteins += fruitNutrition['protein'];
      totalCarbs += fruitNutrition['carbs'];
      totalFats += fruitNutrition['fat'];
    }

    if (_selectedMeat != null) {
      var meatNutrition = nutritionData[_selectedMeat]!;
      totalCalories += meatNutrition['calories'];
      totalProteins += meatNutrition['protein'];
      totalCarbs += meatNutrition['carbs'];
      totalFats += meatNutrition['fat'];
    }

    if (_selectedVegetable != null) {
      var vegetableNutrition = nutritionData[_selectedVegetable]!;
      totalCalories += vegetableNutrition['calories'];
      totalProteins += vegetableNutrition['protein'];
      totalCarbs += vegetableNutrition['carbs'];
      totalFats += vegetableNutrition['fat'];
    }

    if (_selectedCarbohydrate != null) {
      var carbohydrateNutrition = nutritionData[_selectedCarbohydrate]!;
      totalCalories += carbohydrateNutrition['calories'];
      totalProteins += carbohydrateNutrition['protein'];
      totalCarbs += carbohydrateNutrition['carbs'];
      totalFats += carbohydrateNutrition['fat'];
    }

    if (_selectedProtein != null) {
      var proteinNutrition = nutritionData[_selectedProtein]!;
      totalCalories += proteinNutrition['calories'];
      totalProteins += proteinNutrition['protein'];
      totalCarbs += proteinNutrition['carbs'];
      totalFats += proteinNutrition['fat'];
    }

    if (_selectedCalorie != null) {
      var calorieNutrition = nutritionData[_selectedCalorie]!;
      totalCalories += calorieNutrition['calories'];
      totalProteins += calorieNutrition['protein'];
      totalCarbs += calorieNutrition['carbs'];
      totalFats += calorieNutrition['fat'];
    }

    if (_selectedSnack != null) {
      var snackNutrition = nutritionData[_selectedSnack]!;
      totalCalories += snackNutrition['calories'];
      totalProteins += snackNutrition['protein'];
      totalCarbs += snackNutrition['carbs'];
      totalFats += snackNutrition['fat'];
    }

    setState(() {
      _result = 'Total Nutrisi:\n'
          'Kalori: $totalCalories kcal\n'
          'Protein: $totalProteins g\n'
          'Karbohidrat: $totalCarbs g\n'
          'Lemak: $totalFats g';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Nutrisi'),
      ),
      body: Stack(
        children: <Widget>[
          // Background image with opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.5, // Set opacity level here
              child: Image.asset(
                'assets/nutrisi.png',
                fit: BoxFit.cover, // Make the image cover the entire screen
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                const Text(
                  'Pilih Buah:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                DropdownButton<String>(
                  value: _selectedFruit,
                  hint: const Text('Pilih Buah'),
                  items: nutritionData.keys
                      .where((key) =>
                          key != 'Ayam' &&
                          key != 'Daging Sapi' &&
                          key != 'Nasi' &&
                          key != 'Roti' &&
                          key != 'Telur' &&
                          key != 'Kacang' &&
                          key != 'Coklat' &&
                          key != 'Keripik')
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedFruit = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pilih Daging:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                DropdownButton<String>(
                  value: _selectedMeat,
                  hint: const Text('Pilih Daging'),
                  items: nutritionData.keys
                      .where((key) =>
                          key != 'Apel' &&
                          key != 'Pisang' &&
                          key != 'Wortel' &&
                          key != 'Brokoli' &&
                          key != 'Nasi' &&
                          key != 'Roti' &&
                          key != 'Telur' &&
                          key != 'Kacang' &&
                          key != 'Coklat' &&
                          key != 'Keripik')
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedMeat = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pilih Sayuran:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                DropdownButton<String>(
                  value: _selectedVegetable,
                  hint: const Text('Pilih Sayuran'),
                  items: nutritionData.keys
                      .where((key) =>
                          key != 'Apel' &&
                          key != 'Pisang' &&
                          key != 'Ayam' &&
                          key != 'Daging Sapi' &&
                          key != 'Nasi' &&
                          key != 'Roti' &&
                          key != 'Telur' &&
                          key != 'Kacang' &&
                          key != 'Coklat' &&
                          key != 'Keripik')
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedVegetable = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pilih Karbohidrat:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                DropdownButton<String>(
                  value: _selectedCarbohydrate,
                  hint: const Text('Pilih Karbohidrat'),
                  items: nutritionData.keys
                      .where((key) =>
                          key != 'Apel' &&
                          key != 'Pisang' &&
                          key != 'Ayam' &&
                          key != 'Daging Sapi' &&
                          key != 'Wortel' &&
                          key != 'Brokoli' &&
                          key != 'Telur' &&
                          key != 'Kacang' &&
                          key != 'Coklat' &&
                          key != 'Keripik')
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCarbohydrate = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pilih Protein:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                DropdownButton<String>(
                  value: _selectedProtein,
                  hint: const Text('Pilih Protein'),
                  items: nutritionData.keys
                      .where((key) =>
                          key != 'Apel' &&
                          key != 'Pisang' &&
                          key != 'Ayam' &&
                          key != 'Daging Sapi' &&
                          key != 'Wortel' &&
                          key != 'Brokoli' &&
                          key != 'Nasi' &&
                          key != 'Roti' &&
                          key != 'Telur' &&
                          key != 'Coklat' &&
                          key != 'Keripik')
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedProtein = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pilih Cemilan:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                DropdownButton<String>(
                  value: _selectedSnack,
                  hint: const Text('Pilih Cemilan'),
                  items: nutritionData.keys
                      .where((key) =>
                          key != 'Apel' &&
                          key != 'Pisang' &&
                          key != 'Ayam' &&
                          key != 'Daging Sapi' &&
                          key != 'Wortel' &&
                          key != 'Brokoli' &&
                          key != 'Nasi' &&
                          key != 'Roti' &&
                          key != 'Telur' &&
                          key != 'Kacang')
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedSnack = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateNutrition,
                  child: const Text('Hitung Nutrisi'),
                ),
                const SizedBox(height: 20),
                Text(
                  _result,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: NutritionCalculatorScreen(),
  ));
}
class NutritionData {
  final String breakfast;
  final String lunch;
  final String dinner;
  final String snacks;

  NutritionData({
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.snacks,
  });
}
