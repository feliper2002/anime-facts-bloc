import 'package:anime_facts_bloc/modules/anime_list/domain/entities/anime.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/entities/fact.dart';

abstract class AnimeRepository {
  Future<List<Anime>> getAnimeList();
  Future<List<Fact>> getFactList({String? anime});
}
