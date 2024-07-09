import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 43, 214, 49),
          onPrimary: Colors.white,
        ),
      ),
      home: ProgramLatihan(),
    );
  }
}

class ProgramLatihan extends StatelessWidget {
  ProgramLatihan({super.key}); // Hapus 'const' dari sini

  final exercises = [
    Exercise(
      name: 'Jalan Kaki',
      icon: Icons.directions_walk,
      repetitions: '30 menit',
      calories: 150,
    ),
    Exercise(
      name: 'Push Up',
      icon: Icons.fitness_center,
      repetitions: '3 x 15 repetisi',
      calories: 50,
    ),
    Exercise(
      name: 'Sit Up',
      icon: Icons.accessibility_new,
      repetitions: '3 x 20 repetisi',
      calories: 40,
    ),
    Exercise(
      name: 'Squat',
      icon: Icons.airline_seat_legroom_extra,
      repetitions: '3 x 15 repetisi',
      calories: 50,
    ),
    Exercise(
      name: 'Angkat Beban',
      icon: Icons.fitness_center,
      repetitions: '3 x 12 repetisi',
      calories: 70,
    ),
    Exercise(
      name: 'Jogging',
      icon: Icons.directions_run,
      repetitions: '30 menit',
      calories: 200,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olahraga untuk Diet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            final exercise = exercises[index];
            return ExerciseCard(exercise: exercise);
          },
        ),
      ),
    );
  }
}

class Exercise {
  final String name;
  final IconData icon;
  final String repetitions;
  final int calories;

  Exercise({
    required this.name,
    required this.icon,
    required this.repetitions,
    required this.calories,
  });
}

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;

  const ExerciseCard({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(exercise.name),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Repetisi yang disarankan: ${exercise.repetitions}'),
                    const SizedBox(height: 10),
                    Text('Kalori yang terbakar: ${exercise.calories} kkal'),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(exercise.icon, size: 50, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              exercise.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
