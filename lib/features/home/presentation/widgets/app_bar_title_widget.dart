import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yandeh_challenge/app/shared/atoms/logo_atom.dart';
import 'package:yandeh_challenge/app/shared/molecules/account_logged_molecule.dart';
import 'package:yandeh_challenge/app/shared/styles/sizes.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({
    super.key,
    this.onPressedShopping,
    required this.valueListenableInShopping,
    this.onSubmittedSearch,
    this.onPresseddSearch,
    this.onPressedLogo,
    required this.controller,
    required this.valueListenableInSearchButton,
  });

  final void Function()? onPressedShopping;
  final void Function()? onPressedLogo;
  final void Function(String)? onSubmittedSearch;
  final void Function(String)? onPresseddSearch;
  final TextEditingController controller;
  final ValueListenable<List<int>> valueListenableInShopping;
  final ValueListenable<bool> valueListenableInSearchButton;

  @override
  Widget build(BuildContext context) {
    final isScreenMedium =
        MediaQuery.of(context).size.width > ScreenSize.small && kIsWeb;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: ScreenSize.medium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            onTap: onPressedLogo,
            child: LogoAtom(
              asset: isScreenMedium
                  ? 'assets/svg/logo.svg'
                  : 'assets/svg/logo_icon.svg',
              width: isScreenMedium ? 160 : null,
              height: isScreenMedium ? null : 28,
            ),
          ),
          if (isScreenMedium)
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchBar(
                  overlayColor: const WidgetStatePropertyAll(Colors.white),
                  controller: controller,
                  onSubmitted: onSubmittedSearch,
                  trailing: [
                    ValueListenableBuilder<bool>(
                      valueListenable: valueListenableInSearchButton,
                      builder: (contex, showButton, __) => IconButton(
                        icon: const Icon(Icons.search),
                        color: Colors.red,
                        onPressed: showButton
                            ? () => onPresseddSearch!(controller.text)
                            : null,
                      ),
                    )
                  ],
                  elevation: const WidgetStatePropertyAll(4.0),
                  hintText: 'Buscar produtos',
                  constraints: const BoxConstraints(minHeight: 40.0),
                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                ),
              ),
            ),
          const Flexible(
            child: AccountLoggedMolecule(
              title: 'Mercadinho Maristela',
              subtitle: '05.892.738/0001-24',
            ),
          ),
          ValueListenableBuilder<List<int>>(
            valueListenable: valueListenableInShopping,
            builder: (context, products, _) => FilledButton.icon(
              // ignore: prefer_is_empty
              label: Text(products.length > 0
                  ? products.length.toString()
                  : isScreenMedium
                      ? 'Carrinho'
                      : '0'),
              style: ButtonStyle(
                  visualDensity: isScreenMedium
                      ? VisualDensity.standard
                      : VisualDensity.comfortable,
                  backgroundColor: const WidgetStatePropertyAll(Colors.red)),
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: onPressedShopping,
            ),
          )
        ],
      ),
    );
  }
}
