
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'home_controller.dart';

class assignment2 extends StatefulWidget {
  const assignment2({super.key});

  @override
  _assignment2ViewerState createState() => _assignment2ViewerState();
}

class _assignment2ViewerState extends State<assignment2> {
  int currentIndex = 1;
  bool trueAnswer = false;
  int ids = 0;
  Map<int, String?> selectedAnswers = {};
  final PageController _pageController = PageController(
    viewportFraction: 0.22,
    initialPage: 1,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectAnswer(int id, String answer) {
    setState(() {
      HomeController controller = HomeController();
      selectedAnswers[id] = answer;
      controller.answerQuestionExam(
        questionId: id,
        studentAnswerExam: answer,
      );
    });
  }

  Widget buildAnswerOption({
    required int id,
    required String optionLetter,
    required String answerText,
    bool isCorrect = false,
    bool isWrong = false,
    required VoidCallback onTap,
  }) {
    Color bgColor = Colors.white;
    Color borderColor = const Color.fromARGB(255, 154, 175, 228);
    Color textColor = const Color.fromARGB(255, 6, 69, 152);

    if (isCorrect) {
      bgColor = const Color.fromARGB(255, 233, 241, 239);
      borderColor = const Color.fromARGB(255, 39, 114, 83);
      textColor = const Color.fromARGB(255, 39, 114, 83);
    } else if (isWrong) {
      bgColor = const Color.fromARGB(255, 254, 236, 235);
      borderColor = const Color.fromARGB(255, 222, 61, 49);
      textColor = const Color.fromARGB(255, 222, 61, 49);
    }

    return
    
     InkWell(
      onTap: onTap,
      child: Container(
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
                  Image.asset('assets/Group87935.png', width: 55),
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
                          Image.asset('icons/Vector_3.png',
                              width: 40, height: 41),
                          Image.asset('icons/Vector_2.png',
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
                            Image.asset('assets/Group87935.png', width: 55),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                        SizedBox(
                          width: 1120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 12),
                              const Text(
                                'اختيار القسم',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32,
                                  color: Color.fromARGB(255, 6, 69, 152),
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'المحاضره للأسبوع الاول',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 80, 124, 181),
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Container(
                              //   width: 1120,
                              //   child: Row(
                              //     children: [],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 1120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'مستوى التقدم فى الماده',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 80, 124, 181),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Text(
                                          '77% مكتمل',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 80, 124, 181),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth,
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      children: [
                                        LinearPercentIndicator(
                                          width: isMobile ? screenWidth : 1120,
                                          lineHeight: 8.0,
                                          barRadius: const Radius.circular(16),
                                          percent: 0.2,
                                          alignment: MainAxisAlignment.end,
                                          isRTL: true,
                                          progressColor: const Color.fromARGB(
                                              255, 77, 195, 44),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),SizedBox(height: 24,),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  // Stack(
                                  //   children: [
                                      Container(
                                        width: 1130,
                                        // height: 904,
                                        padding: EdgeInsets.only(top:24 ,right: 24,left:24 ),
                                        decoration: const BoxDecoration(
                                          color: Colors.white, borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                        ),
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(height: 24,),
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount: controller
                                                      .userquestions.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final question = controller
                                                        .userquestions[index];
                                                    final int id =
                                                        question.id!;
                                                    final teacherAnswer =
                                                        question.teacher_answer;

                                                    final studentAnswer =
                                                        selectedAnswers[id];
                                                    final bool hasAnswered =
                                                        studentAnswer != null;

                                                    return 
                                                    Container(
                                                      width:1070,
                                                      child: 
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                         Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                       
                                                          Text(
                                                          question.name ?? "",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),   Text('0${id}',style: TextStyle(
                                                            fontSize: 18,fontWeight: FontWeight.w500,
                                                            color: Color.fromARGB(255, 154, 175, 228)
                                                        ),),],
                                                        )
                                                        ,
                                                      Container(
                                                        
                                                        child:Column(children: [ buildAnswerOption(
                                                          id: id,
                                                          optionLetter: "أ.",
                                                          answerText: "اوم",
                                                          isCorrect:
                                                              hasAnswered &&
                                                                  teacherAnswer ==
                                                                      "اوم",
                                                          isWrong: hasAnswered &&
                                                              studentAnswer ==
                                                                  "اوم" &&
                                                              teacherAnswer !=
                                                                  "اوم",
                                                          onTap: () =>
                                                              _selectAnswer(
                                                                  id, "اوم"),
                                                        ),

                                                        buildAnswerOption(
                                                          id: id,
                                                          optionLetter: "ب.",
                                                          answerText: "فولت",
                                                          isCorrect:
                                                              hasAnswered &&
                                                                  teacherAnswer ==
                                                                      "فولت",
                                                          isWrong: hasAnswered &&
                                                              studentAnswer ==
                                                                  "فولت" &&
                                                              teacherAnswer !=
                                                                  "فولت",
                                                          onTap: () =>
                                                              _selectAnswer(
                                                                  id, "فولت"),
                                                        ),
                                                        buildAnswerOption(
                                                          id: id,
                                                          optionLetter: "ج.",
                                                          answerText: "امبير",
                                                          isCorrect:
                                                              hasAnswered &&
                                                                  teacherAnswer ==
                                                                      "امبير",
                                                          isWrong: hasAnswered &&
                                                              studentAnswer ==
                                                                  "امبير" &&
                                                              teacherAnswer !=
                                                                  "امبير",
                                                          onTap: () =>
                                                              _selectAnswer(
                                                                  id, "امبير"),
                                                        ),
                                                        buildAnswerOption(
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
                                                                  id, "كولوم"),
                                                        ),
                                                     SizedBox(height: 24,),
                                                          ],) ,width: 1070,),
                                                        Container(width: 1082,height: 91,
            decoration: BoxDecoration(border: Border.all(width: 1,
            color: Color.fromARGB(255, 154, 175, 228))
            ,borderRadius: BorderRadius.circular(8)
            
            ),
            padding: EdgeInsets.fromLTRB(14, 18, 14, 18),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [ Text('الاجابة الصحيحة:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 80, 124, 181))
            ,),
            Text.rich(TextSpan(text: 'وحدة قياس شدة التيار هى',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 80, 124, 181)),children: [TextSpan(text:  '$teacherAnswer',style: TextStyle(
              fontWeight: FontWeight.w600,fontSize: 18,
              color: const Color.fromARGB(255, 6, 69, 152)))] ),)
            ],)
            )
       ,
            SizedBox(height: 24,)                                          ],
                                                       )   );
                                                  },
                                                )
                         ],
                                            ),
                                   Container( width:  double.infinity,
                              child: Container(
                              
                                decoration: BoxDecoration( 
                                   color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.05), 
                  offset: Offset(0, 3), 
                  blurRadius: 13, 
                  spreadRadius: 0, 
                ),],         borderRadius: BorderRadius.circular(10),      border: Border.all(width: 1 ,
                                   color:Color.fromARGB(255, 245, 245, 245)
                                   ,
                                    )
                                   ),
                                padding: const EdgeInsets.fromLTRB(
                                    24, 13, 24, 13),
                                width: 1130,
                                height: 70,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 116,
                                      height: 44,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          padding: const EdgeInsets.fromLTRB(
                                              24, 10, 24, 10),
                                          backgroundColor: const Color.fromARGB(
                                              255, 6, 69, 152),
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset('assets/arrowleft.png',
                                                width: 9.53, height: 20),
                                            const SizedBox(width: 12),
                                            const Text(
                                              'التالي',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    _buildPagination(controller, currentIndex),
                                    const SizedBox(width: 20),
                                    Container(
                                      width: 116,
                                      height: 44,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.fromLTRB(
                                              24, 10, 24, 10),
                                          side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 6, 69, 152),
                                            width: 1,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (currentIndex > 0) {
                                            setState(() {
                                              currentIndex--;
                                            });
                                          }
                                        },
                                        child: const Text(
                                          'لاحق',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 61, 84, 110),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                                                       ],
                                        ),
                                      )
                                    ],
        //                           ),
                                             
        // ],
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
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                        _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/location.png',
                            '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                        const SizedBox(height: 12),
                        _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Phone.png', '+20 106 662 0129'),
                        const SizedBox(height: 12),
                        _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/sms_1.png', 'support@ashtar.app'),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _icon('icons/Frame_14.png'),
                            const SizedBox(width: 12),
                            _icon('icons/Frame_13.png'),
                            const SizedBox(width: 12),
                            _icon('icons/Frame_12.png'),
                            const SizedBox(width: 12),
                            _icon('icons/Frame_11.png'),
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
                            _storeButton('icons/Frame_16.png', 'Google play'),
                            const SizedBox(width: 12),
                            _storeButton('icons/Frame_15.png', 'App Store'),
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
                          child: Image.asset(
                            'assets/Group87935.png',
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
    return Image.asset(path, width: 24, height: 24);
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
          Image.asset(iconPath, width: 40, height: 40),
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
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Align(

      alignment: Alignment.centerRight,
      child: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: isMobile
                ? MediaQuery.of(context).size.width * 0.8
                : 278,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 6, 69, 152),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                    
                    ],
                  ),
                ),
                const Divider(color: Colors.white54),
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.white),
                  title: const Text('Home', style: TextStyle(color: Colors.white)),
                  onTap: () => print('🏠 Home tapped'),
                ),
                      // Image.
              ],
            ),
          ),
        ),
      ),
    );}}