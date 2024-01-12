import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String? theMovieDBKey = dotenv.env['TMDB_KEY'];
}
