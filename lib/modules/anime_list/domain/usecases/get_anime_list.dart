import 'package:anime_facts_bloc/modules/anime_list/domain/entities/anime.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/repositories/anime_repository.dart';

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
