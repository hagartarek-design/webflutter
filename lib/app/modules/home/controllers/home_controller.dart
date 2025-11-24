import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:my_app/Applinks.dart';
import 'package:my_app/app/models/attachment%20copy.dart';
import 'package:my_app/app/models/attachment.dart';
import 'package:my_app/app/models/cart.dart';
import 'package:my_app/app/models/userquestions.dart';
import 'package:my_app/app/models/wallet%20copy%202.dart';
import 'package:my_app/app/models/wallet%20copy%203.dart';
import 'package:my_app/app/models/wallet%20copy%205.dart';
import 'package:my_app/app/models/wallet%20copy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/videofullscreen.dart';
import 'package:my_app/app/modules/home/views/wallet.dart';
import 'package:my_app/app/modules/home/views/walletMobile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

import '../../../models/material.dart';
import '../../../models/wallet copy 4.dart';
import '../../../models/wallet.dart';
import '../views/homeafterlogin.dart';

class HomeController extends GetxController {
  
 void seekBy(Duration offset) {
    final current =  controllervideo !.value.position;
    controllervideo!.seekTo(current + offset);
  }
  
 void seekBy2(Duration offset) {
    final current =  controllervideo2 !.value.position;
    controllervideo2!.seekTo(current + offset);
  }
  
 getToken()async{
  try {
    var prefs=await SharedPreferences.getInstance();
    prefs.getString('token'); 
  } catch (e) {
    // print(e);
  }
}
final ScrollController scrollController = ScrollController();

  // @override
  // void dispose() {
  //   super.dispose();
  // }
 VideoPlayerController ?controllervideo;
  initializePlayer(String id)async {

   
  controllervideo = VideoPlayerController.network(
    'http://localhost:3000/courses/play/${id}',
    
  )..initialize().then((_) {
      controllervideo!.play();
    });
}
 VideoPlayerController ?controllervideo2;
  initializePlayer2(String id)async {
  //  final token=await getToken();
   controllervideo2 = VideoPlayerController.network(
  'http://localhost:3000/courses/playy/${id}',
  // httpHeaders:{  'Authorization': 'Bearer $token',}   ,
  )..initialize().then((_) {
      controllervideo2!.play();
    });
}

Map<String, dynamic>? profileData;

  final String baseUrl = "http://localhost:3000";

  Future<Map<String, dynamic>> getProfile(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/students/profile"),
      headers: {
        "Authorization": "Bearer $token", 
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load profile");
    }
  }
  Map<String, dynamic>? profile;

  // final String baseUrl = "http://localhost:3000"; 

  Future<Map<String, dynamic>> getmycourses(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/students/mycourses/user"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load profile");
    }
  }
 void fetchProfile() async {
    try {
        final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('token');
      final data = await getProfile(token!);
      // setState(() {
        profileData = data;
        // isLoading = false;
      // });
  //  print('profile${profileData}');
    } catch (e) {
      // setState(() {
        // isLoading = false;
      // });
      // print("Error: $e");
    }
  }
  
 void fetchmycourses() async {
    try {
        final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('token');
      final data = await getmycourses(token!);
      // setState(() {
        profile = data;
        // isLoading = false;
      // });
  //  print('profile${profile}');
    } catch (e) {
      // setState(() {
        // isLoading = false;
      // });
      // print("Error: $e");
    }
  }
// Future <void> studentProfile(){
// final 

// }
Future<void> signInWithFacebook() async {
  final LoginResult result = await FacebookAuth.instance.login();

  if (result.status == LoginStatus.success) {
    final AccessToken accessToken = result.accessToken!;
    final OAuthCredential facebookAuthCredential =
       FacebookAuthProvider.credential(accessToken.tokenString);


    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    // print("User: ${userCredential.user}");
  } else {
    // print("Facebook login failed: ${result.message}");
  }
}
  final ValueNotifier<double> scrollPosition = ValueNotifier<double>(0.0);
// ScrollController scrollController=ScrollController();
 @override
  void dispose() {
    scrollController.dispose();
    scrollPosition.dispose();
    super.dispose();
    scrollController.dispose();

    controllervideo!.dispose();
    controllervideo2!.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
  }

