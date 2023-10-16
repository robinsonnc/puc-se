import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  
  static const routeName = '/NotificationsScreen';

  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications Screen'),
      ),
      body: const Center(
        child: Text(
          'Notifications Screen',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}