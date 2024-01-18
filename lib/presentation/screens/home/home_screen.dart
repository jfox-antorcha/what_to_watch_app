import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_to_watch_app/core/constants/data_status.dart';
import 'package:what_to_watch_app/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:what_to_watch_app/presentation/providers/movies/now_playing_provider.dart';
import 'package:what_to_watch_app/presentation/screens/home/widgets/bottomtab_widget.dart';
import 'package:what_to_watch_app/presentation/screens/home/widgets/movies_slideshow_widget.dart';
import 'package:what_to_watch_app/presentation/widgets/appbar_widget.dart';
import 'package:what_to_watch_app/presentation/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    ref.listen(nowPlayingMoviesProvider, (previous, next) {
      if (next.status != Status.failure) return;
      showErrorSnackbar(context, next.errorMessage);
    });

    return Scaffold(
      body: switch (nowPlayingMovies.status) {
        Status.failure => CustomError(
            errorMesage: nowPlayingMovies.errorMessage,
          ),
        Status.success => const _HomeView(),
        _ => const Loading(),
      },
      bottomNavigationBar: const CustomBottomTabBar(),
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
    // final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideshowMovies = ref.watch(moviesSlideShowProvider);

    return Column(
      children: [
        const MainAppBar(),
        MoviesSlideShow(movies: slideshowMovies),
      ],
    );
  }
}
