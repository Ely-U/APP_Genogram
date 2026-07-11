class Couple {
  final int? id;
  final int person1Id;
  final int person2Id;
  final String status;
  final String? marriageDate;
  final String? separationDate;
  final String? divorceDate;

  //Constructor 
  Couple({
    this.id,
    required this.person1Id,
    required this.person2Id,
    required this.status,
    this.marriageDate,
    this.separationDate,
    this.divorceDate,
  });

  //Object to Map
  Map<String, dynamic> toMap() {
    return{
      'id': id,
      'person1_id': person1Id,
      'person2_id': person2Id,
      'status': status,
      'marriage_date': marriageDate,
      'separation_date': separationDate,
      'divorce_date': divorceDate,
    };
  }

  //Map to Object 
  factory Couple.fromMap(Map<String, dynamic> map) {
    return Couple(
      id: map['id'],
      person1Id: map['person1_id'], 
      person2Id: map['person2_id'], 
      status: map['status'], 
      marriageDate: map['marriage_date'], 
      separationDate: map['separation_date'],
      divorceDate: map['divorce_date'], 
    );
  }
}