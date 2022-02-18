import 'package:anime_facts_bloc/modules/anime_list/domain/entities/anime.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/entities/fact.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/repositories/anime_repository.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/datasources/anime_datasource.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeDataSource datasource;
  AnimeRepositoryImpl(this.datasource);

  @override
  Future<List<Anime>> getAnimeList() async {
    final data = await datasource.getAnimeList();
    return data;
  }

  @override
  Future<List<Fact>> getFactList({String? anime}) async {
    final data = await datasource.getFactList(anime: anime);
    return data;
  }
}
