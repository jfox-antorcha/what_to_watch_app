import 'package:what_to_watch_app/domain/entities/movie_entity.dart';

abstract class MoviesRepository {
  Future<List<MovieEntity>> getNowPlaying({int page = 1});
}
