
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/models/wallet%20copy%204.dart';
import 'package:my_app/app/modules/home/views/my.dart';
import 'package:my_app/app/modules/home/views/myExam.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../controllers/home_controller.dart';

class ExamSolve extends StatefulWidget {
  int totalSeconds; //= 2 * 60;
  ExamSolve({super.key,required this.totalSeconds});

  @override
  _ExamSolveViewerState createState() => _ExamSolveViewerState();
}

class _ExamSolveViewerState extends State<ExamSolve> {
  int currentIndex = 1;
  bool trueAnswer = false;
  int ids = 0;
  // Map<int, String?> selectedAnswers = {};
  final PageController _pageController = PageController(
    viewportFraction: 0.22,
    initialPage: 1,
  );
Timer? _timer;
  // 22 minutes in seconds
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.totalSeconds > 0) {
          widget.totalSeconds--;
        } else {
          _timer?.cancel();
 
 
          _isRunning = false;


           _navigateToResultPage() ;
        }
      });
    });
  }

  void _resetTimer() {
    setState(() {
     widget. totalSeconds = 22 * 60;
    });
    if (!_isRunning) {
      _startTimer();
    }
  }
void _navigateToResultPage() {
  // Navigate after a brief delay to ensure UI updates
  Future.delayed(Duration(milliseconds: 500), () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Myexam()), // Replace with your target page
    );
  });
}
  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
  
  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }


  void _selectAnswer({ int ?id, String? answer}) {
    setState(() {
      HomeController controller = HomeController();
      selectedAnswers[id!] = answer;
      controller.answerQuestionExam(
        questionId: id,
        studentAnswerExam: answer!,
      );
    });
  }

  // void _selectAnswer(int id, String answer) {
  //   setState(() {
  //     selectedAnswers[id] = answer;
  //     // Call your controller method
  //     HomeController controller = HomeController();
  //     controller.answerQuestion(
  //       questionId: id,
  //       studentAnswer: answer,
  //     );
  //   });
  // }

//   Widget buildAnswerOption({
//     required int id,
//     required String optionLetter,
//     required String answerText,
//     bool isCorrect = false,
//     bool ontap=false,
//     bool ontap1=false,
//     bool ontap2=false,
//     bool ontap3=false,
//     bool isWrong = false,
//     required VoidCallback onTap,
//   }) {
//     Color bgColor = Colors.white;
//     Color borderColor = const Color.fromARGB(255, 154, 175, 228);
//     Color textColor = const Color.fromARGB(255, 6, 69, 152);
// if(ontap){      bgColor =  const Color.fromARGB(255, 154, 175, 228);
//       borderColor =  const Color.fromARGB(255, 154, 175, 228);
//       textColor =  const Color.fromARGB(255, 154, 175, 228);}
// else if(ontap1){      bgColor =  const Color.fromARGB(255, 154, 175, 228);
//       borderColor =  const Color.fromARGB(255, 154, 175, 228);
//       textColor =  const Color.fromARGB(255, 154, 175, 228);}
// else if(ontap2){      bgColor =  const Color.fromARGB(255, 154, 175, 228);
//       borderColor =  const Color.fromARGB(255, 154, 175, 228);
//       textColor =  const Color.fromARGB(255, 154, 175, 228);}
// else if(ontap3){      bgColor =  const Color.fromARGB(255, 154, 175, 228);
//       borderColor =  const Color.fromARGB(255, 154, 175, 228);
//       textColor =  const Color.fromARGB(255, 154, 175, 228);}
// // if(ontap){      bgColor =  const Color.fromARGB(255, 154, 175, 228);
// //       borderColor =  const Color.fromARGB(255, 154, 175, 228);
// //       textColor =  const Color.fromARGB(255, 154, 175, 228);}
//     // if (isCorrect) {
//     //   bgColor = const Color.fromARGB(255, 233, 241, 239);
//     //   borderColor = const Color.fromARGB(255, 39, 114, 83);
//     //   textColor = const Color.fromARGB(255, 39, 114, 83);
//     // } else if (isWrong) {
//     //   bgColor = const Color.fromARGB(255, 254, 236, 235);
//     //   borderColor = const Color.fromARGB(255, 222, 61, 49);
//     //   textColor = const Color.fromARGB(255, 222, 61, 49);
//     // }

