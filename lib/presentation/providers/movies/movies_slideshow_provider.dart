import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_to_watch_app/domain/entities/movie_entity.dart';
import 'package:what_to_watch_app/presentation/providers/movies/now_playing_provider.dart';

final moviesSlideShowProvider = Provider<List<MovieEntity>>((ref) {
  final movies = ref.watch(nowPlayingMoviesProvider).movies;
  if (movies.isEmpty) return [];
  return movies.sublist(0, 6);
});
