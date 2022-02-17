import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/anime_bloc.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/events/anime_event.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/states/anime_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnimePage extends StatefulWidget {
  const AnimePage({Key? key}) : super(key: key);

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  @override
  void initState() {
    Modular.get<AnimeController>().add(InitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime BLoC'),
      ),
      body: BlocBuilder<AnimeController, AnimeState>(
        bloc: Modular.get<AnimeController>(),
        builder: (_, state) {
          if (state is SuccessAnimeState) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
              itemCount: state.animes.length,
              itemBuilder: (_, index) {
                final anime = state.animes[index];
                return GestureDetector(
                  onTap: () async {
                    await Modular.to.pushNamed('/fact', arguments: anime.name);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        Image.network(anime.image!),
                        Text(
                          anime.name!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
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
