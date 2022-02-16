abstract class AnimeEvent {}

class InitialEvent extends AnimeEvent {}

class AnimeParameterEvent extends AnimeEvent {
  final String? anime;

  AnimeParameterEvent(this.anime);
}
