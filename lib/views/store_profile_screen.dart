import 'package:flutter/material.dart';
import 'package:meu_pedido/components/business_day.dart';
import 'package:meu_pedido/models/store_profile_model.dart';
import 'package:meu_pedido/views/details_screen.dart';

class StoreProfileScreen extends StatelessWidget {
  StoreProfileScreen({super.key});

  static const routeName = '/StoreProfileScreen';

  // final String storeName;

  @override
  Widget build(BuildContext context) {
    final storeProfileModel =
        ModalRoute.of(context)!.settings.arguments as StoreProfileModel;

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: storeProfileModel.colorScheme.background,
    //     title: Text(storeProfileModel.storeName),
    //     centerTitle: true,
    //   ),
    //   body: Theme(
    //     data: ThemeData(
    //       useMaterial3: true,
    //       colorScheme: storeProfileModel.colorScheme,
    //       // primaryColor: Colors.blue,
    //       // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
    //     ),
    //     child: Builder(
    //       builder: (BuildContext ctx) {
    //         return Column(
    //           children: [
    //             Container(
    //               width: double.infinity,
    //               height: 150,
    //               decoration: BoxDecoration(
    //                 // color: storeProfileModel.colorScheme.onPrimary,
    //                 color: Theme.of(ctx).colorScheme.primary,
    //                 image: const DecorationImage(
    //                     image:
    //                         AssetImage('assets/images/logos/cafe-merlot.jpg')),
    //               ),
    //             ),
    //             TextButton(
    //               onPressed: () {
    //                 // Navigator.of(ctx).pushNamed(DetailsScreen.routeName);
    //                 Navigator.pushNamed(ctx, DetailsScreen.routeName);
    //               },
    //               child: Text(
    //                 'Teste',
    //                 style: TextStyle(
    //                   fontSize: 45,
    //                   fontWeight: FontWeight.bold
    //                 ),
    //               ),
    //             ),
    //           ],
    //         );
    //       },
    //     ),
    //   ),
    // );

    ThemeData themeData = ThemeData(
      useMaterial3: true,
      colorScheme: storeProfileModel.colorScheme,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: storeProfileModel.colorScheme.background,
    );

    return Theme(
      data: themeData,
      // data: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: storeProfileModel.colorScheme,
      //   primaryColor: Colors.blue,

      //   scaffoldBackgroundColor: storeProfileModel.colorScheme.background,
      //   // scaffoldBackgroundColor: lightColorScheme.background,
      // ),

      // data: Theme.of(context).copyWith(primaryColor: Colors.blue),

      child: Builder(builder: (BuildContext ctx) {
        return Scaffold(
          appBar: AppBar(
            // backgroundColor: storeProfileModel.colorScheme.primary,
            backgroundColor: Theme.of(ctx).colorScheme.onPrimary,
            title: Text(storeProfileModel.storeName),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                color: Theme.of(ctx).colorScheme.onPrimary,

                // child: Container(
                //   // height: 50,
                //   // width: 100,
                //   decoration: const BoxDecoration(
                //     // color: Colors.blue,
                //     image: DecorationImage(
                //       image: AssetImage('assets/images/logos/cafe-merlot.jpg')
                //     ),
                //     shape: BoxShape.circle,
                //   ),
                // ),

                child: Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/logos/cafe-merlot.jpg',
                          height: 250,
                          width: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Address, Unit
              const SizedBox(
                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Café Merlot - Unidade Piracicaba',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Cafés especiais'),
                                  ],
                                ),
                              ),
                              ImageIcon(
                                AssetImage(
                                    'assets/icons/estrela-96(-xxxhdpi).png'),
                                size: 18,
                                color: Colors.yellow,
                              ),
                              Text('4,8 (51 avaliaçoes)'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Horário de Funcionamento
              // Padding(
              //   padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              //   child: Container(
              //     width: double.infinity,
              //     height: 25,
              //     color: Colors.blue[900],
              //     child: Padding(
              //       padding: EdgeInsets.only(left: 7, right: 7),
              //       child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text('Horário de funcionamento'),
              //             // IconButton(
              //             //   onPressed: () {},
              //             //   icon: ImageIcon(
              //             //     AssetImage(
              //             //         'assets/icons/expand-more-96(-xxxhdpi).png'),
              //             //     size: 50,
              //             //     color: Colors.white,
              //             //   ),
              //             // ),
                  
              //             InkWell(
              //               onTap: () {
                              
              //               },
              //               child: ImageIcon(
              //                   const AssetImage(
              //                       'assets/icons/expand-more-96(-xxxhdpi).png'),
              //                   color: Colors.white,
              //                 ),
              //             ),

                          
                  
              //           ]),
              //     ),
              //   ),
              // ),


              BusinessDay(),


              const SizedBox(
                height: 20,
              ),

              TextButton(
                onPressed: () {
                  Navigator.of(ctx)
                      .pushNamed(DetailsScreen.routeName, arguments: themeData);
                  // Navigator.pushNamed(ctx, DetailsScreen.routeName);
                },
                child: const Text(
                  'Teste',
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
