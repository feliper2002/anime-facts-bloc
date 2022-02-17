import 'package:anime_facts_bloc/modules/anime_list/infra/datasources/anime_datasource.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/fact_model.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/anime_model.dart';
import 'package:uno/uno.dart';

const url = "https://anime-facts-rest-api.herokuapp.com/api/v1";

class AnimeDatasourceImpl implements AnimeDataSource {
  final Uno client;

  AnimeDatasourceImpl(this.client);

  @override
  Future<List<AnimeModel>> getAnimeList() async {
    final response = await client.get(url);

    try {
      final responseData = response.data as Map;
      final data = responseData['data'] as List;

      final animes = <AnimeModel>[];

      for (var anime in data) {
        final animeResponse = AnimeModel.fromMap(anime);
        animes.add(animeResponse);
      }
      return animes;
    } on UnoError catch (e) {
      throw e.message;
    } catch (e) {
      throw "$e";
    }
  }

  @override
  Future<List<FactModel>> getFactList({String? anime}) async {
    final response = await client.get("$url/$anime");

    try {
      final responseData = response.data as Map;
      final data = responseData['data'] as List;

      final facts = <FactModel>[];

      for (var fact in data) {
        final factResponse = FactModel.fromMap(fact);
        facts.add(factResponse);
      }
      return facts;
    } on UnoError catch (e) {
      throw e.message;
    } catch (e) {
      throw "$e";
    }
  }
}
