import 'package:anime_facts_bloc/modules/anime_list/domain/models/anime.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/models/fact.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_anime_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_fact_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/anime_bloc.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/events/anime_event.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/states/anime_state.dart';
import 'package:anime_facts_bloc/modules/anime_list/repository/anime_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';

class AnimeRepositoryMock extends Mock implements AnimeRepository {}

class UnoMock extends Mock implements Uno {}

void main() {
  late AnimeRepositoryMock repository;

  late GetAnimeList getAnimeListUsecase;
  late GetFactList getFactListUsecase;

  setUpAll(() {
    repository = AnimeRepositoryMock();
    getAnimeListUsecase = GetAnimeListImpl(repository);
    getFactListUsecase = GetFactListImpl(repository);
  });

  blocTest<AnimeController, AnimeState>(
    "Should return an SuccessAnimeState",
    build: () {
      when(() => repository.getAnimeList()).thenAnswer((_) async => <Anime>[]);

      return AnimeController(getAnimeListUsecase, getFactListUsecase);
    },
    act: (bloc) => bloc.add(InitialEvent()),
    expect: () => [
      isA<LoadingAnimeState>(),
      isA<SuccessAnimeState>(),
    ],
  );

  blocTest<AnimeController, AnimeState>(
    "Should return an SuccessFactState",
    build: () {
      when(() => repository.getFactList(anime: "jujutsu_kaisen"))
          .thenAnswer((_) async => <Fact>[]);

      return AnimeController(getAnimeListUsecase, getFactListUsecase);
    },
    act: (bloc) => bloc.add(AnimeParameterEvent("jujutsu_kaisen")),
    expect: () => [
      isA<LoadingAnimeState>(),
      isA<SuccessFactState>(),
    ],
  );
}
