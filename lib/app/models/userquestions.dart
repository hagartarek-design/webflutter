
class Userquestions {
  final int? id;
final String? name;
final  String? month_by_year;
final Map?lesson;
final List?assignmentsId;
final String? teacher_answer;
final String? student_answer;
final String? studentAnswerExam;
final bool? true_answer;
  Userquestions({
    this.id
    ,
 this.month_by_year
    ,this.name
// this. attendence,
,this.lesson,this.assignmentsId
,this.teacher_answer,
this.student_answer,
this.studentAnswerExam


,this.true_answer
  });

  factory Userquestions.fromJson(Map<String, dynamic> json) {
  
  print('json${json['trueAnswer']}');
    return Userquestions(

      id: json['id'] as int?,
 month_by_year: json['month_by_year'] as String?,
 name: json['name'] as String?,
 lesson: json['lesson'] as Map?,
 assignmentsId: json['assignmentsId'] as List?,
 teacher_answer: json['teacher_answer'] as String?,
 student_answer: json['student_answer'] as String?,
 true_answer:json['trueAnswer'] as bool?
   ,studentAnswerExam:json['studentAnswerExam']as String? );
  }
}
