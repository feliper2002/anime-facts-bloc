import 'package:anime_facts_bloc/modules/anime_list/domain/repositories/anime_repository.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_anime_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/anime_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnimeRepositoryMock extends Mock implements AnimeRepository {}

void main() {
  late AnimeRepositoryMock repository;
  late GetAnimeList getAnimeList;

  setUpAll(() {
    repository = AnimeRepositoryMock();
    getAnimeList = GetAnimeListImpl(repository);
  });

  test('Should return an List<AnimeModel>', () async {
    when(() => repository.getAnimeList())
        .thenAnswer((_) async => <AnimeModel>[]);

    final result = await getAnimeList();

    expect(result, isA<List<AnimeModel>>());
  });
}
