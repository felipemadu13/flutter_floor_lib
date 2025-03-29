import 'package:floor/floor.dart';
import 'package:flutter_repository_clean/data/database/entity/movie.dart';

@dao
abstract class FloorMovieDao {
  @Query('SELECT * FROM movies ORDER BY id ASC')
  Future<List<Movie>> getAllMovies();

  @Query('SELECT * FROM movies LIMIT :limit OFFSET :offset')
  Future<List<Movie>> getMoviesPaginated(int limit, int offset);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(Movie movie);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovies(List<Movie> movies);

  @Query('DELETE FROM movies')
  Future<void> deleteAllMovies();

  @Query('SELECT * FROM movies WHERE id = :id')
  Future<Movie?> getMovieById(int id);
}