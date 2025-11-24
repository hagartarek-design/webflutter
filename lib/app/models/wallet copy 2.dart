
class courseInfo{
final int? id;
final  String? path;
final String? name;
final bool? isUsed;
final List?section;
  courseInfo({
    this.id
    ,
  this.path
 ,this.name
,this.isUsed,
this.section
  });

  factory courseInfo.fromJson(Map<String, dynamic> json) {
  
  // print('json${json['course_info']}');
    return courseInfo(

      id: json['id'] as int?,
 path: json['path'] as String?,
 name: json['name'] as String?,
//  course_info: json['course_info'] as List?,
 section: json['section'] as List?,
 isUsed: json['isUsed'] as bool?
    );
  }
}
