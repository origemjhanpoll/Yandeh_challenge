import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandeh_challenge/app/injection.dart';
import 'package:yandeh_challenge/feature/presentation/bloc/sections_bloc.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/molecules/banner_card_molecule.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/organisms/favorite_sections_organism.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/organisms/section_organism.dart';
import 'package:yandeh_challenge/feature/presentation/widgets/styles/sizes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SectionsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = di<SectionsBloc>();
    bloc.add(const GetSectionsEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Header'),
      ),
      body: BlocBuilder<SectionsBloc, SectionsState>(
        bloc: bloc,
        buildWhen: (previous, current) =>
            current is SectionsLoading || current is SectionsLoaded,
        builder: (context, state) {
          if (state is SectionsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SectionsLoaded) {
            final sections = state.sections;

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: ScreenSize.medium),
                child: SingleChildScrollView(
                  primary: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                                      onAdd: () {},
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
