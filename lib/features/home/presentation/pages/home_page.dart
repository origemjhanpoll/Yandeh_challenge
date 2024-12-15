import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandeh_challenge/app/dependencies/injection.dart';
import 'package:yandeh_challenge/features/home/presentation/bloc/sections_bloc.dart';
import 'package:yandeh_challenge/app/shared/molecules/banner_card_molecule.dart';
import 'package:yandeh_challenge/app/shared/organisms/favorite_sections_organism.dart';
import 'package:yandeh_challenge/app/shared/organisms/section_organism.dart';
import 'package:yandeh_challenge/app/shared/styles/sizes.dart';
import 'package:yandeh_challenge/features/home/presentation/widgets/app_bar_title_widget.dart';
import 'package:yandeh_challenge/features/home/presentation/widgets/tabs_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SectionsBloc bloc;
  late TextEditingController controller;

  final productsCount = ValueNotifier<List<int>>([]);
  final showCloseSearchButton = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    bloc = di<SectionsBloc>();
    bloc.add(const GetSectionsEvent(originalSections: true));
    controller = TextEditingController();
    controller.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    bloc.close();
    controller.dispose();

    super.dispose();
  }

  void _onSearchChanged() {
    if (controller.text.isNotEmpty) {
      showCloseSearchButton.value = true;
    } else {
      showCloseSearchButton.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: AppBarTitleWidget(
          controller: controller,
          valueListenableInSearchButton: showCloseSearchButton,
          onPressedShopping: () => setState(() => productsCount.value.clear()),
          onSubmittedSearch: (argument) {
            if (argument.isNotEmpty) {
              bloc.add(SearchProductsEvent(argument: argument));
            }
          },
          onPresseddSearch: (argument) =>
              bloc.add(SearchProductsEvent(argument: argument)),
          onPressedLogo: () =>
              bloc.add(const GetSectionsEvent(originalSections: true)),
          valueListenableInShopping: productsCount,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: TabsHomeWidget(),
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
            return Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                text: TextSpan(
                    text: 'Nenhum produto encontrado para "',
                    children: [
                      TextSpan(
                        text: controller.text,
                        style: theme.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text: '".',
                      ),
                    ]),
              ),
            ));
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
                        if (!showCloseSearchButton.value)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: FavoriteSectionsOrganism(
                              backgroundImage:
                                  'https://images.unsplash.com/photo-1601601376204-64cfaeab4aa9?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              favoriteList: [
                                FavoriteCardType(
                                  color: const Color(0xFF007C61),
                                  image:
                                      'https://s3-alpha-sig.figma.com/img/e81d/d19f/c679b588aa27d26228f45f0ed3d0c4ef?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AnMeSvZhknlskIb82A445AT0VhPuOXuX8bfMU7eUu9iZ4KBbKAFr1TX2L2ox1nbnhr2b1uuwIOYg57IiMmnAq21zDppes5ZCvwdy0m0-nky2ERwaxo~kIRjX-l1qZZHKji7VefQmLatyBp3U7cry4ZEKxaAilFBlnv~ywd5frE7gdAADdL7ZZhPC~TgkU0B~Ce2XxxiJ3OH09EpLcxMwYwwtzqPGBun4Kxkc0CHKzYpzHnRCaFLplF3CY2EYgWjA~-D5SmQ23wz8oV3OAYonqH4y8nO2xd94fQMwZElYtKClvLrDh2U2wSvsEro29CYx~AFoJV3hDu~izCUbbwH2ww__',
                                  title: 'Legumes',
                                ),
                                FavoriteCardType(
                                  color: const Color(0xFF7BBD1B),
                                  image:
                                      'https://s3-alpha-sig.figma.com/img/1472/7ff6/a86b3dc698c380e264d7887818de2a4f?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mopnH1GZKBmp1DEPoYpns-9pSn06tHoHuG87ElcELYTQHeb7Cra0ZRjNacEM8vQ3ymJcU2Jj1LLwA3gA-0J44MVkWahg0XLuRXvfoI~XdIUXOCAtO9qWKLzAeKbcibgcSyc4wS601Vt4I8cNJmKrMVW6Qb7khNjW7ZKMBJZD7qNeovt0M73YKfhQcMOp5GTI6wevEdq0ozgztEgExx8EhmEWDfFfRk6Wdfolz950IAuM0p8A-axQJAK2pTL~znO1QsbRENmz2xyQmtmmWWtTqRXMcMa4zyF0K6XKZ2QiCbY-0vA7gmaocBIKacKTI1BYWZKy4vTxSV23LEatcb9r8A__',
                                  title: 'Frutas',
                                ),
                                FavoriteCardType(
                                  color: const Color(0xFFEB7A7E),
                                  image:
                                      'https://s3-alpha-sig.figma.com/img/fbd8/2b22/964efc2a217e8dbd741ce61d3c1cb8a1?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OZ9pFrZwA0YoGKzdhJqvMEB-4xD-PCWhPBB6L~PmB1JiTPhXfvQP7guA6MjlOf9qMJ4lGymL-xn73lcFL3pba6Y0AjE1cDIvbiQ5SInvpCyP7S3MXy70rTuEJB~5w2XckfMNgYA0BEzhw-Hyzp7fy7SpcUcwspQttwe-nXygK54Ua~WfnqvsuE5tnL4ARunZWcFNmIJjono~Qb66tWqGlue6uXaa6nMrIM67V95~jwc0gusLWTrxqEuaHmgoJ1OxI-o8BFkMJk-mu3y3nl5L8gQQlE10nsaOvy5r0BWjkpf36sUG73wsRDOUxeKDrxCDZrhyynlmWqnZg-~kvRgJhQ__',
                                  title: 'Temperos',
                                ),
                              ],
                            ),
                          ),
                        ...sections.map((section) => section.products.isNotEmpty
                            ? Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: SectionOrganism(
                                      addedList: productsCount.value,
                                      onAdd: (prod) {
                                        setState(() {
                                          if (!productsCount.value
                                              .contains(prod.id)) {
                                            productsCount.value.add(prod.id);
                                          } else {
                                            productsCount.value.remove(prod.id);
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
