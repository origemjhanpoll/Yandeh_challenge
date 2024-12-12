import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandeh_challenge/app/injection.dart';
import 'package:yandeh_challenge/features/home/presentation/bloc/sections_bloc.dart';
import 'package:yandeh_challenge/app/widgets/atoms/chip_atom.dart';
import 'package:yandeh_challenge/app/widgets/atoms/logo_atom.dart';
import 'package:yandeh_challenge/app/widgets/molecules/account_logged_molecule.dart';
import 'package:yandeh_challenge/app/widgets/molecules/banner_card_molecule.dart';
import 'package:yandeh_challenge/app/widgets/organisms/favorite_sections_organism.dart';
import 'package:yandeh_challenge/app/widgets/organisms/section_organism.dart';
import 'package:yandeh_challenge/app/widgets/styles/sizes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SectionsBloc bloc;
  late TextEditingController controller;

  List<int> productsCount = [];
  int selectedCategory = 2;
  bool hasShearch = false;
  final categories = [
    'Todas categorias',
    'Campanhas',
    'Frutas Yandeh',
    'Indústrias e marcas',
    'Pedidos',
    'Importação de pedidos'
  ];

  @override
  void initState() {
    super.initState();
    bloc = di<SectionsBloc>();
    controller = TextEditingController();
    controller.addListener(_updateSections);
    bloc.add(const GetSectionsEvent(originalSections: true));
  }

  @override
  void dispose() {
    bloc.close();
    controller.dispose();
    super.dispose();
  }

  void _updateSections() {
    setState(() {
      if (controller.text.isEmpty) {
        bloc.add(const GetSectionsEvent(originalSections: true));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isScreenMedium = MediaQuery.of(context).size.width > ScreenSize.small;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: isScreenMedium
            ? ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: ScreenSize.medium),
                child: Row(
                  children: [
                    const LogoAtom(),
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SearchBar(
                          overlayColor:
                              const WidgetStatePropertyAll(Colors.white),
                          controller: controller,
                          onSubmitted: (value) {
                            if (controller.text.isNotEmpty) {
                              bloc.add(
                                  GetSectionsEvent(argument: controller.text));
                            }
                          },
                          trailing: [
                            IconButton(
                              icon: controller.text.isNotEmpty
                                  ? const Icon(Icons.close)
                                  : const Icon(Icons.search),
                              color: Colors.red,
                              // ignore: prefer_is_empty
                              onPressed: () {
                                if (controller.text.isNotEmpty) {
                                  bloc.add(GetSectionsEvent(
                                      argument: controller.text));
                                }
                              },
                            )
                          ],
                          elevation: const WidgetStatePropertyAll(4.0),
                          hintText: 'Buscar produtos',
                          constraints: const BoxConstraints(minHeight: 40.0),
                          backgroundColor:
                              const WidgetStatePropertyAll(Colors.white),
                        ),
                      ),
                    ),
                    const Flexible(
                      child: AccountLoggedMolecule(
                        title: 'Mercadinho Maristela',
                        subtitle: '05.892.738/0001-24',
                      ),
                    ),
                    FilledButton.icon(
                      // ignore: prefer_is_empty
                      label: Text(productsCount.length > 0
                          ? productsCount.length.toString()
                          : 'Carrinho'),
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.red)),
                      icon: const Icon(Icons.shopping_cart_outlined),
                      onPressed: () {
                        setState(() {
                          productsCount.clear();
                        });
                      },
                    )
                  ],
                ),
              )
            : const AccountLoggedMolecule(
                title: 'Mercadinho Maristela',
                subtitle: '05.892.738/0001-24',
              ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: 48.0, maxWidth: ScreenSize.medium),
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
          ),
        ),
      ),
      body: BlocBuilder<SectionsBloc, SectionsState>(
        bloc: bloc,
        buildWhen: (previous, current) =>
            current is SectionsLoading ||
            current is SectionsLoaded ||
            current is SectionsError ||
            current is SectionsEmpty,
        builder: (context, state) {
          if (state is SectionsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SectionsEmpty) {
            return const Center(child: Text('Nenhum produto encontrado!'));
          } else if (state is SectionsError) {
            return Center(child: Text(state.message));
          } else if (state is SectionsLoaded) {
            final sections = state.sections;

            return SafeArea(
              bottom: false,
              child: Center(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: ScreenSize.medium),
                  child: SingleChildScrollView(
                    primary: true,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: FavoriteSectionsOrganism(
                            backgroundImage:
                                'https://images.unsplash.com/photo-1601601376204-64cfaeab4aa9?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            sections: sections,
                          ),
                        ),
                        ...sections.map((section) => section.products.isNotEmpty
                            ? Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: SectionOrganism(
                                      addedList: productsCount,
                                      onAdd: (prod) {
                                        setState(() {
                                          if (!productsCount
                                              .contains(prod.id)) {
                                            productsCount.add(prod.id);
                                          } else {
                                            productsCount.remove(prod.id);
                                          }
                                        });
                                      },
                                      section: section,
                                      color: Colors.red,
                                    ),
                                  ),
                                  if (section.section.toUpperCase() == 'FRUTAS')
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: BannerCardMolecule(
                                        onPressed: () {},
                                        image:
                                            'https://images.unsplash.com/photo-1668179456564-db429f9de8e8?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        title: 'Hortifruti Perfeito!',
                                        subtitle:
                                            'Veja opções fresquinhas para abastecer seu hortifruti.',
                                        textButtton: 'Ver mais',
                                        color: const Color(0xFF72C532),
                                      ),
                                    )
                                ],
                              )
                            : const LimitedBox()),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          return const LimitedBox();
        },
      ),
    );
  }
}
