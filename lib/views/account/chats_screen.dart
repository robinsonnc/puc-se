import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  
  static const routeName = '/ChatsScreen';

  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats Screen'),
      ),
      body: const Center(
        child: Text(
          'Chats Screen',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}