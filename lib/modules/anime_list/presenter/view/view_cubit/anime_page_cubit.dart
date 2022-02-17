import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/states/anime_state.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/cubit/anime_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnimePageCubit extends StatefulWidget {
  const AnimePageCubit({Key? key}) : super(key: key);

  @override
  State<AnimePageCubit> createState() => _AnimePageCubitState();
}

class _AnimePageCubitState extends State<AnimePageCubit> {
  @override
  void initState() {
    Modular.get<AnimeControllerCubit>().getAnimeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime Cubit'),
      ),
      body: BlocBuilder(
        bloc: Modular.get<AnimeControllerCubit>(),
        builder: (context, state) {
          if (state is SuccessAnimeState) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
              itemCount: state.animes.length,
              itemBuilder: (_, index) {
                final anime = state.animes[index];
                return GestureDetector(
                  onTap: () async {
                    await Modular.to
                        .pushNamed('/fact-cubit', arguments: anime.name);
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
