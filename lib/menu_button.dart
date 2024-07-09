import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String title;
  final String? routeName;

  const MenuButton({super.key, required this.title, this.routeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          if (routeName != null) {
            Navigator.pushNamed(context, routeName!);
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          textStyle: const TextStyle(fontSize: 14),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
