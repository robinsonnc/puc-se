import 'package:flutter/material.dart';

class BusinessDay extends StatefulWidget {
  const BusinessDay({super.key});

  @override
  State<BusinessDay> createState() => _BusinessDayState();
}

class _BusinessDayState extends State<BusinessDay> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   margin: EdgeInsets.all(5),
    //   child: Column(
    //     children: [
    //       ListTile(
    //         title: Text('Horário'),
    //         trailing: IconButton(
    //           icon: Icon(Icons.expand_more),
    //           onPressed: () {
    //             setState(() {
    //               _expanded = !_expanded;
    //             });
    //           },
    //         ),
    //       ),
    //       if (_expanded)
    //         Container(
    //           child: Text('UNESP!!!'),
    //         ),
    //     ],
    //   ),
    // );

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Aberto | Mesas disponíveis: 9'),
                  
                  // IconButton(
                  //   onPressed: () {
                  //     print('Before $_expanded');
                  //     setState(() {
                  //       _expanded = !_expanded;
                  //     });
                  //     print('After $_expanded');
                  //   },
                  //   icon: Icon(Icons.expand_more),
                  // ),
                
                  InkWell(
                    onTap: () {
                      setState(() {
                        _expanded = ! _expanded;
                      });
                    },
                    child: ImageIcon(
                      const AssetImage(
                          'assets/icons/expand-more-96(-xxxhdpi).png'),
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
            ),
            // if (_expanded)
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
                color: Theme.of(context).colorScheme.secondaryContainer,
                // height: 65,
                height: _expanded == false ? 0 : 90,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ListView(
                    children: const [
                      Text('Horário de funcionamento'),
                      Text('Segunda a sexta: 9:00 às 18:00'),
                      Text('Sábado: 9:00 às 16:00'),
                      Text('Domingo: 9:00 às 12:00'),
                    ],
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
