import 'package:flutter/material.dart';
import 'package:meu_pedido/components/category_filter.dart';
import 'package:meu_pedido/components/dish_widget.dart';
import 'package:meu_pedido/components/pseudo_app_bar.dart';
import 'package:meu_pedido/components/store_card.dart';
import '../dummy_data.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = [
    Tab(text: 'Entrega'),
    Tab(text: 'Retirada'),
  ];

  final List<String> _stores = [
    'Café Merlot',
    'Barleys',
    'Burger King',
  ];

  final List<String> _logos = [
    'chevette',
    'cafe-merlot',
    'burger-king',
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: tabs.length, vsync: this, animationDuration: Duration.zero);
  }

  List<StoreCard> buildList() {
    // List<StoreCard> storesList = [];

    // for (var i = 0; i < _stores.length; i++) {
    //   storesList.add(StoreCard(imageName: _logos[i],));
    // }
    // return storesList;

    return DUMMY_STORES.map((store) {
      return StoreCard(
        storeProfileModel: store,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var storesList = buildList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .17),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: (size.width * Constants.sizeFactor) *
                            Constants.heightFactor,
                        width: size.width * Constants.sizeFactor * 2 +
                            ((1 - Constants.sizeFactor * 4) / 8) *
                                2 *
                                size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image:
                                AssetImage('assets/images/comidas/arabe.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          height: 19,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(7))),
                          child: const Text('Árabe '),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: (size.width * Constants.sizeFactor) *
                            Constants.heightFactor,
                        width: size.width * Constants.sizeFactor,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/comidas/mexicana.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          height: 19,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(7))),
                          child: const Text('Mexicana '),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: (size.width * Constants.sizeFactor) *
                            Constants.heightFactor,
                        width: size.width * Constants.sizeFactor,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/comidas/italiana.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          height: 19,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(7))),
                          child: const Text('Italiana '),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: (size.width * Constants.sizeFactor) *
                            Constants.heightFactor,
                        width: size.width * Constants.sizeFactor,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/comidas/doceria-brigadeiro-2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: const Center(child: Text('Docerias')),

                        child: Container(
                          height: 19,
                          // width: double.infinity,
                          // color: Theme.of(context).colorScheme.background,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(7))),
                          child: Text('Docerias '),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: (size.width * Constants.sizeFactor) *
                            Constants.heightFactor,
                        width: size.width * Constants.sizeFactor * 2 +
                            ((1 - Constants.sizeFactor * 4) / 8) *
                                2 *
                                size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/comidas/japonesa.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: const Center(child: Text('Japonesa')),

                        child: Container(
                          height: 19,
                          // width: double.infinity,
                          // color: Theme.of(context).colorScheme.background,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(7))),
                          child: Text('Japonesa '),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: (size.width * Constants.sizeFactor) *
                            Constants.heightFactor,
                        width: size.width * Constants.sizeFactor,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/comidas/vegana-1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: const Center(child: Text('Padarias ')),
                        child: Container(
                          height: 19,
                          // width: double.infinity,
                          // color: Theme.of(context).colorScheme.background,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(7))),
                          child: Text('Vegana '),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: (size.width * Constants.sizeFactor) *
                            Constants.heightFactor,
                        width: size.width * Constants.sizeFactor * 2 +
                            ((1 - Constants.sizeFactor * 4) / 8) *
                                2 *
                                size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/comidas/restaurantes-1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: const Center(child: Text('Restaurantes')),
                        child: Container(
                          height: 19,
                          // width: double.infinity,
                          // color: Theme.of(context).colorScheme.background,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(7))),
                          child: Text('Restaurantes '),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: (size.width * Constants.sizeFactor) *
                            Constants.heightFactor,
                        width: size.width * Constants.sizeFactor * 2 +
                            ((1 - Constants.sizeFactor * 4) / 8) *
                                2 *
                                size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image:
                                AssetImage('assets/images/comidas/cafe-1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: const Center(child: Text('Cafeterias')),
                        child: Container(
                          // alignment: Alignment.bottomCenter,
                          height: 19,
                          // width: double.infinity,
                          // color: Theme.of(context).colorScheme.background,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(7))),
                          child: Text('Cafeterias '),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 7,
                  ),

                  CategoryFilter(),

                  const SizedBox(
                    height: 12,
                  ),

                  const Text(
                    '   Promoções do dia',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Container(color: Colors.amber,),

                  const SizedBox(
                    height: 8,
                  ),

                  DishWidget(),

                  const SizedBox(
                    height: 12,
                  ),

                  const Text(
                    '   Lojas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Container(color: Colors.amber,),

                  const SizedBox(
                    height: 8,
                  ),

                  ...storesList,
                ],
              ),
            ),

            // Pseudo AppBar
            PseudoAppBar(),

            // const Positioned(
            //   right: 5,
            //   child: Badge(
            //     label: Text('3'),
            //     alignment: AlignmentDirectional.topEnd,
            //     child: ImageIcon(
            //         AssetImage('assets/icons/bell-6(-xxxhdpi)-outlined.png')),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
