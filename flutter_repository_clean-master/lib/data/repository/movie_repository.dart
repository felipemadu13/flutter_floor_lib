import 'package:flutter_repository_clean/data/database/entity/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies({ required int page, required int limit});
}