Student student=Student();
  Future<void> fetchstudent() async {
  try {
    final Uri uri = Uri.http('localhost:3000', '/student-course');

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      final Map<String, dynamic> courseData = jsonResponse;
      student = Student.fromJson(courseData);

      // sumExamAss = jsonResponse['sumExamAss'].toString();

      update();
    } else {
      print('Failed to fetch questions: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching questions: $e');
  }
}
  final count = 0.obs;
 String ?sumExamAss;
  @override
  int totalSeconds = 2 * 60;
  void onInit() {

unusedattachments() ;
fetchmaterial();fetchCart();
fetchSAllCourses();usedattachments();

 final allSections = <dynamic>[];
  for (var course in course_info) {
    if (course.section != null && course.section is List) {
      allSections.addAll(course.section as List);
    }
  }

  preloadEnrollments(allSections);

    fetchSections();
    fetchUserQuestion(id:1 , );
    super.onInit();fetchProfile();
    attachments();fetchmycourses();
       on(int lessonId,int currentIndex){ final imageUrl =
        'http://localhost:3000/pdf/lesson/${lessonId}/image/$currentIndex'; 
   }
  
    // fetchcourseinfo();
// sumExamAss;
// fetchcourseinfo();
fetch();
    fetchQuestions();
    // initializePlayer();
     SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
    scrollController.addListener(() {
      final maxScroll = scrollController.position.maxScrollExtent;
      final current = scrollController.position.pixels;
      scrollPosition.value = maxScroll == 0 ? 0 : current / maxScroll;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

// Future<void> uploadInfo() async {
//   try {
//   final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');

//     var body = json.encode({
//     'email': emailController.text,
//     'fullname':firstnamecontroller.text,
//     'phone':phonecontroller.text});
//     var url = '${Applinks.baseurl}/users/updateInfo';

//     final response = await http.patch(
//       Uri.parse(url),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: body,
//     );

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       print('File added successfully: ${response.body}');
//     } else {
//       print('Failed to add file: ${response.statusCode} - ${response.body}');
//     }
//   } catch (e) {
//     print('Error adding file: $e');
//   }
// }


  // void answerQuestions({required int questionId, required String studentAnswer}) {
  //   final index = userquestions.indexWhere((q) => q.id == questionId);
  //   if (index != -1) {
  //     userquestions[index] = Userquestions (
  //       id: userquestions[index].id,
  //       name: userquestions[index].name,
  //       teacher_answer: userquestions[index].teacher_answer,
  //       student_answer: studentAnswer,
  //     );
  //   }
  // }
  Future<Map<String, dynamic>> answerQuestion({
     int? questionId,
     String ?studentAnswer,
    
  }) async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('http://localhost:3000/userquestion?id=$questionId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'student_answer': studentAnswer,
        }),
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 404) {
        throw Exception('Question not found');
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
      TextEditingController text1=TextEditingController();
    TextEditingController text2=TextEditingController();

  Future<Map<String, dynamic>> answerQuestionExam({
     int? questionId,
     String ?studentAnswerExam,

  }) async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('http://localhost:3000/userquestion/exams/e?id=$questionId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'studentAnswerExam': studentAnswerExam ,

        }),
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 404) {
        throw Exception('Question not found');
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
  Future<Map<String, dynamic>> buyattachments({
     int? attachmentId,
    //  String ?studentAnswer,
    
  }) async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('http://localhost:3000/code/buy/buySheet'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'attachmentId': attachmentId,
        }),
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 404) {
        throw Exception('Question not found');
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
    //   TextEditingController text1=TextEditingController();
    // TextEditingController text2=TextEditingController();

  // Future<Map<String, dynamic>> answerQuestionExam({
  //    int? questionId,
  //    String ?studentAnswerExam,

  // }) async {
  //   try {
  //      final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token');
  //     final response = await http.patch(
  //       Uri.parse('http://localhost:3000/userquestion/exams/e?id=$questionId'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: json.encode({
  //         'studentAnswerExam': studentAnswerExam ,

  //       }),
  //     );
  //     //   final data = jsonDecode(response.body);
  //     // final prefs = await SharedPreferences.getInstance();

  //     if (response.statusCode == 200||response.statusCode == 201) {
  //       update();
  //       return json.decode(response.body);
  //     } else if (response.statusCode == 401) {
  //       throw Exception('Unauthorized - Please login again');
  //     } else if (response.statusCode == 404) {
  //       throw Exception('Question not found');
  //     } else {
  //       throw Exception('Failed to submit answer: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Network error: $e');
  //   }
  // }
  
  // Future<Map<String, dynamic>> answerQuestion({
  //   required int questionId,
  //   required String studentAnswer,
  // }) async {
  //   try {
  //      final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token');
  //     final response = await http.patch(
  //       Uri.parse('http://localhost:3000/userquestion?id=$questionId'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: json.encode({
  //         'student_answer': studentAnswer,
  //       }),
  //     );
  //     //   final data = jsonDecode(response.body);
  //     // final prefs = await SharedPreferences.getInstance();

  //     if (response.statusCode == 200||response.statusCode == 201) {
  //       update();
  //       return json.decode(response.body);
  //     } else if (response.statusCode == 401) {
  //       throw Exception('Unauthorized - Please login again');
  //     } else if (response.statusCode == 404) {
  //       throw Exception('Question not found');
  //     } else {
  //       throw Exception('Failed to submit answer: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Network error: $e');
  //   }
  // }
 Future getinfo ()async{

  try {
     final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response =await http.get(Uri.parse('http://localhost:3000/attachments'
    )
    , headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
    );
    if(response.statusCode==201||response.statusCode==200){
      
    }
  } catch (e) {
    
  }
 }

Future purchaseCourse({required int courseId})async{
  final url='http://localhost:3000/cart/complete-course-purchase';
final  prefs=await SharedPreferences.getInstance();
final token=prefs.getString('token');
final response=await http.post(Uri.parse(url),body:{'courseId':courseId} ,
headers:{    'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',});
if(response.statusCode==200&&response.statusCode==201){
  print(response.statusCode);
  return response.body;
}
else{print(response.statusCode);}
}


  TextEditingController code=TextEditingController();
  Future<Map<String, dynamic>> purchasecourse({
    required int courseId,

  }) async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('http://localhost:3000/courses/pay-with-code/charge?courseId=$courseId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'code': code.text,
        }),
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 404) {
        throw Exception('Question not found');
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
  TextEditingController chargeCode=TextEditingController();
  Future<Map<String, dynamic>> chargewallet() async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('http://localhost:3000/courses/update/charge'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'code': chargeCode.text,
        }),
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 404) {
        throw Exception('Question not found');
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
  TextEditingController codebywallet=TextEditingController();
  Future<Map<String, dynamic>> purchaseSection({
    required String sectionId,

  }) async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('http://localhost:3000/sections/pay-with-code/charge?sectionId=$sectionId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'code': codebywallet.text,
        }),
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (response.statusCode == 404) {
        throw Exception('Question not found');
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
  
  TextEditingController rechargeCode=TextEditingController();
  Future charge({
    required int amount,required BuildContext context
    // required String rechargeCode,
  }) async {
        final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('http://localhost:3000/code/recharge'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'rechargeCode': rechargeCode.text,
        
        'amount':amount
        }),
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

        var data =json.decode(response.body);
      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return walletMobile();
        }));
        return json.decode(response.body);
     } 
      else if (response.statusCode == 401) {
          // print('error');
        var data=json.decode(response.body);
       ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('${data['message']}'),
    duration: Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(20),
  ),
); 
      } 
      else if (response.statusCode == 409) {
          ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('${data['message']}'),
    duration: Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(20),
  ),
); 
      } 
      else if (response.statusCode == 404) {
      } else {
        throw Exception('Failed to submit answer: ${response.statusCode}');
      }
      throw Exception('');
    } catch (e) {
    }
  // throw Exception('Network error: $e');
  }
