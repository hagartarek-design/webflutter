
class Section {
  final int? id;
final  String? path;final String? name;
final List?course;
final List?section;
  Section({
    this.id
    ,
  this.path
    ,this.name
// this. attendence,
,this.course,this.section
  });

  factory Section.fromJson(Map<String, dynamic> json) {
  
  // print('json${json['course']}');
    return Section(

      id: json['id'] as int?,
 path: json['path'] as String?,
 name: json['name'] as String?,
 course: json['course'] as List?,
 section: json['section'] as List?
    );
  }
}
