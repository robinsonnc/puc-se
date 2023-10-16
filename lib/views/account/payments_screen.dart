import 'package:flutter/material.dart';

class PaymentsScreen extends StatelessWidget {

  static const routeName = '/PaymentsScreen';

  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments Screen'),
      ),
      body: const Center(
        child: Text(
          'Payments Screen',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
