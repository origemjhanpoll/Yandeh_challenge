import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:yandeh_challenge/features/home/domain/entities/product.dart';
import 'package:yandeh_challenge/features/home/domain/entities/section.dart';
import 'package:yandeh_challenge/app/widgets/atoms/icon_elevation_button_atom.dart';
import 'package:yandeh_challenge/app/widgets/molecules/product_card_molecule.dart';
import 'package:yandeh_challenge/app/widgets/molecules/section_header_molecule.dart';
import 'package:yandeh_challenge/app/widgets/styles/sizes.dart';

class SectionOrganism extends StatefulWidget {
  const SectionOrganism({
    super.key,
    required this.section,
    required this.color,
    required this.onAdd,
    required this.addedList,
  });

  final Section section;
  final Color color;
  final void Function(Product) onAdd;
  final List<int> addedList;

  @override
  State<SectionOrganism> createState() => _SectionOrganismState();
}

class _SectionOrganismState extends State<SectionOrganism> {
  late ScrollController scrollController;
  int currentIndex = 0;
  final sectionSize = 488.0;
  final itemSize = 182.0;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_updateCurrentIndex);
  }

  @override
  void dispose() {
    scrollController.removeListener(_updateCurrentIndex);
    scrollController.dispose();
    super.dispose();
  }

  void _scrollToNextItem() {
    if (currentIndex < widget.section.products.length - 1) {
      currentIndex++;
      scrollController.animateTo(
        currentIndex * itemSize,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToPreviousItem() {
    if (currentIndex > 0) {
      currentIndex--;
      scrollController.animateTo(
        currentIndex * itemSize,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _updateCurrentIndex() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 100), () {
      final int firstVisibleIndex =
          (scrollController.offset / itemSize).floor();

      setState(() {
        currentIndex = firstVisibleIndex;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isScreenMedium = MediaQuery.of(context).size.width > ScreenSize.small;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: sectionSize,
            child: Stack(
              children: [
                Container(
                  height: sectionSize - (sectionSize / 5),
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(isScreenMedium ? 24.0 : 16.0),
                      child: SectionHeaderMolecule(
                        title: widget.section.section,
                        description: widget.section.description,
                        textButtton:
                            'Ver ${widget.section.products.length} itens',
                        onPressed: () {},
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: widget.section.products.length,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(
                            horizontal: isScreenMedium ? 24.0 : 8.0),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final product = widget.section.products[index];
                          return ProductCardMolecule(
                            isAdded: widget.addedList.contains(product.id),
                            onPressed: () => widget.onAdd(product),
                            image:
                                'https://s3-alpha-sig.figma.com/img/3d07/100e/c12efb8956c87335b9763b3771d7dfab?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fScalgZsV39EGcV~9WkM3722wUaZw9PdwXssBlipYgnBNIzrfK2kfkeCphgivDTho47tQTqbFSY3pmxb7ZfynBgtLBOd6JfJQZeD3HDw7uATQGUexQMjWAHN41E6qqvSxLDXiyI-TVNOQGD9UB9R4lgFExI~pxnYX4UxM1pKOO2AVgDiz2VCQ-9T-n~82EETDF2sjZ2PsdbPy0HcEXvjxCo6ZDAj5RZ9QsUb-w7Md3SYurQW5TRgCsyGldmccRhasIvM4I2vrrax3DUvpK1krbbdLVvHBVU8G5vK5Lk02RC0d7FaXyg50YIGKU1bXc0h2sphLKt2go4fBl~a8RrRbw__',
                            title:
                                'R\$ ${product.price} ${product.unitMessure}',
                            subtitle: product.name,
                            label:
                                '${product.unitContent} ${product.unitMessure}',
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
          ),
        ),
        if (isScreenMedium && kIsWeb)
          Positioned(
            right: 0,
            top: sectionSize / 2,
            child: IconElevationButtonAtom(
              icon: Icons.chevron_right,
              onPressed: _scrollToNextItem,
            ),
          ),
        if (currentIndex > 0 && isScreenMedium && kIsWeb)
          Positioned(
              left: 0,
              top: sectionSize / 2,
              child: IconElevationButtonAtom(
                icon: Icons.chevron_left,
                onPressed: _scrollToPreviousItem,
              )),
      ],
    );
  }
}
