import 'package:anime_facts_bloc/modules/anime_list/domain/repositories/anime_repository.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_fact_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/fact_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnimeRepositoryMock extends Mock implements AnimeRepository {}

void main() {
  late AnimeRepositoryMock repository;
  late GetFactList getFactList;

  setUpAll(() {
    repository = AnimeRepositoryMock();
    getFactList = GetFactListImpl(repository);
  });

  test('Should return an List<FactModel>', () async {
    when(() => repository.getFactList(anime: "jujutsu_kaisen"))
        .thenAnswer((_) async => <FactModel>[]);

    final result = await getFactList(anime: "jujutsu_kaisen");

    expect(result, isA<List<FactModel>>());
  });
}
