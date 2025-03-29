import 'package:flutter_repository_clean/data/database/entity/movie_database_entity.dart';
import 'package:flutter_repository_clean/data/database/entity/movie.dart';
import 'package:flutter_repository_clean/domain/film.dart';

class FloorMovieMapper {
  Movie toMovie(MovieDatabaseEntity entity) {
    return Movie(
      title: entity.title,
      year: entity.year,
      extract: entity.extract,
      imgUrl: entity.imageUrl,
    );
  }

  List<Film> toMovies(List<MovieDatabaseEntity> entities) {
    return entities.map((entity) => Film(
      title: entity.title,
      year: entity.year,
      extract: entity.extract,
      imgUrl: entity.imageUrl,
    )).toList();
  }

  MovieDatabaseEntity toFloorEntity(Movie movie) {
    return MovieDatabaseEntity(
      id: null,
      title: movie.title,
      year: movie.year,
      extract: movie.extract,
      imageUrl: movie.imgUrl,
    );
  }

  List<MovieDatabaseEntity> toFloorEntities(List<Movie> movies) {
    return movies.map((movie) => toFloorEntity(movie)).toList();
  }

  List<MovieDatabaseEntity> toMovieDatabaseEntities(List<Film> movies) {
    return movies.map((movie) {
      return MovieDatabaseEntity(
        id: null, 
        title: movie.title,
        year: movie.year,
        extract: movie.extract,
        imageUrl: movie.imgUrl,
      );
    }).toList();
  }
}