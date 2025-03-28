import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_repository_clean/data/database/dao/movie_dao.dart';
import 'package:flutter_repository_clean/domain/movie.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'movie_floor_database.g.dart';

@Database(version: 1, entities: [Movie])
abstract class MovieFloorDatabase extends FloorDatabase {
  MovieDao get movieDao;
}