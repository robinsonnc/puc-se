import 'package:flutter/material.dart';

class PseudoAppBar extends StatefulWidget {
  const PseudoAppBar({super.key});

  @override
  State<PseudoAppBar> createState() => _PseudoAppBarState();
}

class _PseudoAppBarState extends State<PseudoAppBar> {
  List<String> serviceTypes = ['Entrega', 'Retirada'];
  String serviceTypeValue = 'Entrega';

  // @override
  // void initState() {
  //   super.initState();
  //   defaultServiceType = serviceType.first;
  // }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        color: Theme.of(context).colorScheme.background,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 120,
                    height: 35,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .onInverseSurface
                            .withOpacity(0.4),
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.4),
                            width: 1),
                        borderRadius: BorderRadius.circular(15),
                        // boxShadow: [BoxShadow(color: Theme.of(context).colorScheme.primary.withOpacity(0.2), blurRadius: 1)]
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        isDense: false,
                        value: serviceTypeValue,
                        underline: Container(),
                        onChanged: (String? value) {
                          setState(() {
                            serviceTypeValue = value!;
                          });
                        },
                        items: serviceTypes.map((String serviceType) {
                          return DropdownMenuItem(
                            alignment: Alignment.center,
                            value: serviceType,
                            child: Text(
                              serviceType,
                              style: const TextStyle(fontSize: 14),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  // Badge
                  InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      // color: Colors.amber,
                      width: 35,
                      height: 35,
                      child: Padding(
                        padding: EdgeInsets.only(right: 7),
                        child: Center(
                          child: Badge(
                            label: Text('3'),
                            alignment: AlignmentDirectional.topEnd,
                            child: ImageIcon(AssetImage(
                                'assets/icons/bell-6(-xxxhdpi)-outlined.png')),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Address
            if (serviceTypeValue == 'Entrega')
              InkWell(
                onTap: () {
                  setState(() {});
                  print('Change Address');
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  child: Text('R. Sete de Abril, 425'),
                ),
              ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  // fillColor: Theme.of(context).colorScheme.tertiaryContainer,
                  fillColor: Theme.of(context)
                      .colorScheme
                      .tertiary
                      .withOpacity(0.1),
                  isCollapsed: true,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 9),
                  hintText: 'Pesquise aqui...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 25,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  // prefixIcon: const ImageIcon(AssetImage(
                  //     'assets/icons/search-200(-xxxhdpi).png')),
                  suffixIcon: Icon(
                    Icons.clear,
                    size: 17,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
