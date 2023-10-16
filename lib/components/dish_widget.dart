import 'package:flutter/material.dart';

import '../utils/constants.dart';

class DishWidget extends StatelessWidget {
  // const DishWidget2({super.key});

  final List<String> _promocoes = [
    'Hamburguer 1',
    'Hamburguer 2',
    'Hamburguer 3',
    'Hamburguer 4',
    'Hamburguer 5',
  ];



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * Constants.cardHeightFactor,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _promocoes.length,
              itemBuilder: ((context, index) {
                return Stack(
                  children: [
                    Card(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      margin: EdgeInsets.only(
                          top: height * Constants.cardTopFactor, right: 10, left: 10, bottom: 10),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: SizedBox(
                        height: height * Constants.cardHeightFactor,
                        width: width * Constants.cardWidthFactor,
                        child: Padding(
                          padding: EdgeInsets.only(
                              // top: 90, right: 10, left: 10, bottom: 10),
                              top: height * Constants.textCardTopFactor, right: 10, left: 10, bottom: 10),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Hamburguer frango',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 15),
                              ),

                              RichText(
                                text: TextSpan(
                                  text: 'R\$ ',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  children: [
                                    TextSpan(
                                      text: '27,99',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).colorScheme.secondary),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Image
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Center(
                        child: Container(
                          height: 0.5 * height * Constants.cardHeightFactor,
                          width: 0.75 * width * Constants.cardWidthFactor,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/comidas/hamburguer-${index + 1}.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Icons
                    // Positioned(
                    //   left: 15,
                    //   bottom: 17,
                    //   child: const ImageIcon(
                    //     AssetImage('assets/icons/deliveryman-1.png'),
                    //     size: 17,
                    //   ),
                    // ),

                    const Positioned(
                      left: 15,
                      bottom: 17,
                      child: Row(
                        children: [
                          ImageIcon(
                            AssetImage('assets/icons/deliveryman-1.png'),
                            size: 17,
                          ),
                          Text(
                            '10-20min',
                            style: TextStyle(fontSize: 9),
                          )
                        ],
                      ),
                    ),

                    Positioned(
                      right: 15,
                      bottom: 17,
                      child: Row(
                        children: [
                          ImageIcon(
                            const AssetImage(
                                'assets/icons/estrela-96(-xxxhdpi).png'),
                            size: 17,
                            color: Colors.yellow[500],
                          ),
                          const Text(
                            '4,7',
                            style: TextStyle(fontSize: 9),
                          )
                        ],
                      ),
                    ),
                  ],
                );

                // return Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     color: Colors.amber,
                //     child: Text(_promocoes[index]),
                //   ),
                // );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
