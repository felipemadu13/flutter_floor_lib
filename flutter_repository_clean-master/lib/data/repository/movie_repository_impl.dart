import 'package:flutter_repository_clean/data/database/dao/movie_dao.dart';
import 'package:flutter_repository_clean/data/database/database_mapper.dart';
import 'package:flutter_repository_clean/data/database/entity/movie.dart';
import 'package:flutter_repository_clean/data/database/entity/movie_database_entity.dart';
import 'package:flutter_repository_clean/data/network/client/api_client.dart';
import 'package:flutter_repository_clean/data/network/network_mapper.dart';
import 'package:flutter_repository_clean/data/repository/movie_repository.dart';

import '../../domain/film.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;
  final FloorMovieDao movieDao;
  final FloorMovieMapper databaseMapper;

  MovieRepositoryImpl(
      {required this.movieDao,
      required this.databaseMapper,
      required this.apiClient,
      required this.networkMapper});

  Future<List<Film>> getMovies({ required int page, required int limit}) async {

    final dbEntities = await movieDao.getMoviesPaginated(limit, (page * limit) - limit);
 
    if (dbEntities.isNotEmpty) {
      return databaseMapper.toMovies(dbEntities.cast<MovieDatabaseEntity>());
    }
   
    final networkEntity = await apiClient.getMovies(page: page, limit: limit);
    final movies = networkMapper.toMovies(networkEntity);
 
   await movieDao.insertMovies(databaseMapper.toMovieDatabaseEntities(movies.cast<Film>()).cast<Movie>());

    return movies;
  }
}