Future<void> addattachtocart({required  int id})async{
try{
  final prefs=await SharedPreferences.getInstance();
final token=prefs.getString('token');
final response=await http.post(Uri.parse('http://localhost:3000/attachments/addtocart/$id')
,headers:{    'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',} 
);
if(response.statusCode==200||response.statusCode==201){
update();
print(response); 
}else{print(response.statusCode);}

}catch(e){

  print(e);
}
}
Future<void> addsectiontocart({required  int id})async{
try{
  final prefs=await SharedPreferences.getInstance();
final token=prefs.getString('token');
final response=await http.post(Uri.parse('http://localhost:3000/sections/addtocart/$id')
,headers:{    'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',} 
);
if(response.statusCode==200||response.statusCode==201){
update();
print(response); 
}else{print(response.statusCode);}

}catch(e){

  print(e);
}
}

Future<void> addcoursetocart( {required  int id})async{
try{
  final prefs=await SharedPreferences.getInstance();
final token=prefs.getString('token');
final response=await http.post(Uri.parse('http://localhost:3000/courses/addtocart/$id')
,headers:{    'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',} 
);
if(response.statusCode==200||response.statusCode==201){
update();
print(response); 
}else{print(response.statusCode);}

}catch(e){

  print(e);
}
}
 Future clearCart(
 
    
  ) async {
    try {
       final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse('http://localhost:3000/code/buy/clearcart'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
       
      );
      //   final data = jsonDecode(response.body);
      // final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200||response.statusCode == 201) {
        update();
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
           print('object${response.statusCode}');
      } else if (response.statusCode == 404) {   print('object${response.statusCode}');
      } else {
       print('object${response.statusCode}');
      }
    } catch (e) {
     print(e);
    }
  }
 
Future  deletefromcart( String id) async{

  try{  final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // var body=json.encode({'name':name,"description":description});


var url ='http://localhost:3000/cart/$id';
final response=await http .delete(Uri.parse(url),
headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==201||response.statusCode==200||response.statusCode==204){
 print(response.statusCode); 
 update();
 response.body;
//  getallcourse();
 update();
//  getallcourse();
}
else{print('hhhhhhhhh');
 response.body;
 print(response.statusCode);
 update();
}
}catch(e){
  print(e);
}
}
 
  TextEditingController titles=TextEditingController();
  Future<void> studentQues({
    required String name,required BuildContext context,
    // required String rechargeCode,
  }) async {
 try {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.post(
    Uri.parse('http://localhost:3000/studentquestions?name=$name'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: json.encode({
      'text': titles.text,
    }),
  );

  print('Status: ${response.statusCode}');
  print('Body: ${response.body}');

  if (response.headers['content-type']?.contains('application/json') == true) {
    var data = json.decode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      update();
    } else if (response.statusCode == 401 || response.statusCode == 409) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${data['message'] ?? 'Error occurred'}'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(20),
        ),
      );
    }
  } else {
    print('Non-JSON response: ${response.body}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.body),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(20),
      ),
    );
  }
} catch (e) {
  print('Error: $e');
}

  }

  void increment() => count.value++;




