class DbTables {
//Table Persons 
static const String person = '''
  CREATE TABLE Person (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT NOT NULL, 
    date_of_birth TEXT,
    date_of_death TEXT,
    sexual_orientation TEXT,
    location TEXT,
    income REAL, 
    institutional_connections TEXT,
    immigration_status TEXT,
    multiple_cultures INTEGER DEFAULT 0, -- 0 es Falso, 1 es Verdadero
    extra_info TEXT, 
    secret TEXT, 
    generational_level INTEGER NOT NULL CHECK (generational_level BETWEEN 1 AND 3)
  )
''';

//Pet
static const String pet = '''
  CREATE TABLE Pet (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    owner_id INTEGER NOT NULL, --to know who is the owner 
    name TEXT NOT NULL,
    age INTEGER,
    date_of_birth TEXT,
    date_of_death TEXT,
    location TEXT,
    FOREIGN KEY (owner_id) REFERENCES Person (id) ON DELETE CASCADE
  )
''';

//Addictions and disorders
static const String personCondition = '''
  CREATE TABLE Person_Condition (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER NOT NULL, --Apunta a la TABLA PERSON 
    category TEXT NOT NULL, --Ej: Suspected alcohol or drug abuse, Alcohol or drug abuse, etc. 
    
    -- Es una nota junto al símbolo, SOLO esta disponible con 'Psychological or physical problem' o 'Alcohol or Drug Abuse' 
    operating_patterns TEXT, --Ej: Patrones médicos, emocionales, de comportamiento, etc.
    FOREIGN KEY (person_id) REFERENCES Person (id) ON DELETE CASCADE
  )
''';

//Romantic relationships 
static const String couple = '''
  CREATE TABLE Couple (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person1_id INTEGER NOT NULL,  --necesitas al menos a 2 personas 
    person2_id INTEGER NOT NULL,
    status TEXT NOT NULL, --El estatus de la pareja: marriage,Secret Affair,Divorce,etc.  
    marriage_date TEXT, --fecha de inicio de la relación
    separation_date TEXT, --fecha de la separación 
    divorce_date TEXT, --fecha de divorcio 
    FOREIGN KEY (person1_id) REFERENCES Person (id) ON DELETE CASCADE,
    FOREIGN KEY (person2_id) REFERENCES Person (id) ON DELETE CASCADE
  )
''';

//Children of a couple 
static const String child= '''
  CREATE TABLE Child (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    child_id INTEGER NOT NULL,    --Apunta a la TABLA PERSON (lo mantiene como una persona independiente de su estatus 'hijo')
    couple_id INTEGER NOT NULL,
    birth_order INTEGER NOT NULL, --1 para el mayor, 2 para el de en medio, etc.
    FOREIGN KEY (couple_id) REFERENCES Couple (id) ON DELETE CASCADE,
    FOREIGN KEY (child_id) REFERENCES Person (id) ON DELETE CASCADE
  )
''';

//Relationships 
static const String relationship = '''
  CREATE TABLE Relationship (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person1_id INTEGER NOT NULL,
    person2_id INTEGER NOT NULL,
    type TEXT NOT NULL, --Ej: Connected, close, fused, distant, etc. 
    FOREIGN KEY (person1_id) REFERENCES Person (id) ON DELETE CASCADE,
    FOREIGN KEY (person2_id) REFERENCES Person (id) ON DELETE CASCADE
  )
''';
}



