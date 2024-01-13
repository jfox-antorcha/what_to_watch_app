import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_to_watch_app/data/datasources/network/moviedb_datasource.dart';
import 'package:what_to_watch_app/data/repositories/movies_repository_impl.dart';
import 'package:what_to_watch_app/domain/repositories/movies_repository.dart';
import 'package:what_to_watch_app/domain/usecases/movies/get_now_playing.dart';

final getNowPlayingProvider = Provider(
  (ref) => GetNowPlaying(repository: ref.read(moviesRepositoryProvider)),
);

final moviesRepositoryProvider = Provider<MoviesRepository>(
  (ref) => MoviesRepositoryImpl(datasource: ref.read(datasourceProvider)),
);

final datasourceProvider = Provider<MoviesRepository>(
  (ref) => MoviedbDatasource(),
);
