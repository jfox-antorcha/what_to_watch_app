import 'package:what_to_watch_app/core/constants/environment.dart';
import 'package:what_to_watch_app/data/datasources/network/moviedb_mapper.dart';
import 'package:what_to_watch_app/data/datasources/network/moviedb_response_model.dart';
import 'package:what_to_watch_app/data/exceptions/movies_exceptions.dart';
import 'package:what_to_watch_app/domain/entities/movie_entity.dart';
import 'package:what_to_watch_app/domain/repositories/movies_repository.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesRepository {
  final _dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3/', queryParameters: {
      'api_key': Environment.theMovieDBKey,
    }),
  );

  @override
  Future<List<MovieEntity>> getNowPlaying({int page = 1}) async {
    try {
      final Response response = await _dio.get('/movie/now_playing');
      final MovieDbResponse moviedbResponse =
          MovieDbResponse.fromJson(response.data);

      final List<MovieEntity> movies = moviedbResponse.results
          .where((moviedb) => moviedb.posterPath != 'no-poster')
          .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
          .toList();

      return movies;
    } on DioException catch (e) {
      final error = e.response?.data['status_message'];
      throw DioRequestException(error: error);
    } catch (e) {
      throw GenericMoviesException();
    }
  }
}
