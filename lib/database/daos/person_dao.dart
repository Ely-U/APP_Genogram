import 'package:sqflite/sqflite.dart';
import '../db_helper.dart'; //Tablas SQL
import '../models/person.dart'; //Clase 

class PersonDao {
  final DbHelper _dbHelper = DbHelper(); //Inicializa la base de datos

  //CRUD OPERATIONS 
  //Function that inserts a person into the DB-----------
  Future<int> insertPerson(Person person) async {
    final db = await _dbHelper.database; //Consigue la referencia de la DB
    //Inserta la Persona en la tabla 'Person' 
    return await db.insert(
      'Person',
      person.toMap(), //Empacamos la persona a MAP 
      conflictAlgorithm: ConflictAlgorithm.replace, 
    );
  }

  //Read (Devuelve todas las personas de la tabla)-----------
  Future<List<Person>> getAllPersons() async {
    final db = await _dbHelper.database;

    //Lista de Mapas directamente de SQLite 
    final List<Map<String, dynamic>> maps = await db.query('Person'); 

    //Convierte la lista de mapas en una lista de objetos 'Person' 
    return List.generate(maps.length, (i){
      return Person.fromMap(maps[i]);
    }); 
  }

  Future<Person?> getPerson(int id) async {
    final db = await _dbHelper.database;
    List<Map<String, dynamic>> results = await db.query(
      'Person',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty){
      return Person.fromMap(results.first);
    }
    return null; 
  }

  //Update an existing person -----------
  Future<int> updatePerson(Person person) async {
    final db = await _dbHelper.database;
    return await db.update(
      'Person',
      person.toMap(),
      where: 'id = ?',
      whereArgs: [person.id],
    );
  }

  //Delete -----------
  Future<int> deletePerson(int id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'Person',
      where: 'id = ?', //Especifica la persona 
      whereArgs: [id],
    );
  }
}