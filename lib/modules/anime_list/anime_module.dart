import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_anime_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_fact_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/anime_bloc.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/view/anime_page.dart';
import 'package:anime_facts_bloc/modules/anime_list/repository/anime_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

class AnimeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Uno()),
        Bind((i) => AnimeRepositoryImpl(i.get())),
        Bind((i) => GetAnimeListImpl(i.get())),
        Bind((i) => GetFactListImpl(i.get())),
        Bind((i) => AnimeController(i.get(), i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AnimePage()),
        ChildRoute('/fact', child: (context, args) => Container()),
      ];
}
