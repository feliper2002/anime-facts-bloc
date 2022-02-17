import 'package:anime_facts_bloc/modules/anime_list/domain/repositories/anime_repository.dart';
import 'package:anime_facts_bloc/modules/anime_list/infra/models/fact_model.dart';

abstract class GetFactList {
  Future<List<FactModel>> call({String? anime});
}

class GetFactListImpl implements GetFactList {
  final AnimeRepository repository;

  GetFactListImpl(this.repository);

  @override
  Future<List<FactModel>> call({String? anime}) async {
    return await repository.getFactList(anime: anime);
  }
}
