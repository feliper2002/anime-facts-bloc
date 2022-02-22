import 'package:anime_facts_bloc/modules/anime_list/domain/entities/anime.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/entities/fact.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/repositories/anime_repository.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_anime_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_fact_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/anime_bloc.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/events/anime_event.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/states/anime_state.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/cubit/anime_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnimeRepositoryMock extends Mock implements AnimeRepository {}

void main() {
  late AnimeRepositoryMock repository;

  late GetAnimeList getAnimeListUsecase;
  late GetFactList getFactListUsecase;
  late List<Anime> fakeAnimeListEmpty;
  late List<Anime> fakeAnimeList;

  setUpAll(() {
    repository = AnimeRepositoryMock();
    getAnimeListUsecase = GetAnimeListImpl(repository);
    getFactListUsecase = GetFactListImpl(repository);
    fakeAnimeListEmpty = <Anime>[];
    fakeAnimeList = <Anime>[Anime(), Anime(), Anime()];
  });

  group('BLoC', () {
    blocTest<AnimeController, AnimeState>(
      "Should return an SuccessAnimeState : getAnimeList()",
      build: () {
        when(() => repository.getAnimeList())
            .thenAnswer((_) async => fakeAnimeList);

        return AnimeController(getAnimeListUsecase, getFactListUsecase);
      },
      act: (bloc) => bloc.add(InitialEvent()),
      expect: () => [
        isA<LoadingAnimeState>(),
        isA<SuccessAnimeState>(),
      ],
    );

    blocTest<AnimeController, AnimeState>(
      "Should return an ErrorAnimeState if anime list is empty : getAnimeList()",
      build: () {
        when(() => repository.getAnimeList())
            .thenAnswer((_) async => fakeAnimeListEmpty);

        return AnimeController(getAnimeListUsecase, getFactListUsecase);
      },
      act: (bloc) => bloc.add(InitialEvent()),
      expect: () => [
        isA<LoadingAnimeState>(),
        isA<ErrorAnimeState>(),
      ],
    );

    blocTest<AnimeController, AnimeState>(
      "Should return an SuccessAnimeState : getAnimeList()",
      build: () {
        when(() => repository.getAnimeList())
            .thenAnswer((_) async => fakeAnimeList);

        return AnimeController(getAnimeListUsecase, getFactListUsecase);
      },
      act: (bloc) => bloc.add(InitialEvent()),
      expect: () => [
        isA<LoadingAnimeState>(),
        isA<SuccessAnimeState>(),
      ],
    );

    blocTest<AnimeController, AnimeState>(
      "Should return an SuccessFactState : getFactList()",
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

    blocTest<AnimeController, AnimeState>(
      "Should return an ErrorAnimeState if anime is empty : getFactList()",
      build: () {
        when(() => repository.getFactList()).thenAnswer((_) async => <Fact>[]);

        return AnimeController(getAnimeListUsecase, getFactListUsecase);
      },
      act: (bloc) => bloc.add(AnimeParameterEvent("")),
      expect: () => [
        isA<LoadingAnimeState>(),
        isA<ErrorAnimeState>(),
      ],
    );
  });
  group('Cubit', () {
    blocTest<AnimeControllerCubit, AnimeState>(
      "Should return an SuccessAnimeState : getAnimeList()",
      build: () {
        when(() => repository.getAnimeList())
            .thenAnswer((_) async => fakeAnimeList);

        return AnimeControllerCubit(getAnimeListUsecase, getFactListUsecase);
      },
      act: (bloc) => bloc.getAnimeList(),
      expect: () => [
        isA<LoadingAnimeState>(),
        isA<SuccessAnimeState>(),
      ],
    );
    blocTest<AnimeControllerCubit, AnimeState>(
      "Should return an ErrorAnimeState if anime list is empty : getAnimeList()",
      build: () {
        when(() => repository.getAnimeList())
            .thenAnswer((_) async => fakeAnimeListEmpty);

        return AnimeControllerCubit(getAnimeListUsecase, getFactListUsecase);
      },
      act: (bloc) => bloc.getAnimeList(),
      expect: () => [
        isA<LoadingAnimeState>(),
        isA<ErrorAnimeState>(),
      ],
    );

    blocTest<AnimeControllerCubit, AnimeState>(
      "Should return an SuccessFactState : getFactList()",
      build: () {
        when(() => repository.getFactList(anime: "jujutsu_kaisen"))
            .thenAnswer((_) async => <Fact>[]);

        return AnimeControllerCubit(getAnimeListUsecase, getFactListUsecase);
      },
      act: (bloc) => bloc.getFactList(anime: "jujutsu_kaisen"),
      expect: () => [
        isA<LoadingAnimeState>(),
        isA<SuccessFactState>(),
      ],
    );
    blocTest<AnimeControllerCubit, AnimeState>(
      "Should return an ErrorAnimeState if anime name is empty",
      build: () {
        when(() => repository.getFactList()).thenAnswer((_) async => <Fact>[]);

        return AnimeControllerCubit(getAnimeListUsecase, getFactListUsecase);
      },
      act: (bloc) => bloc.getFactList(),
      expect: () => [
        isA<LoadingAnimeState>(),
        isA<ErrorAnimeState>(),
      ],
    );
  });
}