TextEditingController emailinput=TextEditingController();
TextEditingController passwordinput=TextEditingController();
final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
 Future<bool> login(context) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/auth/login/student'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": emailController.text, "password": passwordController.text}),
    );
  if(response.statusCode==401){ 
     ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text("wrong password or email"),
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      label: "Undo",
      onPressed: () {
    
      },
    ),
  ),
);
    // print('object');
    
    return false;
  }
    if (response.statusCode == 200||response.statusCode==201) {
      final data = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
      
      await prefs.setString('token', data['token']);
     
      return true;
    }

   else{ 
    
    
    return false;
  }}


Future<void>uploadVideo(File videoFile)async{
  var request=http.MultipartRequest('POST',Uri.parse('http://localhost:3000/videos/upload'));
  request.files.add(await http.MultipartFile.fromPath('file', videoFile.path,));
 var response=await request.send();
 if(response.statusCode==201||response.statusCode==200){
 
 }
 else{
 }
}
// Future <void> getcourses()async{
//   try {
//       final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     final url =Uri.parse('${Applinks.baseurl}/lesson');
//     final response=await http.get (url,headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token",
//       });
      
//     if(response.statusCode==200){
//       final List<dynamic>data =json.decode(response.body);
//       lesson=data.map((item)=>Lessons.fromJson(item)).toList();
//       print('students${data}');
//       update();
//     }
//     else{
//       print('errorstudents${response.statusCode}');
//     }
//   } catch (e) {
//     print('Errorrr${e}');
//   }
// }
  final int ? limit = 4;
  final int ? limit2 = 3;
List<Userquestions> userquestions=[];
List<Userquestions> userquestions2=[];

  int ?currentPage;
Future fetchUserQuestion({int? id, int? page,  }) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final queryParameters = <String, String>{};
    if (id != null) queryParameters['lessonId'] = id.toString();
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('http://localhost:3000/userquestion/questions')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      final jsonResponse = json.decode(response.body);

      final List<dynamic> data = jsonResponse['data'];
      userquestions = data.map((item) => Userquestions.fromJson(item)).toList();

       currentPage = jsonResponse['currentPage'] ?? 1;
      final int totalPages = jsonResponse['totalPages'] ?? 1;
      final int total = jsonResponse['total'] ?? 0;
      final int perPage = jsonResponse['limit'] ?? data.length;


      update();
    } else {
    }
  } catch (e) {
  }
}




List <Cart> cart=[];
  int pricelength=0;
Future fetchCart() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final uri = Uri.parse('http://localhost:3000/cart');
        // .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {


      final jsonResponse = json.decode(response.body);


      final List<dynamic> data = jsonResponse['data'];
   pricelength = jsonResponse['length'];
      cart = data.map((item) => Cart.fromJson(item)).toList();

      //  currentPage = jsonResponse['currentPage'] ?? 1;
      // final int totalPages = jsonResponse['totalPages'] ?? 1;
      // final int total = jsonResponse['total'] ?? 0;
      // final int perPage = jsonResponse['limit'] ?? data.length;

     

      update();
    } else {
    }
  } catch (e) {
  }
}

Future usedattachments() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // final queryParameters = <String, String>{};
    // if (id != null) queryParameters['lessonId'] = id.toString();
    // if (page != null) queryParameters['page'] = page.toString();
    // if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('http://localhost:3000/attachments/allusedattach');
        // .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {


      final jsonResponse = json.decode(response.body);


      final List<dynamic> data = jsonResponse;
  //  pricelength = jsonResponse['length'];
      attach = data.map((item) => Attachment.fromJson(item)).toList();

      //  currentPage = jsonResponse['currentPage'] ?? 1;
      // final int totalPages = jsonResponse['totalPages'] ?? 1;
      // final int total = jsonResponse['total'] ?? 0;
      // final int perPage = jsonResponse['limit'] ?? data.length;

     

      update();
    } else {
    }
  } catch (e) {
  }
}

Future unusedattachments() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // final queryParameters = <String, String>{};
    // if (id != null) queryParameters['lessonId'] = id.toString();
    // if (page != null) queryParameters['page'] = page.toString();
    // if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('http://localhost:3000/attachments/allunusedattach');
        // .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {


      final jsonResponse = json.decode(response.body);


      final List<dynamic> data = jsonResponse;
  //  pricelength = jsonResponse['length'];
      unusedattach = data.map((item) => Attachment.fromJson(item)).toList();

      //  currentPage = jsonResponse['currentPage'] ?? 1;
      // final int totalPages = jsonResponse['totalPages'] ?? 1;
      // final int total = jsonResponse['total'] ?? 0;
      // final int perPage = jsonResponse['limit'] ?? data.length;

     

      update();
    } else {
    }
  } catch (e) {
  }
}

