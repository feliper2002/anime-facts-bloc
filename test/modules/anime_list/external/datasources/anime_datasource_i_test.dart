import 'package:anime_facts_bloc/modules/anime_list/external/datasources/anime_datasource_i.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/datasources/anime_datasource.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/anime_model.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/fact_model.dart';
import 'package:anime_facts_bloc/utils/json_string.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';

class UnoMock extends Mock implements Uno {}

void main() {
  late UnoMock client;
  late AnimeDataSource dataSource;

  setUpAll(() {
    client = UnoMock();
    dataSource = AnimeDatasourceImpl(client);
  });

  test('Should return an List<AnimeModel>', () async {
    when(() => client.get(any())).thenAnswer((_) async => Response(
          headers: {},
          request: Request(
              uri: Uri(),
              method: 'GET',
              headers: {},
              timeout: const Duration()),
          status: 200,
          data: animeListJSON,
        ));

    final result = await dataSource.getAnimeList();

    expect(result, isA<List<AnimeModel>>());
  });

  test('Should return an List<FactModel>', () async {
    when(() => client.get(any())).thenAnswer((_) async => Response(
          headers: {},
          request: Request(
              uri: Uri(),
              method: 'GET',
              headers: {},
              timeout: const Duration()),
          status: 200,
          data: jujutsuFactsJSON,
        ));

    final result = await dataSource.getFactList(anime: 'jujutsu_kaisen');

    expect(result, isA<List<FactModel>>());
  });
}
