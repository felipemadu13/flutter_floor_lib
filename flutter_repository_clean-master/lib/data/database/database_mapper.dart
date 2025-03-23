import 'package:flutter_repository_clean/domain/movie.dart';

class DatabaseMapper {
  List<Movie> toMovies(List<Movie> entities) {
    return entities.map((entity) => Movie(
      id: entity.id,
      title: entity.title,
      year: entity.year,
      imgUrl: entity.imgUrl,
      extract: entity.extract,
    )).toList();
  }

  List<Movie> toMovieDatabaseEntities(List<Movie> movies) {
    return movies.map((movie) => Movie(
      id: movie.id,
      title: movie.title,
      year: movie.year,
      imgUrl: movie.imgUrl,
      extract: movie.extract,
    )).toList();
  }
}