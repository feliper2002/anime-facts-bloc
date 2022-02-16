import 'package:anime_facts_bloc/modules/anime_list/domain/models/anime.dart';
import 'package:anime_facts_bloc/modules/anime_list/repository/anime_repository.dart';

abstract class GetAnimeList {
  Future<List<Anime>> call();
}

class GetAnimeListImpl implements GetAnimeList {
  final AnimeRepository repository;

  GetAnimeListImpl(this.repository);

  @override
  Future<List<Anime>> call() async {
    return await repository.getAnimeList();
  }
}
