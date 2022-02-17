import 'package:anime_facts_bloc/modules/anime_list/domain/repositories/anime_repository.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/anime_model.dart';

abstract class GetAnimeList {
  Future<List<AnimeModel>> call();
}

class GetAnimeListImpl implements GetAnimeList {
  final AnimeRepository repository;

  GetAnimeListImpl(this.repository);

  @override
  Future<List<AnimeModel>> call() async {
    return await repository.getAnimeList();
  }
}
