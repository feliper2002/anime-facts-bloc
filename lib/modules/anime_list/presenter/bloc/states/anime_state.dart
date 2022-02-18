import 'package:anime_facts_bloc/modules/anime_list/domain/entities/anime.dart';
import 'package:anime_facts_bloc/modules/anime_list/domain/entities/fact.dart';

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

class ErrorAnimeState extends AnimeState {
  final String message;

  ErrorAnimeState(this.message);
}

class SuccessFactState extends AnimeState {
  final List<Fact> facts;

  SuccessFactState(this.facts);
}
