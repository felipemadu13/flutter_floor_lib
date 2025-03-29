import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_repository_clean/data/database/dao/movie_dao.dart';
import 'package:flutter_repository_clean/data/database/entity/movie.dart';
import 'package:flutter_repository_clean/data/database/entity/movie_database_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'movie_floor_database.g.dart'; 

@Database(version: 1, entities: [Movie])
abstract class FloorAppDatabase extends FloorDatabase {
  FloorMovieDao get floorMovieDao;
}