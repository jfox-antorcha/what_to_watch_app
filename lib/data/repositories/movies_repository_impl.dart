import 'package:what_to_watch_app/domain/entities/movie_entity.dart';
import 'package:what_to_watch_app/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesRepository _datasource;

  MoviesRepositoryImpl({
    required MoviesRepository datasource,
  }) : _datasource = datasource;

  @override
  Future<List<MovieEntity>> getNowPlaying({int page = 1}) async {
    final list = await _datasource.getNowPlaying(page: page);
    return list;
  }
}
