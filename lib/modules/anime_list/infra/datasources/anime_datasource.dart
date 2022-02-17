import 'package:anime_facts_bloc/modules/anime_list/infra/models/anime_model.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/fact_model.dart';

abstract class AnimeDataSource {
  Future<List<AnimeModel>> getAnimeList();
  Future<List<FactModel>> getFactList({String? anime});
}
