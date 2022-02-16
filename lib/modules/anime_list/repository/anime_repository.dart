import 'package:anime_facts_bloc/modules/anime_list/domain/models/anime.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/models/fact.dart';
import 'package:uno/uno.dart';

const url = "https://anime-facts-rest-api.herokuapp.com/api/v1";

abstract class AnimeRepository {
  Future<List<Anime>> getAnimeList();
  Future<List<Fact>> getFactList({String? anime});
}

class AnimeRepositoryImpl implements AnimeRepository {
  final Uno client;

  AnimeRepositoryImpl(this.client);

  @override
  Future<List<Anime>> getAnimeList() async {
    final response = await client.get(url);

    try {
      final responseData = response.data as Map;
      final data = responseData['data'] as List;

      final animes = <Anime>[];

      for (var anime in data) {
        final animeResponse = Anime.fromMap(anime);
        animes.add(animeResponse);
        // print("Adicionou ${animeResponse.name}");
      }
      return animes;
    } on UnoError catch (e) {
      throw e.message;
    } catch (e) {
      throw "$e";
    }
  }

  @override
  Future<List<Fact>> getFactList({String? anime}) async {
    final response = await client.get("$url/$anime");

    try {
      final responseData = response.data as Map;
      final data = responseData['data'] as List;

      final facts = <Fact>[];

      for (var fact in data) {
        final factResponse = Fact.fromMap(fact);
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