Future fetchUserQuestionExam({int? id, int? page,  }) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final queryParameters = <String, String>{};
    if (id != null) queryParameters['examId'] = id.toString();
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('http://localhost:3000/userquestion/questions/questionsexams')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      final jsonResponse = json.decode(response.body);

      final List<dynamic> data = jsonResponse['data'];
      userquestions2 = data.map((item) => Userquestions.fromJson(item)).toList();

       currentPage = jsonResponse['currentPage'] ?? 1;
      final int totalPages = jsonResponse['totalPages'] ?? 1;
      final int total = jsonResponse['total'] ?? 0;
      final int perPage = jsonResponse['limit'] ?? data.length;


      update();
    } else {
    }
  } catch (e) {
  }
}


List<Userquestions> ques =[];
Future fetchUserQuestionExam2({int? id, int? page,  }) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final queryParameters = <String, String>{};
    if (id != null) queryParameters['examId'] = id.toString();
    if (page != null) queryParameters['page'] = page.toString();
    if (limit2 != null) queryParameters['limit'] = limit2.toString();

    final uri = Uri.parse('http://localhost:3000/userquestion/questions/questionsexams')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      final jsonResponse = json.decode(response.body);

      final List<dynamic> data = jsonResponse['data'];
      ques = data.map((item) => Userquestions.fromJson(item)).toList();

       currentPage = jsonResponse['currentPage'] ?? 1;
      final int totalPages = jsonResponse['totalPages'] ?? 1;
      final int total = jsonResponse['total'] ?? 0;
      final int perPage = jsonResponse['limit'] ?? data.length;


      update();
    } else {
    }
  } catch (e) {
  }
}
// Future fetchUserQuestionExam({int? id, int? page,  }) async {
//   try {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');

//     final queryParameters = <String, String>{};
//     if (id != null) queryParameters['examId'] = id.toString();
//     if (page != null) queryParameters['page'] = page.toString();
//     if (limit != null) queryParameters['limit'] = limit.toString();

//     final uri = Uri.parse('http://localhost:3000/userquestion/questions/questionsexams')
//         .replace(queryParameters: queryParameters);

//     final response = await http.get(
//       uri,
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token",
//       },
//     );

//     if (response.statusCode == 200 || response.statusCode == 201) {

//       final jsonResponse = json.decode(response.body);


//       final List<dynamic> data = jsonResponse['data'];
//       userquestions2 = data.map((item) => Userquestions.fromJson(item)).toList();

//        currentPage = jsonResponse['currentPage'] ?? 1;
//       final int totalPages = jsonResponse['totalPages'] ?? 1;
//       final int total = jsonResponse['total'] ?? 0;
//       final int perPage = jsonResponse['limit'] ?? data.length;

//       // this.currentPage = currentPage;
//       // this.totalPages = totalPages;

//       update();
//     } else {
//     }
//   } catch (e) {
//   }
// }

TextEditingController fullName=TextEditingController();
TextEditingController PhoneNum=TextEditingController();
TextEditingController mother_phone=TextEditingController();
TextEditingController father_phone=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController facebooklink=TextEditingController();
TextEditingController school=TextEditingController();
// final ValueNotifier<String?> subjects = ValueNotifier<String?>(null);
// final ValueNotifier<String?> semester = ValueNotifier<String?>(null);
// final ValueNotifier<String?> year = ValueNotifier<String?>(null);
// final ValueNotifier<String?>schools=ValueNotifier<String?>(null);
// final ValueNotifier<String?>center=ValueNotifier<String?>(null);
// final ValueNotifier<String?>timeofsession=ValueNotifier<String?>(null);
  var subjects = Rx<String?>(null);  Rx<String?> semester = Rx<String?>(null);
  var year = Rx<String?>(null);
  var schools = Rx<String?>(null);
  var center = Rx<String?>(null);
  var timeofsession = Rx<String?>(null);
  var selectedCourseId = Rx<String?>(null);
Future <void> addanswer(BuildContext  context) async{
  try{
    
      final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var body=json.encode({
      'fullname':school.text,
      "email":email.text
      ,"phoneNum":PhoneNum.text
      ,"mother_phone_num":mother_phone.text,
      "father_phone_num":father_phone.text,
      "facebookLink":facebooklink.text,
      "coursetype":subjects.value
      ,"semester":semester.value,
      "grade":year.value
     ,"stud_school":schools.value
     ,"center":center.value,
    //  "":timeofsession.value
      });
var url ='http://localhost:3000/students/schedualCenter/p';
final response=await http .patch(Uri.parse(url),body:body
,headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      }
);

if(response.statusCode==204||response.statusCode==200){
//  print(response.statusCode); 
 update();
 Navigator.push(context, MaterialPageRoute(builder: (context){
  return Homeafterlogin();
}));
 response.body;
//  getallcourse();
}
else{//print('hhhhhhhhh${response.statusCode}');


}
}catch(e){
  print(e);
}
}
  // int ?currentPage;
