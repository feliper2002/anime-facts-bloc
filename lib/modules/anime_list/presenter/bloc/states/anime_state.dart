import 'package:anime_facts_bloc/modules/anime_list/domain/models/anime.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/models/fact.dart';

abstract class AnimeState {}

class InitialAnimeState extends AnimeState {}

class LoadingAnimeState extends AnimeState {
  final bool loading;

  LoadingAnimeState(this.loading);
}

class SuccessAnimeState extends AnimeState {
  final List<Anime> animes;

  SuccessAnimeState(this.animes);
}

class ErrorAnimeState extends AnimeState {}

class SuccessFactState extends AnimeState {
  final List<Fact> facts;

  SuccessFactState(this.facts);
}
