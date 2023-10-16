import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  
  static const routeName = '/SettingsScreen';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      body: const Center(
        child: Text(
          'Settings Screen',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}