import 'package:floor/floor.dart';
import 'package:flutter_repository_clean/domain/movie.dart';

@dao
abstract class MovieDao {
  @Query('SELECT * FROM movies')
  Future<List<Movie>> findAllMovies();

  @Query('SELECT * FROM movies WHERE id = :id')
  Stream<Movie?> findMovieById(int id);

  @insert
  Future<void> insertMovie(Movie movie);

  @update
  Future<void> updateMovie(Movie movie);

  @delete
  Future<void> deleteMovie(Movie movie);
}