//     return
    
//      InkWell(
//       onTap: onTap,
//       child: Container(
//         width: 1070,
//         margin: const EdgeInsets.symmetric(vertical: 6),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: bgColor,
//           border: Border.all(color: borderColor, width: 1),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text(
//               answerText,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: textColor,
//               ),
//             ),
//             const SizedBox(width: 8),
//             Text(
//               optionLetter,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: textColor,
//               ),
//             ),
//       ],
//         ),
//       ),
//     );
//   }
  Widget buildAnswerOption({
    required int id,
    required String optionLetter,
    required String answerText,
    bool isCorrect = false,
    bool isWrong = false,
    required VoidCallback onTap,
  }) {
    // Determine if this option is currently selected
    bool isSelected = selectedAnswers[id] == answerText;
    // Determine if this option is being tapped (for visual feedback)
    bool isCurrentlyTapped = isTapped[id] ?? false;

    Color bgColor = Colors.white;
    Color borderColor = const Color.fromARGB(255, 154, 175, 228);
    Color textColor = const Color.fromARGB(255, 6, 69, 152);

    // If this option is selected, use baby blue color
    if (isSelected) {
      bgColor = const Color.fromARGB(255, 245, 245, 245); // Baby blue
      borderColor = const Color.fromARGB(255, 154, 175, 228); // Darker blue border
      textColor = Color.fromARGB(255, 154, 175, 228);
    }
    // If this option is being tapped (for visual feedback)
    // else if (isCurrentlyTapped) {
    //   bgColor = const Color.fromARGB(255, 200, 230, 240); // Lighter baby blue when tapped
    //   borderColor = const Color.fromARGB(255, 100, 150, 200);
    //   textColor = Colors.black;
    // }
    // If this is the correct answer (after submission)
    // else if (isCorrect) {
    //   bgColor = const Color.fromARGB(255, 233, 241, 239);
    //   borderColor = const Color.fromARGB(255, 39, 114, 83);
    //   textColor = const Color.fromARGB(255, 39, 114, 83);
    // }
    // If this is a wrong answer (after submission)
    // else if (isWrong) {
    //   bgColor = const Color.fromARGB(255, 254, 236, 235);
    //   borderColor = const Color.fromARGB(255, 222, 61, 49);
    //   textColor = const Color.fromARGB(255, 222, 61, 49);
    // }

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isTapped[id] = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isTapped[id] = false;
        });
        onTap();
      },
      onTapCancel: () {
        setState(() {
          isTapped[id] = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 1070,
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              answerText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              optionLetter,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildPagination(HomeController controller, int currentPage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(10, (index) {
      final pageIndex = index + 1;
      return GestureDetector(
        onTap: () {
          setState(() {
            currentIndex = pageIndex;
            controller.fetchUserQuestion(page: pageIndex,id:3); // Fixed: pass pageIndex instead of currentPage
            controller.update();
          });
        },
        child: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: pageIndex == currentPage
                ? const Color.fromARGB(255, 236, 238, 241)
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '$pageIndex',
            style: TextStyle(
              color: pageIndex == currentPage
                  ? const Color.fromARGB(255, 6, 69, 152)
                  : Colors.black,
            ),
          ),
        ),
      );
    }),
  );
}
  // Widget _buildPagination(HomeController controller, int currentPage) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: List.generate(10, (index) {
  //       final pageIndex = index + 1;
  //       return GestureDetector(
  //         onTap: () {
  //           setState(() {
  //             currentIndex = pageIndex;
  //             controller.fetchUserQuestion(page:currentPage,);controller.update();
  //           });
  //         },
  //         child: Container(
  //           margin: const EdgeInsets.all(4),
  //           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //           decoration: BoxDecoration(
  //             color: pageIndex == currentPage
  //                 ? const Color.fromARGB(255, 236, 238, 241)
  //                 : Colors.white,
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           child: Text(
  //             '$pageIndex',
  //             style: TextStyle(
  //               color: pageIndex == currentPage
  //                   ? const Color.fromARGB(255, 6, 69, 152)
  //                   : Colors.black,
  //             ),
  //           ),
  //         ),
  //       );
  //     }),
  //   );
  // }
  Map<int, String?> selectedAnswers = {};
  // Add this to track the tapped state for visual feedback
  Map<int, bool> isTapped = {};
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: isMobile
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 6, 70, 152),
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierColor: Colors.transparent,
                        builder: (context) => const MenuDialog(),
                      );
                    },
                    child: const Icon(Icons.menu, color: Colors.white),
                  ),
                  Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Fassets/Group87935.png', width: 55),
                ],
              ),
            )
          : AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 85,
              backgroundColor: const Color.fromARGB(255, 6, 69, 152),
              title: Center(
                child: SizedBox(
                  width: screenWidth * 0.95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: const CircleAvatar(
                              radius: 24,
                            ),
                          ),
                          Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Vector(3).png',
                              width: 40, height: 41),
                          Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Vector(2).png',
                              width: 39.02, height: 40),
                        ],
                      ),
                      if (!isMobile)
                        Row(
                          children: [
                            _navText('تواصل معنا'),
                            _navText('عن أشطر'),
                            _navText('مصادري'),
                            _navText('كورساتى'),
                            _navText('مدرسينا'),
                            _navText('ذاكر'),
                            _navText('الرئيسية', highlight: true),
                            const SizedBox(width: 12),
                            Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Fassets/Group87935.png', width: 55),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
      body: GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: const Color.fromARGB(255, 242, 195, 42),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'استخدم كود خصم (ANER) واحصل على خصم على الدروس الخصوصية 36%',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 6, 69, 152),
                        fontSize: isMobile ? 14 : 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              const Text(
                                'اختار الاقسام',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 6, 69, 152)),
                              ),
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(),
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Color.fromARGB(255, 181, 181, 181),
                                ),
                              ),
                              const Text(
                                'اختار نشاطك',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 181, 181, 181),
                                ),
                              ),
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(),
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Color.fromARGB(255, 181, 181, 181),
                                ),
                              ),
                              const Text(
                                'الفيزياء',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 181, 181, 181),
                                ),
                              ),
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(),
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Color.fromARGB(255, 181, 181, 181),
                                ),
                              ),
                              const Text(
                                'الصف الثالث الثانوي',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 181, 181, 181),
                                ),
                              ),
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(),
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Color.fromARGB(255, 181, 181, 181),
                                ),
                              ),
                              const Text(
                                'الرئيسية',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 181, 181, 181),
                                ),
                              ),
                            ],
                          ),
                        ),
                       
                        Column(
                          children: [
                            // SizedBox(
                            //   height: 40,
                            //   width: 1118,
                              // child: Column(
                              //   crossAxisAlignment: CrossAxisAlignment.end,
                              //   children: [
                              //     // Container(
                              //     //   child: Row(
                              //     //     mainAxisAlignment:
                              //     //         MainAxisAlignment.spaceBetween,
                              //     //     children: [
                                     
                              //     //     ],
                              //     //   ),
                              //     // ),
                               
                              //   ],
                              // ),
                            // ),SizedBox(height: 24,),
                            Container(
                              width:isMobile?343: 1118,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                                       
                                  Stack(
                                    children: [
                                      Container(
                                        width:isMobile?343: 1038,
                                        // height: 904,
                                        // padding: EdgeInsets.only(top:24 ,right: 24,left:24 ),
                                        decoration: const BoxDecoration(
                                          color: Colors.white, borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                        ),
                                        child: Column(
                                          children: [
                                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                         Container(
                          // width: 1038,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 12),
                              const Text(
                                'امتحان شهر 8',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32,
                                  color: Color.fromARGB(255, 6, 69, 152),
                                ),
                              ),
                              const SizedBox(height: 12),
                            Container(
                          padding:EdgeInsets.all(12) ,  
                              width:isMobile?343: 1038,height:isMobile?204: 104,decoration: 
                             BoxDecoration(  
                           borderRadius: BorderRadius.circular(16),
                            
                              gradient:  LinearGradient( //
          colors: [
            Color.fromRGBO(6, 69, 152, 1),   // rgba(6,70,152,1)
            Color.fromRGBO(118, 162, 212, 1) // rgba(118,162,212,1)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),)
            ,child:Wrap(//spacing: 64,
            alignment: WrapAlignment.start,
            spacing: 8,
             children: [
                        Container( width: 620, child: Column(crossAxisAlignment: 
                        CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
                spacing: 14,
                children: [
Text('الوقت المتبقي',style: TextStyle(color: Color.fromARGB(255, 242, 195, 42)
,fontSize: 20,fontWeight: FontWeight.w500),),
Container(
  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
  width: 135,height: 41,child:Wrap(children: [

    Text('دقيقة' ,style: TextStyle(
  fontSize: 20,fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 6, 69, 152)),),
    Text('${_formatTime(widget.totalSeconds)}' ,style: TextStyle(
  fontSize: 20,fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 6, 69, 152)),),
  ],),decoration:
   BoxDecoration(color:const Color.fromRGBO(245, 245, 245, 0.7),
border: Border.all(width: 1,color: Color.fromARGB(255, 181, 181, 181),),
borderRadius: BorderRadius.circular(8)
),)
              ],))    ,   const SizedBox(height: 12),
              Container(width: 330,
              child: Column(
                spacing: 14,
                crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                children: 
              [
          RichText(
  text: TextSpan(
    children: [
      TextSpan(text: 'من اجمالي ',style: TextStyle(
        fontWeight: FontWeight.w500,fontSize: 16,
        color: Color.fromARGB(255, 255, 255, 255))),
      TextSpan(
        text: '20',
        style: TextStyle(fontWeight: FontWeight.w500,color: Color.fromARGB(255, 242, 195, 42)),
      ),
      TextSpan(text: ' سؤال',style: TextStyle(
        fontWeight: FontWeight.w500,fontSize: 16,
        color: Color.fromARGB(255, 255, 255, 255))),
    ],
  ),
),
             Container(
              width:isMobile? 323:330,
              child:Row(mainAxisAlignment:isMobile?MainAxisAlignment.spaceBetween: MainAxisAlignment.start,
              spacing:8,
              children: [
            
            Container( child:Wrap(spacing: 8,
              alignment: WrapAlignment.start,
              children: [
                  Text('السؤال رقم',style: 
             TextStyle(color: Color.fromARGB(255, 255, 255, 255)
             ,fontSize: 20
,fontWeight: FontWeight.w500             
             ),),
              Container(padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1,
                  color: Color.fromARGB(255, 195, 202, 210)),
                  color: Color.fromARGB(255, 236, 238, 241)),
                child: Text('100',style: TextStyle(color:
                 Color.fromARGB(255, 6, 69, 152)
                ,fontWeight: FontWeight.w400
,fontSize: 14                ),),),
            ])),
              Container(width:isMobile?156: 168,height: 40,  child:     TextButton(
           style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 6, 69, 152)
            ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)
            
            )
            
            ),
               onPressed: (){},child:Text('انتقل حالا',style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255)),) ), 
          ),
            ]))
             
               ],),
              ),

            ],) ,                 )
                  ,SizedBox(width: 8,),     
                              // Container(
                              //   width: 1120,
                              //   child: Wrap(
                              //     children: [],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                                                 SizedBox(height: 24,),
                                                 ListView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: controller.userquestions2.length,
  itemBuilder: (context, index) {
    final question = controller.userquestions2[index];
    final int id = question.id!;
    final teacherAnswer = question.teacher_answer;
    final studentAnswer = selectedAnswers[id];
    final bool hasAnswered = studentAnswer != null;
    
    // Check if this is the last question
    final bool isLastQuestion = index == controller.userquestions2.length - 1;
    final bool isLastQuestion2 = index == controller.userquestions2.length - 2;
    
    return Container(
      child: Column(spacing: 18,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              Text(
                question.name ?? "",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),  
              Text(
                '0${id}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 154, 175, 228),
                ),
              ),
            ],
          ),
          Container(
            child: isLastQuestion 
              ? Container(  // This is the text field for the last question
                  width: 990,
                  height: 156,
                  child: TextField(
                    onChanged:(value){ _selectAnswer(answer:value,id: id);},
                    minLines: 5, // controller:controller. text2,
                    maxLines: null, 
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 154, 175, 228),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 154, 175, 228),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ):isLastQuestion2?
                Container(  // This is the text field for the last question
                  width: 990,
                  height: 156,
                  child: TextField(
                    minLines: 5,  onChanged: (value){_selectAnswer(answer:value ,id:id);},
                    maxLines: null,controller:controller. text1, 
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 154, 175, 228),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 154, 175, 228),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ):
               Column(  // These are the regular answer options for other questions
                  children: [ 
                    buildAnswerOption(
                      id: id,//ontap: hasAnswered,
                      optionLetter: "أ.",
                      answerText: "اوم",
                      isCorrect: hasAnswered && teacherAnswer == "اوم",
                      isWrong: hasAnswered && studentAnswer == "اوم" && teacherAnswer != "اوم",
                      onTap: () => _selectAnswer(id:id,answer: "اوم"),
                    ),
                    buildAnswerOption(
                      id: id,
                      optionLetter: "ب.",
                      answerText: "فولت",//,ontap1: hasAnswered,
                      isCorrect: hasAnswered && teacherAnswer == "فولت",
                      isWrong: hasAnswered && studentAnswer == "فولت" && teacherAnswer != "فولت",
                      onTap: () => _selectAnswer(id:id, answer:"فولت"),
                    ),
                    buildAnswerOption(
                      id: id,
                      optionLetter: "ج.",//ontap2: hasAnswered,
                      answerText: "امبير",
                      isCorrect: hasAnswered && teacherAnswer == "امبير",
                      isWrong: hasAnswered && studentAnswer == "امبير" && teacherAnswer != "امبير",
                      onTap: () => _selectAnswer(id:id,answer: "امبير"),
                    ),
                       buildAnswerOption(
                        // ontap: hasAnswered,ontap3: hasAnswered,
                                                          id: id,
                                                          optionLetter: "ذ.",
                                                          answerText: "كولوم",
                                                          isCorrect:
                                                              hasAnswered &&
                                                                  teacherAnswer ==
                                                                      "كولوم",
                                                          isWrong: hasAnswered &&
                                                              studentAnswer ==
                                                                  "كولوم" &&
                                                              teacherAnswer !=
                                                                  "كولوم",
                                                          onTap: () =>
                                                              _selectAnswer(
                                                                 id: id,answer:  "كولوم"),
                                                        ),
                  ],
                ),
            width: 1070,
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  },
),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [Container(
  width: 274,height: 59//,padding: EdgeInsets.fromLTRB(127, 18, 127, 18),
 , child: TextButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context){return Myexam();}));

 },style: TextButton.
