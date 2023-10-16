import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {
  // const CategoryFilter({super.key});

  final List<String> _category_filters = [
    'Mercados',
    'Padarias',
    'Bebidas',
    'Pet Shops',
    'Farmácias',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _category_filters.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                        backgroundColor:
                            Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        // padding: const EdgeInsets.all(16.0),
                        // textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                      child: Text(_category_filters[index]),
                    ),

                    // child: ActionChip(
                    //   label: Text(_category_filters[index]),
                    //   backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    //   onPressed: () {},
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(18),
                    //     // side: BorderSide(color: Colors.black, width: 7),
                    //   ),
                    // ),
                  );
                })),
          ),

          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.arrow_forward_ios),
          // ),
        ],
      ),
    );
  }
}
