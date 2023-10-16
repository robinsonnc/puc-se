import 'package:flutter/material.dart';

class SafetyScreen extends StatelessWidget {
  
  static const routeName = '/SafetyScreen';

  const SafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Screen'),
      ),
      body: const Center(
        child: Text(
          'Safety Screen',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
