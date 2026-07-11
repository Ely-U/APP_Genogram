//Definir el modelo de Persona 
class Person {
  final int? id;
  final String name;
  final int? age; //El ? simboloza que no son necesarios 
  final String gender;
  final String? dateOfBirth;
  final String? dateOfDeath;
  final String? sexualOrientation;
  final String? location;
  final double? income; 
  final String? institutionalConnections;
  final String? immigrationStatus;
  final int? multipleCultures;
  final String? extraInfo;
  final String? secret;
  final int generationalLevel;

  //Constructor 
  Person({
    this.id,
    required this.name,
    this.age,
    required this.gender,
    this.dateOfBirth,
    this.dateOfDeath,
    this.sexualOrientation,
    this.location,
    this.income,
    this.institutionalConnections,
    this.immigrationStatus,
    this.multipleCultures = 0,
    this.extraInfo,
    this.secret,
    required this.generationalLevel,
  });

  //Convertir a Persona(Objeto) en un Mapa(Insert y Update a SQL)
  Map<String, dynamic> toMap() {
    return{
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'date_of_birth': dateOfBirth,
      'date_of_death': dateOfDeath,
      'sexual_orientation': sexualOrientation,
      'location': location,
      'income': income,
      'institutional_connections': institutionalConnections,
      'immigration_status': immigrationStatus,
      'multiple_cultures': multipleCultures,
      'extra_info': extraInfo,
      'secret': secret,
      'generational_level': generationalLevel,
      }; 
  }

  //Mapa a Objeto (Leer del SQLite)
  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      gender: map['gender'],
      dateOfBirth: map['date_of_birth'],
      dateOfDeath: map['date_of_death'],
      sexualOrientation: map['sexual_orientation'],
      location: map['location'],
      income: map['income'],
      institutionalConnections: map['institutional_connections'],
      immigrationStatus: map['immigration_status'],
      multipleCultures: map['multiple_cultures'],
      extraInfo: map['extra_info'],
      secret: map['secret'],
      generationalLevel: map['generational_level'],
    );
  }


}


