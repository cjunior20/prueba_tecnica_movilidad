// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await getDatabase();

  Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'testDatabase.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute(tablePublicidadSql);
    }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
  }

  static const String tablePublicidadSql = 'CREATE TABLE CatBreeds('
      'idBreed TEXT PRIMARY KEY, '
      'nameBreed TEXT, '
      'temperamentBreed TEXT, '
      'originBreed TEXT, '
      'countryCodeBreed TEXT, '
      'descriptionBreed TEXT, '
      'lifeSpanBreed TEXT, '
      'altsNamesBreed TEXT, '
      'referenceImgBreed TEXT, '
      'weightImperialBreed TEXT, '
      'weightMetricBreed TEXT, '
      'urlImageBreed TEXT, '
      'heightImageBreed INTEGER, '
      'widthImageBreed INTEGER)';
}
