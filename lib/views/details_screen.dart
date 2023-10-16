import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

  static const routeName = '/DetailsScreen';

  const DetailsScreen({super.key});

  
  @override
  Widget build(BuildContext context) {

    final themeData = ModalRoute.of(context)!.settings.arguments as ThemeData;

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text(''),
    //   ),
    //   body: Container(
    //     height: 100,
    //     width: 150,
    //     color: Theme.of(context).colorScheme.primary,
    //     // color: Theme.of(context).colorScheme.onPrimary,
    //   ),
    // );

    return Theme(
      data: themeData,
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          title: const Text('Details Screen'),
        ),
        body: Container(
          height: 100,
          width: 150,
          color: Theme.of(context).colorScheme.primary,
          // color: Theme.of(context).colorScheme.onPrimary,
        ),
      );
      })
    );





  }
}
