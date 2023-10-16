import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  
  static const routeName = '/AddressScreen';

  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Screen'),
      ),
      body: const Center(
        child: Text(
          'Address Screen',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