styleFrom(backgroundColor: Color.fromARGB(255, 6, 69, 152)

,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))

), child: Text('ارسل الامتحان',style: TextStyle(
  fontWeight: FontWeight.w600,fontSize: 18,
  color: Color.fromARGB(255, 255, 255, 255)),)),)],)



//                                                 ListView.builder(
//                                                   shrinkWrap: true,
//                                                   physics:
//                                                       const NeverScrollableScrollPhysics(),
//                                                   itemCount: controller
//                                                       .userquestions2.length,
//                                                   itemBuilder:
//                                                       (context, index) {
//                                                     final question = controller
//                                                         .userquestions2[index];
//                                                     final int id =
//                                                         question.id!;
//                                                     final teacherAnswer =
//                                                         question.teacher_answer;

//                                                     final studentAnswer =
//                                                         selectedAnswers[id];
//                                                     final bool hasAnswered =
//                                                         studentAnswer != null;

//                                                     return 
//                                                     Container(
//                                                       // width:1038,
//                                                       child: 
//                                                     Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
                                                    
//                                                          Row(
//                                                           mainAxisAlignment: MainAxisAlignment.start,
//                                                           children: [
                                                       
//                                                           Text(
//                                                           question.name ?? "",
//                                                           style: const TextStyle(
//                                                               fontSize: 18,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w600),
//                                                         ),  
//                                                          Text('0${id}',style: TextStyle(
//                                                             fontSize: 18,fontWeight: FontWeight.w500,
//                                                             color: Color.fromARGB(255, 154, 175, 228)
//                                                         ),),],
//                                                         )
//                                                         ,
//                                                       Container(
                                                        
