import 'package:flutter/material.dart';
import 'package:yandeh_challenge/app/shared/atoms/chip_atom.dart';
import 'package:yandeh_challenge/app/shared/styles/sizes.dart';

class TabsHomeWidget extends StatefulWidget {
  const TabsHomeWidget({super.key});

  @override
  State<TabsHomeWidget> createState() => _TabsHomeWidgetState();
}

class _TabsHomeWidgetState extends State<TabsHomeWidget> {
  int selectedCategory = 2;

  final categories = [
    'Todas categorias',
    'Campanhas',
    'Frutas Yandeh',
    'Indústrias e marcas',
    'Pedidos',
    'Importação de pedidos'
  ];

  @override
  Widget build(BuildContext context) {
    final isScreenMedium = MediaQuery.of(context).size.width > ScreenSize.small;

    return ConstrainedBox(
      constraints:
          const BoxConstraints(maxHeight: 48.0, maxWidth: ScreenSize.medium),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: ChipAtom(
                selected: selectedCategory == index,
                color: !isScreenMedium ? const Color(0xFF04283B) : null,
                onSelected: (value) {
                  setState(() {
                    selectedCategory = index;
                  });
                },
                label: category,
              ),
            );
          },
        ),
      ),
    );
  }
}
