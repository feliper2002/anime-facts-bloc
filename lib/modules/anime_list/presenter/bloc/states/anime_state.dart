import 'package:anime_facts_bloc/modules/anime_list/infra/models/anime_model.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/fact_model.dart';

abstract class AnimeState {}

class InitialAnimeState extends AnimeState {}

class LoadingAnimeState extends AnimeState {
  final bool loading;

  LoadingAnimeState(this.loading);
}

class SuccessAnimeState extends AnimeState {
  final List<AnimeModel> animes;

  SuccessAnimeState(this.animes);
}

class ErrorAnimeState extends AnimeState {
  final String message;

  ErrorAnimeState(this.message);
}

class SuccessFactState extends AnimeState {
  final List<FactModel> facts;

  SuccessFactState(this.facts);
}