List<Exam> exams=[];
Future fetchExams({int? online, int? page,  }) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final queryParameters = <String, String>{};
    if (online != null) queryParameters['online'] = online.toString();
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('http://localhost:3000/exams/online/offline')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {


      final jsonResponse = json.decode(response.body);

      final List<dynamic> data = jsonResponse['exam'];
      exams = data.map((item) => Exam.fromJson(item)).toList();

     

      update();
    } else {
    }
  } catch (e) {
  }
}
    List<dynamic> startdate=[];
List<Exam> examsoffon=[];
Future fetchExams2({int? online,   }) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final queryParameters = <String, String>{};
    if (online != null) queryParameters['online'] = online.toString();
    // if (page != null) queryParameters['page'] = page.toString();
    // if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('http://localhost:3000/exams/online/offline')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      final jsonResponse = json.decode(response.body);

      final List<dynamic> data = jsonResponse['exam'];
       startdate= jsonResponse['startdate'];
      print(startdate);
      examsoffon = data.map((item) => Exam.fromJson(item)).toList();


      update();
    } else {
    }
  } catch (e) {
  }
}

List<Code> codes=[];
Future fetchCodes({int? online, int? page,  }) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final queryParameters = <String, String>{};
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('http://localhost:3000/code/withpag')
        .replace(queryParameters: queryParameters);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      final jsonResponse = json.decode(response.body);

      final List<dynamic> data = jsonResponse['codes'];
      codes = data.map((item) => Code.fromJson(item)).toList();

      update();
    } else {
    }
  } catch (e) {
  }
}



List<student_Course> studentcourse=[];
Future<void> fetchQuestions( ) async {
 try{ 
  final Uri uri = Uri.http(
    'localhost:3000', '/student-course',
  );
    
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {

    final jsonResponse=json.decode(response.body);
    final List<dynamic>courseData=jsonResponse['course'];
    
      studentcourse=courseData.map((item)=>student_Course.fromJson(item)).toList();
    sumExamAss=jsonResponse['sumExamAss'].toString();
    update();
  } else {

    // print('questions loaded: ${page.toString()}');
    // print('Failed to fetch questions: ${response.statusCode}');
  }}catch(e){//print('que${e}');
  }
}

List<Section>  sections=[];
Future<void> fetchSections( ) async {
 try{ 
  final Uri uri = Uri.http(
    'localhost:3000', '/sections/mysections',
    // {
    //   if (page != null)  'page': page.toString(),
    //   if (limit != null) 'limit': limit.toString(),
    // },
  );
    
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {

    // final json =await jsonDecode(response.body);
    // questions = Questions.fromJson(json);
    final jsonResponse=json.decode(response.body);
    final List<dynamic>courseData=jsonResponse;//['course'];
    
    //  final List <dynamic>data=json.decode(response.body);
      sections=courseData.map((item)=>Section.fromJson(item)).toList();
    // print('sections loaded: ${response.body!}');
    // sumExamAss=jsonResponse['sumExamAss'].toString();
    // print(sumExamAss);
    // print('questions loaded: ${questions!.id}');
    // print('questions loaded: ${page.toString()}');
    update();
// print(response.statusCode);
// print(response.statusCode);

  } else {

    // print('questions loaded: ${page.toString()}');
    // print('Failed to fetch sections: ${response.statusCode}');
  }}catch(e){print('que${e}');
  }
}
List<Course>  allcourse=[];
Future<void> fetchSAllCourses( ) async {
 try{ 
  final Uri uri = Uri.http(
    'localhost:3000', '/courses/getallcourses',
    // {
    //   if (page != null)  'page': page.toString(),
    //   if (limit != null) 'limit': limit.toString(),
    // },
  );
    
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {

    // final json =await jsonDecode(response.body);
    // questions = Questions.fromJson(json);
    final jsonResponse=json.decode(response.body);
    final List<dynamic>courseData=jsonResponse['course'];
    
    //  final List <dynamic>data=json.decode(response.body);
      allcourse=courseData.map((item)=>Course.fromJson(item)).toList();
    // print('sections loaded: ${response.body!}');
    // sumExamAss=jsonResponse['sumExamAss'].toString();
    // print(sumExamAss);
    // print('questions loaded: ${questions!.id}');
    // print('questions loaded: ${page.toString()}');
    update();
// print(response.statusCode);
print(response.statusCode);

  } else {
print(response.statusCode);

    // print('questions loaded: ${page.toString()}');
    // print('Failed to fetch sections: ${response.statusCode}');
  }}catch(e){print('que${e}');
  }
}

