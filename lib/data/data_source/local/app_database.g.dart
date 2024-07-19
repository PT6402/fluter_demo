// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `user` (`email` TEXT, `fullname` TEXT, `accessToken` TEXT, `refreshToken` TEXT, `typeLogin` INTEGER, `typeRole` INTEGER, PRIMARY KEY (`email`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userModelInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (UserModel item) => <String, Object?>{
                  'email': item.email,
                  'fullname': item.fullname,
                  'accessToken': item.accessToken,
                  'refreshToken': item.refreshToken,
                  'typeLogin': item.typeLogin?.index,
                  'typeRole': item.typeRole?.index
                }),
        _userModelUpdateAdapter = UpdateAdapter(
            database,
            'user',
            ['email'],
            (UserModel item) => <String, Object?>{
                  'email': item.email,
                  'fullname': item.fullname,
                  'accessToken': item.accessToken,
                  'refreshToken': item.refreshToken,
                  'typeLogin': item.typeLogin?.index,
                  'typeRole': item.typeRole?.index
                }),
        _userModelDeletionAdapter = DeletionAdapter(
            database,
            'user',
            ['email'],
            (UserModel item) => <String, Object?>{
                  'email': item.email,
                  'fullname': item.fullname,
                  'accessToken': item.accessToken,
                  'refreshToken': item.refreshToken,
                  'typeLogin': item.typeLogin?.index,
                  'typeRole': item.typeRole?.index
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserModel> _userModelInsertionAdapter;

  final UpdateAdapter<UserModel> _userModelUpdateAdapter;

  final DeletionAdapter<UserModel> _userModelDeletionAdapter;

  @override
  Future<UserModel?> getUser() async {
    return _queryAdapter.query('select * from user limit 1',
        mapper: (Map<String, Object?> row) => UserModel(
            email: row['email'] as String?,
            fullname: row['fullname'] as String?,
            accessToken: row['accessToken'] as String?,
            refreshToken: row['refreshToken'] as String?,
            typeLogin: row['typeLogin'] == null
                ? null
                : TypeLogin.values[row['typeLogin'] as int],
            typeRole: row['typeRole'] == null
                ? null
                : TypeRole.values[row['typeRole'] as int]));
  }

  @override
  Future<void> addUser(UserModel userModel) async {
    await _userModelInsertionAdapter.insert(
        userModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    await _userModelUpdateAdapter.update(userModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletUser(UserModel userModel) async {
    await _userModelDeletionAdapter.delete(userModel);
  }
}
