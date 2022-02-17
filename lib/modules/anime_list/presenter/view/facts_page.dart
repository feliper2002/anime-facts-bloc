import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/anime_bloc.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/events/anime_event.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/states/anime_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FactsPage extends StatefulWidget {
  final String? animeName;
  const FactsPage({Key? key, this.animeName}) : super(key: key);

  @override
  State<FactsPage> createState() => _FactsPageState();
}

class _FactsPageState extends State<FactsPage> {
  @override
  void initState() {
    Modular.get<AnimeController>().add(AnimeParameterEvent(widget.animeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.animeName!),
      ),
      body: BlocBuilder<AnimeController, AnimeState>(
        bloc: Modular.get<AnimeController>(),
        builder: (context, state) {
          if (state is SuccessFactState) {
            return ListView.builder(
              itemCount: state.facts.length,
              itemBuilder: (context, index) {
                final fact = state.facts[index];

                return Container(
                  margin: const EdgeInsetsDirectional.all(20),
                  child: Text(fact.fact!),
                );
              },
            );
          }
          if (state is LoadingAnimeState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
