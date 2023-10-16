import 'package:flutter/material.dart';

class PasswordScreen extends StatelessWidget {
  
  static const routeName = '/PasswordScreen';

  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Screen'),
      ),
      body: const Center(
        child: Text(
          'Password Screen',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}