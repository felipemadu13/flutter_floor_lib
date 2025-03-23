// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_floor_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $MovieFloorDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $MovieFloorDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $MovieFloorDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<MovieFloorDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorMovieFloorDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $MovieFloorDatabaseBuilderContract databaseBuilder(String name) =>
      _$MovieFloorDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $MovieFloorDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$MovieFloorDatabaseBuilder(null);
}

class _$MovieFloorDatabaseBuilder
    implements $MovieFloorDatabaseBuilderContract {
  _$MovieFloorDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $MovieFloorDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $MovieFloorDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<MovieFloorDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MovieFloorDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MovieFloorDatabase extends MovieFloorDatabase {
  _$MovieFloorDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _movieDaoInstance;

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
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _movieInsertionAdapter = InsertionAdapter(
            database,
            'movies',
            (Movie item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'year': item.year,
                  'imgUrl': item.imgUrl,
                  'extract': item.extract
                },
            changeListener),
        _movieUpdateAdapter = UpdateAdapter(
            database,
            'movies',
            ['id'],
            (Movie item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'year': item.year,
                  'imgUrl': item.imgUrl,
                  'extract': item.extract
                },
            changeListener),
        _movieDeletionAdapter = DeletionAdapter(
            database,
            'movies',
            ['id'],
            (Movie item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'year': item.year,
                  'imgUrl': item.imgUrl,
                  'extract': item.extract
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Movie> _movieInsertionAdapter;

  final UpdateAdapter<Movie> _movieUpdateAdapter;

  final DeletionAdapter<Movie> _movieDeletionAdapter;

  @override
  Future<List<Movie>> findAllMovies() async {
    return _queryAdapter.queryList('SELECT * FROM movies',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as int?,
            title: row['title'] as String,
            year: row['year'] as int,
            imgUrl: row['imgUrl'] as String?,
            extract: row['extract'] as String?));
  }

  @override
  Stream<Movie?> findMovieById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM movies WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as int?,
            title: row['title'] as String,
            year: row['year'] as int,
            imgUrl: row['imgUrl'] as String?,
            extract: row['extract'] as String?),
        arguments: [id],
        queryableName: 'movies',
        isView: false);
  }

  @override
  Future<void> insertMovie(Movie movie) async {
    await _movieInsertionAdapter.insert(movie, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMovie(Movie movie) async {
    await _movieUpdateAdapter.update(movie, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMovie(Movie movie) async {
    await _movieDeletionAdapter.delete(movie);
  }
}
