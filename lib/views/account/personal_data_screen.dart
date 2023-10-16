import 'package:flutter/material.dart';

class PersonalDataScreen extends StatelessWidget {
  
  static const routeName = '/PersonalDataScreen';

  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Data Screen'),
      ),
      body: const Center(
        child: Text(
          'Personal Data Screen',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}