//                                                         child:Column(children: [ 
//                                                           buildAnswerOption(
//                                                           id: id,
//                                                           optionLetter: "أ.",
//                                                           answerText: "اوم",
//                                                           isCorrect:
//                                                               hasAnswered &&
//                                                                   teacherAnswer ==
//                                                                       "اوم",
//                                                           isWrong: hasAnswered &&
//                                                               studentAnswer ==
//                                                                   "اوم" &&
//                                                               teacherAnswer !=
//                                                                   "اوم",
//                                                           onTap: () =>
//                                                               _selectAnswer(
//                                                                   id, "اوم"),
//                                                         ),

//                                                         buildAnswerOption(
//                                                           id: id,
//                                                           optionLetter: "ب.",
//                                                           answerText: "فولت",
//                                                           isCorrect:
//                                                               hasAnswered &&
//                                                                   teacherAnswer ==
//                                                                       "فولت",
//                                                           isWrong: hasAnswered &&
//                                                               studentAnswer ==
//                                                                   "فولت" &&
//                                                               teacherAnswer !=
//                                                                   "فولت",
//                                                           onTap: () =>
//                                                               _selectAnswer(
//                                                                   id, "فولت"),
//                                                         ),
//                                                         buildAnswerOption(
//                                                           id: id,
//                                                           optionLetter: "ج.",
//                                                           answerText: "امبير",
//                                                           isCorrect:
//                                                               hasAnswered &&
//                                                                   teacherAnswer ==
//                                                                       "امبير",
//                                                           isWrong: hasAnswered &&
//                                                               studentAnswer ==
//                                                                   "امبير" &&
//                                                               teacherAnswer !=
//                                                                   "امبير",
//                                                           onTap: () =>
//                                                               _selectAnswer(
//                                                                   id, "امبير"),
//                                                         ),
                                                        // buildAnswerOption(
                                                        //   id: id,
                                                        //   optionLetter: "ذ.",
                                                        //   answerText: "كولوم",
                                                        //   isCorrect:
                                                        //       hasAnswered &&
                                                        //           teacherAnswer ==
                                                        //               "كولوم",
                                                        //   isWrong: hasAnswered &&
                                                        //       studentAnswer ==
                                                        //           "كولوم" &&
                                                        //       teacherAnswer !=
                                                        //           "كولوم",
                                                        //   onTap: () =>
                                                        //       _selectAnswer(
                                                        //           id, "كولوم"),
                                                        // ),
