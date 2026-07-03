import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'db_tables.dart'; 

class DbHelper {

    //Crea instancia en la mamoria interna del teléfono 
    static final DbHelper _instance = DbHelper._init(); 
    factory DbHelper() => _instance; 
    DbHelper._init(); 

    static Database? _database; // Guarda la conexión abierta

    //Open a conection 
    Future<Database> get database async {
        if (_database != null) return _database!; //Si la DB está abierta la devuelve 

        _database = await _initDB('genograma_clinico.db');  //If it not exist, we initialize
        return _database!; //Return the DB to use it 
    }

    //Initialize 
    Future<Database>  _initDB(String filePath) async {
        //Search for the file were the app was permitions to save the DB 
        final dbPath = await getDatabasesPath();
        final path = join(dbPath, filePath);

        //Open the file, and creates it if it's not yet 
        return await openDatabase(path, version: 1, onCreate: _createDB, onConfigure: _onConfigure);
    }
    
    //Esta función obliga a SQLite a respetar los "FOREIGN KEY" y el "ON DELETE CASCADE"
    Future<void> _onConfigure(Database db) async {
        await db.execute('PRAGMA foreign_keys = ON');
    }

    Future<void> _createDB(Database db, int version) async {
        await db.execute(DbTables.person);
        await db.execute(DbTables.pet);
        await db.execute(DbTables.personCondition);
        await db.execute(DbTables.couple);
        await db.execute(DbTables.child);
        await db.execute(DbTables.relationship);
    }

    Future<void> close() async {
        final db = await database;
        await db.close(); 
    }

}