import 'package:anime_facts_bloc/modules/anime_list/domain/models/fact.dart';
import 'package:anime_facts_bloc/modules/anime_list/repository/anime_repository.dart';

abstract class GetFactList {
  Future<List<Fact>> call({String? anime});
}

class GetFactListImpl implements GetFactList {
  final AnimeRepository repository;

  GetFactListImpl(this.repository);

  @override
  Future<List<Fact>> call({String? anime}) async {
    return await repository.getFactList(anime: anime);
  }
}
