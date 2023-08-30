import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CUBIT APPS'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              '0',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
