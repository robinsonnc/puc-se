import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  
  static const routeName = '/HelpScreen';

  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Screen'),
      ),
      body: const Center(
        child: Text(
          'Help Screen',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}