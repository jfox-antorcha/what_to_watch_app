import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_to_watch_app/core/constants/data_status.dart';
import 'package:what_to_watch_app/presentation/providers/movies/now_playing_provider.dart';
import 'package:what_to_watch_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    // ref.read(nowPlayingMoviesProvider.notifier).fetchNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    ref.listen(nowPlayingMoviesProvider, (previous, next) {
      if (next.status != Status.failure) return;
      showErrorSnackbar(context, next.errorMessage);
    });

    return switch (nowPlayingMovies.status) {
      Status.failure => CustomError(
          errorMesage: nowPlayingMovies.errorMessage,
        ),
      Status.success => ListView.builder(
          itemCount: nowPlayingMovies.movies.length,
          itemBuilder: (context, index) {
            final item = nowPlayingMovies.movies[index];
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.releaseDate.toString()),
            );
          },
        ),
      _ => const Loading(),
    };
  }
}
