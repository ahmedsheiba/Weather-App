import 'package:flutter/material.dart';

class NoInfoWidget extends StatelessWidget {
  const NoInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 16, 1, 32),
          Color.fromARGB(255, 131, 127, 129),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'No weather information',
                  style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Text(
                  'please search',
                  style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )
              ]),
        ),
      ),
    );
  }
}
