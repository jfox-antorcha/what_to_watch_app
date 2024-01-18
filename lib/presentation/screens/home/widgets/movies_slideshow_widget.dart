import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:what_to_watch_app/domain/entities/movie_entity.dart';

class MoviesSlideShow extends StatelessWidget {
  final List<MovieEntity> movies;
  const MoviesSlideShow({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Swiper(
        autoplay: true,
        scale: 0.85,
        viewportFraction: 0.8,
        itemCount: movies.length,
        itemBuilder: (context, index) => _Slide(
          movie: movies[index],
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final MovieEntity movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return FadeIn(child: child);
            },
          ),
        ),
      ),
    );
  }
}
