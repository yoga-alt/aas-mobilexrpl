import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'menu_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showFeatures = false;

  void _toggleFeatures() {
    setState(() {
      _showFeatures = !_showFeatures;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HealtySlim'),
      ),
      body: Stack(
        children: <Widget>[
          // Background image with opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.5, // Set opacity level here
              child: Image.asset(
                'assets/selamatdatang2.png', // Mengganti selamatdatang1.png dengan selamatdatang2.png
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 250,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!_showFeatures)
                    Column(
                      children: [
                        Text(
                          'HealtySlim',
                          style: TextStyle(
                            fontSize: 27, // Ubah ukuran teks sesuai kebutuhan
                            color: Color.fromARGB(255, 142, 137, 137), // Ubah warna teks menjadi putih
                            fontWeight: FontWeight.bold, // Tambahkan gaya teks tebal
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _toggleFeatures,
                          child: const Text('Lihat Fitur'),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          shrinkWrap: true,
                          children: const <Widget>[
                            MenuButton(title: 'Health Calculator', routeName: '/health_calculator'),
                            MenuButton(title: 'Nutrition Calculator', routeName: '/nutrition_calculator'),
                            MenuButton(title: 'Pola Makan', routeName: '/pola_makan'),
                            MenuButton(title: 'Program Latihan', routeName: '/program_latihan'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Logout'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _toggleFeatures,
                          child: const Text('Kembali'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: const HomeScreen(),
  ));
}