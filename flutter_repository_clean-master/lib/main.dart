import 'package:flutter/material.dart';
import 'package:flutter_repository_clean/data/database/entity/movie_floor_database.dart';
import 'package:flutter_repository_clean/data/repository/movie_repository_impl.dart';
import 'package:flutter_repository_clean/data/network/client/api_client.dart';
import 'package:flutter_repository_clean/data/network/network_mapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorMovieFloorDatabase.databaseBuilder('movies.db').build();
  final movieDao = database.movieDao;
  final apiClient = ApiClient(baseUrl: "http://10.0.2.2:3000");
  final networkMapper = NetworkMapper();

  final movieRepository = MovieRepositoryImpl(
    movieDao: movieDao,
    apiClient: apiClient,
    networkMapper: networkMapper,
  );

  runApp(MyApp(movieRepository: movieRepository));
}

class MyApp extends StatelessWidget {
  final MovieRepositoryImpl movieRepository;

  MyApp({required this.movieRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Floor Example')),
        body: Center(child: Text('Hello, World!')),
      ),
    );
  }
}