import 'package:flutter/material.dart';
import 'package:yandeh_challenge/feature/domain/entities/section.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/molecules/product_card_molecule.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/molecules/section_header_molecule.dart';

class SectionOrganism extends StatelessWidget {
  const SectionOrganism({
    super.key,
    required this.section,
    required this.color,
  });

  final Section section;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 488.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SectionHeaderMolecule(
              title: section.section,
              description: section.description,
              textButtton: 'Ver ${section.products.length} itens',
              onPressed: () {},
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: section.products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: section.products.map((element) {
                    return ProductCardMolecule(
                      price: element.price,
                      name: element.name,
                      unitContent: element.unitContent,
                      unitMessure: element.unitMeasure,
                      ean: element.ean,
                      packageQuantity: element.packageQuantity,
                      package: element.package,
                      src:
                          'https://s3-alpha-sig.figma.com/img/3d07/100e/c12efb8956c87335b9763b3771d7dfab?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fScalgZsV39EGcV~9WkM3722wUaZw9PdwXssBlipYgnBNIzrfK2kfkeCphgivDTho47tQTqbFSY3pmxb7ZfynBgtLBOd6JfJQZeD3HDw7uATQGUexQMjWAHN41E6qqvSxLDXiyI-TVNOQGD9UB9R4lgFExI~pxnYX4UxM1pKOO2AVgDiz2VCQ-9T-n~82EETDF2sjZ2PsdbPy0HcEXvjxCo6ZDAj5RZ9QsUb-w7Md3SYurQW5TRgCsyGldmccRhasIvM4I2vrrax3DUvpK1krbbdLVvHBVU8G5vK5Lk02RC0d7FaXyg50YIGKU1bXc0h2sphLKt2go4fBl~a8RrRbw__',
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
