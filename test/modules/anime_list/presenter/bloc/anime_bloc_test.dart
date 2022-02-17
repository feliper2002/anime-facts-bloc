import 'package:anime_facts_bloc/modules/anime_list/domain/repositories/anime_repository.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_anime_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_fact_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/anime_model.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/fact_model.dart';
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

  setUpAll(() {
    repository = AnimeRepositoryMock();
    getAnimeListUsecase = GetAnimeListImpl(repository);
    getFactListUsecase = GetFactListImpl(repository);
  });

  group('BLoC', () {
    blocTest<AnimeController, AnimeState>(
      "Should return an SuccessAnimeState",
      build: () {
        when(() => repository.getAnimeList())
            .thenAnswer((_) async => <AnimeModel>[]);

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
            .thenAnswer((_) async => <FactModel>[]);

        return AnimeController(getAnimeListUsecase, getFactListUsecase);
      },
      act: (bloc) => bloc.add(AnimeParameterEvent("jujutsu_kaisen")),
      expect: () => [
        isA<LoadingAnimeState>(),
        isA<SuccessFactState>(),
      ],
    );
  });
  group('Cubit', () {
    blocTest<AnimeControllerCubit, AnimeState>(
      "Should return an SuccessAnimeState",
      build: () {
        when(() => repository.getAnimeList())
            .thenAnswer((_) async => <AnimeModel>[]);

        return AnimeControllerCubit(getAnimeListUsecase, getFactListUsecase);
      },
      act: (bloc) => bloc.getAnimeList(),
      expect: () => [
        isA<LoadingAnimeState>(),
        isA<SuccessAnimeState>(),
      ],
    );

    blocTest<AnimeControllerCubit, AnimeState>(
      "Should return an SuccessFactState",
      build: () {
        when(() => repository.getFactList(anime: "jujutsu_kaisen"))
            .thenAnswer((_) async => <FactModel>[]);

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
        when(() => repository.getFactList())
            .thenAnswer((_) async => <FactModel>[]);

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