//                                                     //  SizedBox(height: 24,),
                                                   
//                                                           ],) ,width: 1070,),
//       //                                                   Container( width: 1082,height: 91,
//       //       decoration: BoxDecoration(border: Border.all(width: 1,
//       //       color: Color.fromARGB(255, 154, 175, 228))
//       //       ,borderRadius: BorderRadius.circular(8)
            
//       //       ),
//       //       padding: EdgeInsets.fromLTRB(14, 18, 14, 18),
//       //       child:Column(
//       //         crossAxisAlignment: CrossAxisAlignment.start,
//       //         children: [ Text('الاجابة الصحيحة:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 80, 124, 181))
//       //       ,),
//       //       Text.rich(TextSpan(text: 'وحدة قياس شدة التيار هى',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 80, 124, 181)),children: [TextSpan(text:  '$teacherAnswer',style: TextStyle(
//       //         fontWeight: FontWeight.w600,fontSize: 18,
//       //         color: const Color.fromARGB(255, 6, 69, 152)))] ),)
//       //       ],)
//       //       )
//       //  ,
//             SizedBox(height: 24,)   
            
//             ,Column(children: [
//               // Text('03 اشرح لماذا سميت وحدة قياس شدة التيار بالامبير؟')
//             //  ,
// //   Container(
// //   width: 990,
// //   height: 156,
// //   child: TextField(
// //     minLines: 5,       // start with 1 line
// //     maxLines: null,    // grow as user types
// //     // expands: true,     // make it fill parent height (156 here)
// //     decoration: InputDecoration(
// //       contentPadding: EdgeInsets.all(12), // padding inside box
// //       enabledBorder: OutlineInputBorder(
// //         borderSide: BorderSide(
// //           color: Color.fromARGB(255, 154, 175, 228),
// //         ),
// //         borderRadius: BorderRadius.circular(10.0),
// //       ),
// //       focusedBorder: OutlineInputBorder(
// //         borderSide: BorderSide(
// //           color: Color.fromARGB(255, 154, 175, 228),
// //           width: 2.0,
// //         ),
// //         borderRadius: BorderRadius.circular(10.0),
// //       ),
// //     ),
// //   ),
// // )
     
                                                        
             
