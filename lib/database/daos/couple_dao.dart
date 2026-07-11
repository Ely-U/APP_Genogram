import 'package:sqflite/sqflite.dart';
import '../db_helper.dart'; //Tablas SQL
import '../models/couple.dart'; //Clase 

class CoupleDao {
  final DbHelper _dbHelper = DbHelper(); //Inicializa la base de datos

  //CRUD OPERATIONS 
  //Function that inserts a couple into the DB-----------
  Future<int> insertCouple(Couple couple) async {
    final db = await _dbHelper.database; 
    //Inserta en la tabla 'couple' 
    return await db.insert(
      'Couple',
      couple.toMap(), //Empacamos a MAP
      conflictAlgorithm: ConflictAlgorithm.replace, 
    );
  }

  //Read (Devuelve todas las relaciones de la tabla)-----------
  Future<List<Couple>> getAllCouples() async {
    final db = await _dbHelper.database;

    //Lista de Mapas directamente de SQLite 
    final List<Map<String, dynamic>> maps = await db.query('Couple'); 

    //Convierte la lista de mapas en una lista de objetos 'Couple' 
    return List.generate(maps.length, (i){
      return Couple.fromMap(maps[i]);
    }); 
  }

  Future<Couple?> getCouple(int id) async {
    final db = await _dbHelper.database;
    List<Map<String, dynamic>> results = await db.query(
      'Couple',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty){
      return Couple.fromMap(results.first);
    }
    return null; 
  }

  //Update an existing couple-----------
  Future<int> updateCouple(Couple couple) async {
    final db = await _dbHelper.database;
    return await db.update(
      'Couple',
      couple.toMap(),
      where: 'id = ?',
      whereArgs: [couple.id],
    );
  }

  //Delete -----------
  Future<int> deleteCouple(int id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'Couple',
      where: 'id = ?', //Especifica la relación 
      whereArgs: [id],
    );
  }
}