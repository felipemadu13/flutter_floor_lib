import 'package:flutter_repository_clean/data/database/dao/movie_dao.dart';
import 'package:flutter_repository_clean/data/network/client/api_client.dart';
import 'package:flutter_repository_clean/data/network/network_mapper.dart';
import 'package:flutter_repository_clean/data/repository/movie_repository.dart';
import '../../domain/movie.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;
  final MovieDao movieDao;

  MovieRepositoryImpl(
      {required this.movieDao,
      required this.apiClient,
      required this.networkMapper});

  Future<List<Movie>> getMovies({ required int page, required int limit}) async {
    final dbEntities = await movieDao.findAllMovies(limit, (page * limit) - limit);
    if (dbEntities.isNotEmpty) {
      return dbEntities;
    }
    final networkEntity = await apiClient.getMovies(page: page, limit: limit);
    final movies = networkMapper.toMovies(networkEntity).cast<Movie>();
    await movieDao.insertMovies(movies);
    return movies;
  }
}