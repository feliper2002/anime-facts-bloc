import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_anime_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_fact_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/states/anime_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeControllerCubit extends Cubit<AnimeState> {
  AnimeControllerCubit(this._getAnimeListUsecase, this._getFactListUsecase)
      : super(InitialAnimeState());

  final GetAnimeList _getAnimeListUsecase;
  final GetFactList _getFactListUsecase;

  Future<void> getAnimeList() async {
    emit(LoadingAnimeState(true));
    try {
      final animes = await _getAnimeListUsecase();
      assert(animes.isNotEmpty);
      emit(SuccessAnimeState(animes));
    } on AssertionError catch (e) {
      emit(ErrorAnimeState("$e"));
    }
  }

  Future<void> getFactList({String? anime}) async {
    emit(LoadingAnimeState(true));
    try {
      final facts = await _getFactListUsecase(anime: anime);
      assert(anime != null && anime.isNotEmpty);
      emit(SuccessFactState(facts));
    } on AssertionError catch (e) {
      emit(ErrorAnimeState("${e.message}"));
    }
  }
}
