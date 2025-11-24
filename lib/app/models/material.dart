
class Materials {
  final int? id;
final  String? grade;
final  String? cycle;


  Materials({
    this.id,
  this.grade,
  this.cycle,
// this. attendence,

  });

  factory Materials.fromJson(Map<String, dynamic> json) {
  
  
    return Materials(

      id: json['id'] as int?,
 grade: json['grade'] as String?,
//  grade: json['grade'] as String?
 cycle: json['cycle'] as String?
,

    );
  }
}