// }
List<Course> bycourses=[];
// List<Course> course=[];
Future<void> fetch( ) async {
 try{ 
  final Uri uri = Uri.http(
    'localhost:3000', '/student-course/course',
    // {
    //   if (page != null)  'page': page.toString(),
    //   if (limit != null) 'limit': limit.toString(),
    // },
  
  );
    
       final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {

    // final json =await jsonDecode(response.body);
    // questions = Questions.fromJson(json);
    final jsonResponse=json.decode(response.body);
    final List<dynamic>courseData=jsonResponse['course'];
    
    //  final List <dynamic>data=json.decode(response.body);
      courses=courseData.map((item)=>Course.fromJson(item)).toList();
    // print('by loaded: ${response.body!}');
    // sumExamAss=jsonResponse['sumExamAss'].toString();
    // print(sumExamAss);
// print(' name   ${jsonResponse['course']['name'].toString()}');

    // print('questions loaded: ${questions!.id}');
    // print('questions loaded: ${page.toString()}');
    update();
  } else {

    // print('questions loaded: ${page.toString()}');
    // print('Failed to fetch questions: ${response.statusCode}');
  }}catch(e){//print('que${e}');
  }
}
// Future<void> fetchbyinfoid( String id) async {
//  try{ 
//   final Uri uri = Uri.http(
//     'localhost:3000', '/student-course/courseInfoid/$id',
    
//     // {
//     //   if (page != null)  'page': page.toString(),
//     //   if (limit != null) 'limit': limit.toString(),
//     // },
  
//   );
    
//        final prefs = await SharedPreferences.getInstance();
//   final token = prefs.getString('token');
//   final response = await http.get(
//     uri,
//     headers: {
//       'Authorization': 'Bearer $token',
//       'Content-Type': 'application/json',
//     },
//   );

//   if (response.statusCode == 200) {

//     // final json =await jsonDecode(response.body);
//     // questions = Questions.fromJson(json);
//     final jsonResponse=json.decode(response.body);
//     final List<dynamic>courseData=jsonResponse;
    
//     //  final List <dynamic>data=json.decode(response.body);
//       bycourses=courseData.map((item)=>Course.fromJson(item)).toList();
//     print('by loaded: ${response.body!}');
//     // sumExamAss=jsonResponse['sumExamAss'].toString();
//     // print(sumExamAss);
// // print(' name   ${jsonResponse['course']['name'].toString()}');

//     // print('questions loaded: ${questions!.id}');
//     // print('questions loaded: ${page.toString()}');
//     update();
//   } else {

//     // print('questions loaded: ${page.toString()}');
//     print('Failed to fetch questions: ${response.statusCode}');
//   }}catch(e){print('que${e}');}
// }

List<Course> courses=[];
List<Course> courses2=[];
Future<void> fetchcourseinfo(String id) async {
  try {
    final queryParams = <String, String>{};
    if (id != null && id.isNotEmpty) {
      queryParams['course_id'] = id;
    }

    final Uri uri = Uri.http(
      'localhost:3000',
      '/student-course/courseInfo',
      queryParams,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> courseData = jsonResponse['course'];

      courses2 = courseData.map((item) => Course.fromJson(item)).toList();

      // print('by loaded: ${response.body}');
      // print(sumExamAss);
      // print('questions loaded2: ${courses.map((e) => e.id).toString()}');

      update();
    } else {
      // print('Failed to fetch questions: ${response.statusCode}');
    }
  } catch (e) {
    // print('que$e');
  }
}
List<Attachment> attachment=[];
List<Attachment> attach=[];
List<Attachment> unusedattach=[];
Future<void> attachments({String? status}) async {
  try {
    final queryParams = <String, String>{};
    if (status != null && status.isNotEmpty) {
      queryParams['status'] = status;
    }

    final Uri uri = Uri.http(
      'localhost:3000',
      '/attachments',
      queryParams,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> courseData = jsonResponse['courses'];

      attachment = courseData.map((item) => Attachment.fromJson(item)).toList();

      // print('byAttatch: ${response.body}');
      // print(sumExamAss);
      // print('questions loaded2: ${courses.map((e) => e.id).toString()}');

      update();
    } else {
      // print('Failed to fetch questions: ${response.statusCode}');
    }
  } catch (e) {
    print('que$e');
  }
}
Future<bool> checkEnrollment(int courseId) async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');  final response = await http.get(
    Uri.parse('http://localhost:3000/student-course/isEnrolled/$courseId'), headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['enrolled'] as bool;
  } else {
    throw Exception('Failed to check enrollment');
  }
}
 var enrollmentResults = <String, bool>{}.obs;

  Future<void> preloadEnrollments(List<dynamic> sections) async {
    // Run all requests in parallel
    final futures = sections.map((section) async {
      final id = section['id'].toString();
      final result = await usedEnrollmentsection(id);
      enrollmentResults[id] = result;
    });

    await Future.wait(futures); 
  }

Future<bool> usedEnrollmentsection(String sectionId) async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');  final response = await http.get(
    Uri.parse('http://localhost:3000/sections/isEnrolled/$sectionId'), headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    // print(response.body);
    // update();
    return data['enrolled'] as bool;
    
  } else {
    throw Exception('Failed to check enrollment');
  }
}

