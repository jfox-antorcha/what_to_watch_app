import 'package:what_to_watch_app/domain/entities/movie_entity.dart';
import 'package:what_to_watch_app/domain/repositories/movies_repository.dart';

class GetNowPlaying {
  final MoviesRepository _repository;

  GetNowPlaying({
    required MoviesRepository repository,
  }) : _repository = repository;

  Future<List<MovieEntity>> call({int page = 1}) async {
    final list = await _repository.getNowPlaying(page: page);
    return list;
  }
}
