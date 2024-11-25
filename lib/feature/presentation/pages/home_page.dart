import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandeh_challenge/app/injection.dart';
import 'package:yandeh_challenge/feature/presentation/bloc/sections_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SectionsBloc bloc;

  @override
  void initState() {
    bloc = di<SectionsBloc>();
    bloc.add(GetSectionsEvent());
    super.initState();
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

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: sections.length,
                    itemBuilder: (context, index) {
                      final element = sections[index];
                      return Text(element.section);
                    },
                  ),
                )
              ],
            );
          }

          return const LimitedBox();
        },
      ),
    );
  }
}
