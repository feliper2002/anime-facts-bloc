import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_anime_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_fact_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/external/datasources/anime_datasource_i.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/anime_bloc.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/cubit/anime_cubit.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/view/home_page.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/view/view_bloc/anime_page.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/view/view_bloc/facts_page.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/view/view_cubit/anime_page_cubit.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/view/view_cubit/facts_page_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

import 'infra/repositories/anime_repository_i.dart';

class AnimeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Uno()),
        Bind((i) => AnimeDatasourceImpl(i.get())),
        Bind((i) => AnimeRepositoryImpl(i.get())),
        Bind((i) => GetAnimeListImpl(i.get())),
        Bind((i) => GetFactListImpl(i.get())),
        Bind((i) => AnimeController(i.get(), i.get())),
        Bind((i) => AnimeControllerCubit(i.get(), i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/anime', child: (context, args) => const AnimePage()),
        ChildRoute('/fact',
            child: (context, args) => FactsPage(
                  animeName: args.data,
                )),
        ChildRoute('/anime-cubit',
            child: (context, args) => const AnimePageCubit()),
        ChildRoute('/fact-cubit',
            child: (context, args) => FactPageCubit(
                  animeName: args.data,
                )),
      ];
}
