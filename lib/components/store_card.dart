import 'package:flutter/material.dart';
import 'package:meu_pedido/models/store_profile_model.dart';
import 'package:meu_pedido/views/store_profile_screen.dart';

class StoreCard extends StatelessWidget {
  final StoreProfileModel storeProfileModel;

  const StoreCard({super.key, required this.storeProfileModel});

  // final String imageName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(StoreProfileScreen.routeName,
            arguments: storeProfileModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          height: 100,
          width: double.infinity,
          child: Card(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Row(
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.only(left: 7, right: 5),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage(storeProfileModel.imageUrl),
                  ),
                ),

                // Name, grade
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(storeProfileModel.storeName),
                      Text('Distância: ${storeProfileModel.distance}km'),
                      Text('Mesas disponíveis: ${storeProfileModel.availableTables}'),
                    ],
                  ),
                ),

                // Grade and Favorite icons
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, right: 7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ImageIcon(
                              const AssetImage(
                                  'assets/icons/estrela-96(-xxxhdpi).png'),
                              size: 18,
                              color: Colors.yellow[500],
                            ),
                            Text(
                              '${storeProfileModel.grade}',
                              style: const TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        ImageIcon(
                          const AssetImage(
                              'assets/icons/gostar-96(-xxxhdpi)-outlined.png'),
                          color: Colors.red[700],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
