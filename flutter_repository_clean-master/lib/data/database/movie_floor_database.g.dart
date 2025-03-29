// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_floor_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $FloorAppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $FloorAppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $FloorAppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<FloorAppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorFloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $FloorAppDatabaseBuilderContract databaseBuilder(String name) =>
      _$FloorAppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $FloorAppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$FloorAppDatabaseBuilder(null);
}

class _$FloorAppDatabaseBuilder implements $FloorAppDatabaseBuilderContract {
  _$FloorAppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $FloorAppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $FloorAppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<FloorAppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FloorAppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FloorAppDatabase extends FloorAppDatabase {
  _$FloorAppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FloorMovieDao? _floorMovieDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `movies` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `year` INTEGER NOT NULL, `imgUrl` TEXT, `extract` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FloorMovieDao get floorMovieDao {
    return _floorMovieDaoInstance ??= _$FloorMovieDao(database, changeListener);
  }
}

class _$FloorMovieDao extends FloorMovieDao {
  _$FloorMovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieInsertionAdapter = InsertionAdapter(
            database,
            'movies',
            (Movie item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'year': item.year,
                  'imgUrl': item.imgUrl,
                  'extract': item.extract
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Movie> _movieInsertionAdapter;

  @override
  Future<List<Movie>> getAllMovies() async {
    return _queryAdapter.queryList('SELECT * FROM movies ORDER BY id ASC',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as int?,
            title: row['title'] as String,
            year: row['year'] as int,
            imgUrl: row['imgUrl'] as String?,
            extract: row['extract'] as String?));
  }

  @override
  Future<List<Movie>> getMoviesPaginated(
    int limit,
    int offset,
  ) async {
    return _queryAdapter.queryList('SELECT * FROM movies LIMIT ?1 OFFSET ?2',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as int?,
            title: row['title'] as String,
            year: row['year'] as int,
            imgUrl: row['imgUrl'] as String?,
            extract: row['extract'] as String?),
        arguments: [limit, offset]);
  }

  @override
  Future<void> deleteAllMovies() async {
    await _queryAdapter.queryNoReturn('DELETE FROM movies');
  }

  @override
  Future<Movie?> getMovieById(int id) async {
    return _queryAdapter.query('SELECT * FROM movies WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as int?,
            title: row['title'] as String,
            year: row['year'] as int,
            imgUrl: row['imgUrl'] as String?,
            extract: row['extract'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertMovie(Movie movie) async {
    await _movieInsertionAdapter.insert(movie, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertMovies(List<Movie> movies) async {
    await _movieInsertionAdapter.insertList(movies, OnConflictStrategy.replace);
  }
}
