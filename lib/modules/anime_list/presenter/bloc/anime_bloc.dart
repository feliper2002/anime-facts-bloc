import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_anime_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/usecases/get_fact_list.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/events/anime_event.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/states/anime_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeController extends Bloc<AnimeEvent, AnimeState> {
  AnimeController(this.getAnimeListUsecase, this.getFactListUsecase)
      : super(InitialAnimeState()) {
    on<InitialEvent>(_getAnimeList);
    on<AnimeParameterEvent>(_getFactList);
  }

  final GetAnimeList getAnimeListUsecase;
  final GetFactList getFactListUsecase;

  Future<void> _getAnimeList(AnimeEvent event, Emitter<AnimeState> emit) async {
    emit(LoadingAnimeState(true));
    final animes = await getAnimeListUsecase.call();
    emit(SuccessAnimeState(animes));
  }

  Future<void> _getFactList(AnimeEvent event, Emitter<AnimeState> emit) async {
    emit(LoadingAnimeState(true));
    if (event is AnimeParameterEvent) {
      final facts = await getFactListUsecase.call(anime: event.anime);
      emit(SuccessFactState(facts));
    }
  }
}
