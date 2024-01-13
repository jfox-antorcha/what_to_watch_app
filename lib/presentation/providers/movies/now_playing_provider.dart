import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_to_watch_app/core/constants/data_status.dart';
import 'package:what_to_watch_app/data/exceptions/movies_exceptions.dart';
import 'package:what_to_watch_app/domain/entities/movie_entity.dart';
import 'package:what_to_watch_app/domain/usecases/movies/get_now_playing.dart';
import 'package:what_to_watch_app/presentation/providers/app_providers.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<NowPlayingNotifier, NowPlayingState>(
  (ref) => NowPlayingNotifier(
    getNowPlaying: ref.read(getNowPlayingProvider),
  ),
);

class NowPlayingNotifier extends StateNotifier<NowPlayingState> {
  final GetNowPlaying _getNowPlaying;
  NowPlayingNotifier({
    required GetNowPlaying getNowPlaying,
  })  : _getNowPlaying = getNowPlaying,
        super(const NowPlayingState()) {
    fetchNextPage();
  }

  Future<void> fetchNextPage() async {
    if (state.hasReachedEnd) return;
    state = state.copyWith(status: Status.loading);
    try {
      final fetchedMovies = await _getNowPlaying(page: state.currentPage);
      state = state.copyWith(
        movies: List.of(state.movies)..addAll(fetchedMovies),
        status: Status.success,
        hasReachedEnd: fetchedMovies.isEmpty,
        currentPage: state.currentPage + 1,
      );
    } on DioRequestException catch (e) {
      state = state.copyWith(
        status: Status.failure,
        errorMessage: e.error,
      );
    } on GenericMoviesException {
      state = state.copyWith(
        status: Status.failure,
        errorMessage: 'An error occurred!',
      );
    } catch (e) {
      state = state.copyWith(
        status: Status.failure,
        errorMessage: e.toString(),
      );
    }
  }
}

class NowPlayingState extends Equatable {
  const NowPlayingState({
    this.movies = const [],
    this.status = Status.initial,
    this.hasReachedEnd = false,
    this.currentPage = 1,
    this.errorMessage = '',
  });

  final List<MovieEntity> movies;
  final Status status;
  final bool hasReachedEnd;
  final int currentPage;
  final String errorMessage;

  NowPlayingState copyWith({
    List<MovieEntity>? movies,
    Status? status,
    bool? hasReachedEnd,
    int? currentPage,
    String? errorMessage,
  }) =>
      NowPlayingState(
        movies: movies ?? this.movies,
        status: status ?? this.status,
        hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
        currentPage: currentPage ?? this.currentPage,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        movies,
        status,
        hasReachedEnd,
        currentPage,
        errorMessage,
      ];
}