//             ],)
//                                                    ],
//                                                        ) 
//                                                          );
                                                 
//                                                   },
//                                                 ),
                                         
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                       
                         ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildFooter(context),
                  const SizedBox(height: 10),
                  const Text(
                    'Copyright © 2023 Ashtar App | Terms of Use | Privacy Policy',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color.fromARGB(255, 6, 69, 152),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _navText(String text, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: highlight
              ? const Color.fromARGB(255, 242, 195, 42)
              : const Color.fromARGB(255, 181, 181, 181),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 6, 69, 152),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 24,
                spacing: 24,
                children: [
                  SizedBox(
                    width: screenWidth < 600 ? double.infinity : 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'تواصل معنا',
                          style: TextStyle(
                            color: Color.fromARGB(255, 242, 195, 42),
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/location.png',
                            '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                        const SizedBox(height: 12),
                        _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Phone.png', '+20 106 662 0129'),
                        const SizedBox(height: 12),
                        _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/sms_1.png', 'support@ashtar.app'),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame(14).png'),
                            const SizedBox(width: 12),
                            _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame(13).png'),
                            const SizedBox(width: 12),
                            _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame(12).png'),
                            const SizedBox(width: 12),
                            _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame(11).png'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'حمل التطبيق الان',
                          style: TextStyle(
                            color: Color.fromARGB(255, 242, 195, 42),
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _storeButton('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame(16).png', 'Google play'),
                            const SizedBox(width: 12),
                            _storeButton('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame(15).png', 'App Store'),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth < 600 ? double.infinity : 600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.end,
                          spacing: 24,
                          children: [
                            _navItem('عن أشطر'),
                            _navItem('مصادري'),
                            _navItem('كورساتى'),
                            _navItem('مدرسينا'),
                            _navItem('ذاكر'),
                            _navItem('الرئيسية',
                                color: Color.fromARGB(255, 242, 195, 42),
                                fontSize: 24),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Image.network(
                            'https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Fassets/Group87935.png',
                            width: 80,
                            height: 65.7,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'عن أشطر',
                          style: TextStyle(
                            color: Color.fromARGB(255, 242, 195, 42),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'أشطر معتمدة من كوجنيا واحدة من أكبر المؤسسات التعليمية الدولية فى العالم! أشطر منصة تعليم رقمي قائمة على المناهج الدراسية لطلاب المدارس وبتوفر تجربة تعليمية مخصصة لكل طالب وبتوفرلهم طريقة التعليم المناسبة ليهم',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String iconPath, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        const SizedBox(width: 8),
        Image.network(iconPath, width: 24, height: 24),
      ],
    );
  }

  Widget _icon(String path) {
    return Image.network(path, width: 24, height: 24);
  }

  Widget _storeButton(String iconPath, String label) {
    return Container(
      width: 160,
      height: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.network(iconPath, width: 40, height: 40),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Get it on",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title,
      {Color color = const Color.fromARGB(255, 181, 181, 181),
      double fontSize = 20}) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class MenuDialog extends StatelessWidget {
  const MenuDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(),
    );
  }
}
// class _CountdownTimerState extends State<CountdownTimer> {
  
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }}