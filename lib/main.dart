import 'package:flutter/material.dart';
import 'database/models/person.dart';
import 'database/models/couple.dart';
import 'database/daos/person_dao.dart';
import 'database/daos/couple_dao.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final personDao = PersonDao();
  final coupleDao = CoupleDao(); 

  final persona1 =Person(
    name: 'James Potter',
    age: 22,
    gender: 'M',
    generationalLevel: 2,
  ); 

  final persona2 =Person(
    name: 'Lily Evans',
    age: 21,
    gender: 'F',
    generationalLevel: 2,
  );

  debugPrint('Guardando datos'); 
  int idJames = await personDao.insertPerson(persona1);
  int idLily= await personDao.insertPerson(persona2);
  debugPrint('Personas guardadas'); 

  final relacion = Couple(
    person1Id: idJames,
    person2Id: idLily,
    status: 'Marriage', 
  ); 

  int idCouple = await coupleDao.insertCouple(relacion);
  debugPrint('Relación guardada'); 

  List<Person> personasGuardadas = await personDao.getAllPersons();
  for (var p in personasGuardadas) {
    debugPrint('   -> ${p.name}, Edad: ${p.age}, Género: ${p.gender}');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Prueba de SQLite')),
        body: const Center(
          child: Text('Revisa tu Consola de Depuración (Debug Console) 👀'),
        ),
      ),
    );
  }
}