List<courseInfo> course_info=[];
Future<void> fetchcourseinfoid(String id) async {
  try {
    final queryParams = <String, String>{};
    if (id != null && id.isNotEmpty) {
      queryParams['courseId'] = id;
    }

    final Uri uri = Uri.http(
      'localhost:3000',
      '/student-course/courseInfoid',
      queryParams,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> courseData = jsonResponse['course'];

      course_info = courseData.map((item) => courseInfo.fromJson(item)).toList();

      // print('by loaded: ${response.body}');
      // print(sumExamAss);
      // print('questions loaded2: ${courses.map((e) => e.id).toString()}');

      update();
    } else {
      // print('Failed to fetch questions: ${response.statusCode}');
    }
  } catch (e) {
    print('que$e');
  }
}
List<Section> section=[];
Future<void> fetchsectionid(String id) async {
  try {
    final queryParams = <String, String>{};
    if (id != null && id.isNotEmpty) {
      queryParams['section_id'] = id;
    }

    final Uri uri = Uri.http(
      'localhost:3000',
      '/courses/sectionbyid',
      queryParams,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> courseData = jsonResponse['course'];

      section = courseData.map((item) => Section.fromJson(item)).toList();

      print('by loaded: ${response.body}');
      // print(sumExamAss);
      // print('questions loaded2: ${courses.map((e) => e.id).toString()}');

      update();
    } else {
      // print('Failed to fetch questions: ${response.statusCode}');
    }
  } catch (e) {
    print('que$e');
  }
}
List<Materials> material=[];
Future<void> fetchmaterial() async {
  try {
    // final queryParams = <String, String>{};
   
    final Uri uri = Uri.http(
      'localhost:3000',
      '/materials',
    
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> courseData = jsonResponse;

      material = courseData.map((item) => Materials.fromJson(item)).toList();

      print('by loaded: ${response.body}');
      print(response.body);
      // print('questions loaded2: ${courses.map((e) => e.id).toString()}');

      update();
    } else {
      // print('Failed to fetch questions: ${response.statusCode}');
    }
  } catch (e) {
    print('que$e');
  }
}


List<Course> course=[];
Future<void> fetchsectionidlesson(String id) async {
  try {
    final queryParams = <String, String>{};
    if (id != null && id.isNotEmpty) {
      queryParams['section_id'] = id;
    }

    final Uri uri = Uri.http(
      'localhost:3000',
      '/courses/sectionbyid',
      queryParams,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> courseData = jsonResponse['course'];

      course = courseData.map((item) => Course.fromJson(item)).toList();

      print('by loaded: ${response.body}');
      // print(sumExamAss);
      // print('questions loaded2: ${courses.map((e) => e.id).toString()}');

      update();
    } else {
      // print('Failed to fetch questions: ${response.statusCode}');
    }
  } catch (e) {
    print('que$e');
  }
}
List<courseInfo> courses_lesson=[];
Future<void> sectionidlessontype(String title) async {
  try {
    final queryParams = <String, String>{};
    if (title.isNotEmpty) {
      queryParams['title'] = title;
    }

    final Uri uri = Uri.http(
      'localhost:3000',
      '/lesson/typelesson',
      queryParams,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      // print('Raw API Response: ${response.body}');

      final dynamic courseData = jsonResponse['course'];

      if (courseData is List) {
        courses_lesson = courseData.map((item) => courseInfo.fromJson(item)).toList();
        // print('Successfully loaded ${courses_lesson.length} courses');
      } else {
        // print('Error: course data is not a List');
      }

      update();
    } else {
      // print('Failed to fetch: ${response.statusCode}');
    }
  } catch (e) {
    // print('Error in sectionidlessontype: $e');
  }
} 
    


 void togglePlayPause() {
    if (controllervideo?.value.isPlaying ?? false) {
      controllervideo?.pause();
    } else {
      controllervideo?.play();
    }
  }
 void togglePlayPause2() {
    if (controllervideo2?.value.isPlaying ?? false) {
      controllervideo2?.pause();
    } else {
      controllervideo2?.play();
    }
  }
 String ?photoUrl='';  
   final FirebaseAuth auth = FirebaseAuth.instance;
  Future<bool> signInWithGoogle(context) async {
  try {
    
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    UserCredential userCredential = await auth.signInWithPopup(googleProvider);

    String? idToken = await userCredential.user?.getIdToken();
    print("✅ ID Token: $idToken");

    final response = await http.post(
      Uri.parse('http://localhost:3000/auth/google-login/students'), 
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'idToken': idToken}),
    );

    if (response.statusCode == 200||response.statusCode==201)  {
      final responseBody = jsonDecode(response.body);
      print("🎉 Logged in successfully: ${responseBody['token']}");
    
      final data = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
      
      await prefs.setString('token', data['token']);
      return true;
    
    
    } else {
      print("❌ Server error: ${response.statusCode}");
      return false;
    }
  } catch (e) {
    print("❌ Sign-in error: $e");
    return false;
  }
}}