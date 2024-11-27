import 'package:flutter/material.dart';
import 'package:yandeh_challenge/feature/domain/entities/section.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/molecules/product_card_molecule.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/molecules/section_header_molecule.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/styles/sizes.dart';

class SectionOrganism extends StatelessWidget {
  const SectionOrganism({
    super.key,
    required this.section,
    required this.color,
    this.onPressed,
  });

  final Section section;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final isScreenMedium = MediaQuery.of(context).size.width > ScreenSize.small;
    const sectionSize = 488.0;

    return SizedBox(
      height: sectionSize,
      child: Stack(
        children: [
          Container(
            height: sectionSize - (sectionSize / 5),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(isScreenMedium ? 24.0 : 16.0),
                child: SectionHeaderMolecule(
                  title: section.section,
                  description: section.description,
                  textButtton: 'Ver ${section.products.length} itens',
                  onPressed: onPressed,
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: section.products.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                      horizontal: isScreenMedium ? 24.0 : 8.0),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final product = section.products[index];

                    return ProductCardMolecule(
                      onPressed: () {},
                      image:
                          'https://s3-alpha-sig.figma.com/img/3d07/100e/c12efb8956c87335b9763b3771d7dfab?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fScalgZsV39EGcV~9WkM3722wUaZw9PdwXssBlipYgnBNIzrfK2kfkeCphgivDTho47tQTqbFSY3pmxb7ZfynBgtLBOd6JfJQZeD3HDw7uATQGUexQMjWAHN41E6qqvSxLDXiyI-TVNOQGD9UB9R4lgFExI~pxnYX4UxM1pKOO2AVgDiz2VCQ-9T-n~82EETDF2sjZ2PsdbPy0HcEXvjxCo6ZDAj5RZ9QsUb-w7Md3SYurQW5TRgCsyGldmccRhasIvM4I2vrrax3DUvpK1krbbdLVvHBVU8G5vK5Lk02RC0d7FaXyg50YIGKU1bXc0h2sphLKt2go4fBl~a8RrRbw__',
                      title: 'R\$ ${product.price} ${product.unitMessure}',
                      subtitle: product.name,
                      label: '${product.unitContent} ${product.unitMessure}',
                      caption: product.ean,
                      footerText:
                          '${product.packageQuantity} ${product.package}',
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
