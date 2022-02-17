import 'package:anime_facts_bloc/modules/anime_list/domain/repositories/anime_repository.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/datasources/anime_datasource.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/anime_model.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/fact_model.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeDataSource datasource;
  AnimeRepositoryImpl(this.datasource);

  @override
  Future<List<AnimeModel>> getAnimeList() async {
    final data = await datasource.getAnimeList();
    return data;
  }

  @override
  Future<List<FactModel>> getFactList({String? anime}) async {
    final data = await datasource.getFactList(anime: anime);
    return data;
  }
}
