import 'package:anime_facts_bloc/modules/anime_list/domain/repositories/anime_repository.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/datasources/anime_datasource.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/anime_model.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/fact_model.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/repositories/anime_repository_i.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnimeDatasourceMock extends Mock implements AnimeDataSource {}

void main() {
  late AnimeDatasourceMock datasource;
  late AnimeRepository repository;

  setUpAll(() {
    datasource = AnimeDatasourceMock();
    repository = AnimeRepositoryImpl(datasource);
  });

  test('Should return an List<AnimeModel>', () async {
    when(() => datasource.getAnimeList())
        .thenAnswer((_) async => <AnimeModel>[]);

    final result = await repository.getAnimeList();

    expect(result, isA<List<AnimeModel>>());
  });

  test('Should return an List<FactModel>', () async {
    when(() => datasource.getFactList(anime: "jujutsu_kaisen"))
        .thenAnswer((_) async => <FactModel>[]);

    final result = await repository.getFactList(anime: "jujutsu_kaisen");

    expect(result, isA<List<FactModel>>());
  });
}
