import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/controllers/trueAnswerExam.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
// import 'package:my_app/app/modules/home/views/mainpage%20copy.dart';
import 'package:my_app/app/modules/home/views/menuebar%20paym.dart';
import 'package:my_app/app/modules/home/views/profile%20copy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
import 'package:my_app/app/modules/home/views/textfield.dart';
import '../../../models/wallet.dart';
import 'exam_solve.dart';
import 'wallet_cart.dart';
// class Schedule el malazem extends StatefulWidget {
//   const Schedule el malazem({super.key,});

//   @override
//   State<Schedule el malazem> createState() => _Schedule el malazemState();
// }
class Myquestions extends StatefulWidget {
  const Myquestions({super.key});

  @override
  State<Myquestions> createState() => _MyexamState();
}

class _MyexamState extends State<Myquestions> {
bool isLoading = false;

bool isSelected=true;
//   @override
bool isSelected2=false;
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// // class _Schedule el malazemState extends State<Schedule el malazem> {
// class Myquestions extends StatelessWidget {
   var selectedSection = Rx<String?>(null);
//  final String courseId;
//    final List<dynamic> courseInfos;
  //  wallet({super.key//,required this.courseId,required this.courseInfos
  //  });
  
var selected = false.obs;
 var selected1=false.obs;
 var selected2=false.obs;
 var selected3=false.obs;
 var selected4=false.obs;
// final    selected=false;
int _currentPage=0;
final _maxLengthNotifier = ValueNotifier<int?>(null); 
var selectedMethod=''.obs;
  @override 
  Widget build(BuildContext context) {
  //  final HomeController _controller = HomeController();
  final int _maxLength = 500;
  final FocusNode _focusNode = FocusNode();
//  Color _getCounterColor() {
//     final length = _controller.title.text.length;
//     if (length > _maxLength) return Colors.red;
//     if (length > _maxLength * 0.8) return Colors.orange;
//     return Color.fromARGB(255, 154, 175, 228);
//   }
//   @override
//   void initState() {
//     super.initState();
//     _controller.title.addListener(() {
//       setState(() {});
//     });
//   }

    int _currentPage=0;
  // final screenWidth = MediaQuery.of(context).size.width;
  //   final isMobile = screenWidth < 600;
          // print('eee${courseInfos}');
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

PageController _pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, // ~1 / 4.5
initialPage: 1

);  int currentIndex = 1;
// HomeController controller=HomeController();
// var g=controller.course_info.map((e)=>e.section?.length);
  void scrollToIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

    return Scaffold(
      appBar:isMobile? 
      
      
       AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 6, 70, 152),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
       InkWell( onTap: (){
//  showDialog(
//       context: context,
//       barrierColor: Colors.transparent, 
//       builder: (context) => const Menuebarpaym
//       (),
//     );
       

       }, child:  Icon(Icons.menu, color:Colors.white ,))   
,
              // Buttons
              Row(
                children: [
              Image.asset('assets/Group87935.png', width: 55),
                ],
              ),
            ],
          ),
        )
      
// AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: const Color.fromARGB(255, 6, 70, 152),
//           elevation: 0,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Logo
//               Image.asset(
//                 'assets/logo.png',
//                 height: 40,
//               ),

//               // Buttons
//               Row(
//                 children: [
//                   _buildAppBarButton(
//                     label: 'تسجيل دخول',
//                     onPressed: () {},
//                     backgroundColor: Colors.white,
//                     textColor: const Color.fromARGB(255, 6, 70, 152),
//                   ),
//                   const SizedBox(width: 10),
//                   _buildAppBarButton(
//                     label: 'إنشاء حساب',
//                     onPressed: () {},
//                     backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//                     textColor: const Color.fromARGB(255, 6, 70, 152),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         )
   

   
      
      :AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 85,
        backgroundColor: const Color.fromARGB(255, 6, 69, 152),
        title: Center(
          child: Container(
            // width: screenWidth * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          
                          radius: 24,
                          // backgroundImage: NetworkImage('${controller.img}')==null
                          // ? NetworkImage('${controller.img2}'): NetworkImage('${controller.img}'),
                        ),
                      ),
                    Image.asset('icons/Vector_3.png',width: 40,height: 41,),
                    Image.asset('icons/Vector_2.png',width: 39.02,height: 40,)
                    // _buildButton('تسجيل دخول', isPrimary: true),
                    // const SizedBox(width: 12),
                    // _buildButton('انشاء حساب'),
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
      body:
      
      GetBuilder<HomeController>( builder: (controller){

          // final displayedInfos = controller.course_info.isNotEmpty 
          //     ? controller.course_info 
          //     : courseInfos;
        // print('somone${  controller.course_info.map((toElement)=>toElement.section?.length)}');
    return  LayoutBuilder(
      
        builder: (  BuildContext context, BoxConstraints constraints,) {
// HomeController controller=HomeController();
// print('rrrrrrrrr${controller}')

// controller.3(courseInfos.map((e)=>e['id']).toString());
//  print('wewewe${courseInfos!.map((e)=>e['course_info']?.map((e)=>e['id'])).toString()}');
// controller.fetchcourseinfoid(courseId);
    double cardWidth = 160;
    // Sum all non-null section lengths
int totalSectionsLength = controller.course_info
    .where((e) => e.section != null)  // Filter out null sections
    .fold(0, (sum, e) => sum + (e.section?.length ?? 0));
    int cardsPerRow = (constraints.maxWidth / cardWidth).floor();
          return  SingleChildScrollView(
        child: 
        Column(
          children: [
                Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 242, 195, 42),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    'استخدم كود خصم (ANER) واحصل على خصم على الدروس الخصوصية 36%',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 6, 69, 152),
                      fontSize: isMobile ? 14 : 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
         SizedBox(height: 20,)   
, Container(width: 
isMobile?343 : 1820,    child:Wrap(
  runAlignment: WrapAlignment.start,
            alignment:isMobile?WrapAlignment.center: WrapAlignment.end,
            children: [ 
              Column(crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment:isMobile?MainAxisAlignment.center: MainAxisAlignment.spaceBetween,
               children: [
                 Container( width:!isMobile?852:screenWidth ,height: 1252,
                 padding: EdgeInsets.fromLTRB(40, 48, 40, 48)
,
decoration: BoxDecoration(
  color:Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(16)),
// border: Border.all(width: )
)
,child: 
Wrap(alignment: WrapAlignment.start,
  // crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    
  Container(width:!isMobile ?343:246, height: 110,
  // alignment: Alignment.centerLeft,
 
  child:Text("اسال المدرس"
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 32,fontWeight: FontWeight.w600,
)
 ,),
) 

,
 
 Container(width:isMobile?552: 770//,height: 447,
 ,child: 
     Column( crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 10,
      // runSpacing: 10,
      // alignment: WrapAlignment.center,
      children: [
  
  // Text('الامتحانات اللي عليك',style: TextStyle(
  //   fontSize: 24,
  //   fontWeight: FontWeight.w500,
  // color: Color.fromARGB(255, 6, 69, 152)),)

  // ,
  Wrap(alignment: WrapAlignment.start,children: [ // Stack( children: [
     Container( width:isMobile?552: 770,
     
//  decoration: BoxDecoration(border: Border.all(width: 1,)),
 child:   Wrap(
  spacing: 16,
  alignment: WrapAlignment.start,children: [
 Container( width:isMobile? 263: 552,
 child: 
Container( width: isMobile? 263: 552,

child:Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
Text('اختار الدرس',style: TextStyle(
  fontSize: 16,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 80, 124, 181)),),
 _buildDropdownField(
                  controller,isMobile,
                  "ادخل المادة",
                  controller.semester,
                  controller.allcourse,
                  (newValue) {
                    controller.semester.value = newValue;
                    print("Selected course: ${controller.semester.value}");
                  },
                ),
 SizedBox(height: 24,),
 controller.semester.value!=null?
 Container(
  // decoration: BoxDecoration(color: Colors.blue),
   width:isMobile?343: 552, child: Column(crossAxisAlignment:
    CrossAxisAlignment.start, spacing: 16, children: [
    
Text('اسال سؤالك',style: TextStyle(
  fontSize: 16,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 80, 124, 181)))
 ,
 Column(children: [
   Stack( children: [
     Container( width :552,height: 370,
decoration: BoxDecoration(
  border: Border.all(width: 1,color:Color.fromARGB(255, 80, 124, 181) )
  ,borderRadius: BorderRadius.circular(8),
  color: Colors.white
  )


,child:

 InlineCounterTextFieldScreen(),) ,


  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      // padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      // decoration: BoxDecoration(
                        // color: _getCounterColor().withOpacity(0.1),
                        // borderRadius: BorderRadius.circular(10),
                        // border: Border.all(
                          // color: _getCounterColor().withOpacity(0.3),
                          // width: 1,
                      //   ),
                      // ),
                      child: Text(
                        '$_maxLength',
                        style: TextStyle(
                          fontSize: 16,color: Color.fromARGB(255, 154, 175, 228),
                          fontWeight: FontWeight.w400,
                          // color: _getCounterColor(),
                        ),
                      ),
                    ),
                  
              
      
    )])])

    ,
 
 SizedBox(height:24)  ,
//  SizedBox(
//   width: 552,
//   height: 44,
//   child: TextButton(
// onPressed: isLoading ? null : () async {
//   print('object');
//   setState(() => isLoading = true);
//   try {
//     await controller.studentQues(
//       name: controller.semester.value.toString(),
//       context: context,
//     );
//   } catch (e) {
//     print("Error: $e");
//   }
//   setState(() => isLoading = false);
// },
//   style: TextButton.styleFrom(
//     backgroundColor: const Color.fromARGB(255, 6, 69, 152),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(8),
//     ),
//   ),
//   child: const Text(
//     'حفظ',
//     style: TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w600,
//       color: Colors.white,
//     ),
//   ),
// ),
// ),
 
],),)
 :Container()
 ])
  
 
   ), 
   
   
    // ListView(
    //     children: const [
   
        // ],
      // ), .    
     )
     
     ],) 
  ),
  controller.semester.value!=null? 
   SizedBox(
  width:isMobile? 263: 552 ,
  height: 44,
  child: TextButton(
onPressed:  () async {
 
 print('${ controller.semester.value.toString()}');
    await controller.studentQues(
      name: controller.semester.value.toString(),
      context: context,
    );

},
  style: TextButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 6, 69, 152),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: const Text(
    'حفظ',
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
),
)
:Container() ])
  ]))
  //    Container( width: 1120,
  //                             child: Container(
                              
  //                               decoration: BoxDecoration( 
  //                                  color: Color.fromARGB(255, 255, 255, 255),
  //                   boxShadow: [BoxShadow(
  //                 color: Colors.black.withOpacity(0.05), 
  //                 offset: Offset(0, 3), 
  //                 blurRadius: 13, 
  //                 spreadRadius: 0, 
  //               ),],         borderRadius: BorderRadius.circular(10),      border: Border.all(width: 1 ,
  //                                  color:Color.fromARGB(255, 245, 245, 245)
  //                                  ,
  //                                   )
  //                                  ),
  //                               padding: const EdgeInsets.fromLTRB(
  //                                   24, 13, 24, 13),
  //                               width: 1130,
  //                               height: 70,
  //                               child: Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   Container(
  //                                     width: 116,
  //                                     height: 44,
  //                                     child: ElevatedButton(
  //                                       style: ElevatedButton.styleFrom(
  //                                         shape: RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(8),
  //                                         ),
  //                                         padding: const EdgeInsets.fromLTRB(
  //                                             24, 10, 24, 10),
  //                                         backgroundColor: const Color.fromARGB(
  //                                             255, 6, 69, 152),
  //                                       ),
  //                                       onPressed: () {

  //  if (_currentPage > 1) {
  //       setState(() {
  //         _currentPage--;
  //       });
  //       controller.fetchCodes(page: _currentPage);
  //     }
  //                                       },
  //                                       child: Row(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.center,
  //                                         children: [
  //                                           Image.asset('assets/arrowleft.png',
  //                                               width: 9.53, height: 20),
  //                                           const SizedBox(width: 12),
  //                                           const Text(
  //                                             'التالي',
  //                                             style: TextStyle(
  //                                               fontWeight: FontWeight.w500,
  //                                               fontSize: 18,
  //                                               color: Color.fromARGB(
  //                                                   255, 255, 255, 255),
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   const SizedBox(width: 20),
  //                                   _buildPagination(controller, currentIndex),
  //                                   const SizedBox(width: 20),
  //                                   Container(
  //                                     width: 116,
  //                                     height: 44,
  //                                     child: ElevatedButton(
  //                                       style: ElevatedButton.styleFrom(
  //                                         padding: const EdgeInsets.fromLTRB(
  //                                             24, 10, 24, 10),
  //                                         side: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 6, 69, 152),
  //                                           width: 1,
  //                                         ),
  //                                         shape: RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(8),
  //                                         ),
  //                                       ),
  //                                       onPressed: () {
  //                                            if (_currentPage < 10) { // افترضنا أن هناك 10 صفحات كحد أقصى
  //       setState(() {
  //         _currentPage++;
  //       });
  //       controller.fetchCodes(page: _currentPage);
  //     }
  //                                       },
  //                                       child: const Text(
  //                                         'لاحق',
  //                                         style: TextStyle(
  //                                           color: Color.fromARGB(
  //                                               255, 61, 84, 110),
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   )
  //                                 ],
  //                               ),
  //                             ),
  //                           ), 
  ]))
// , SizedBox(
//   width: 552,
//   height: 44,
//   child: TextButton(
// onPressed: isLoading ? null : () async {
//   print('object');
//   setState(() => isLoading = true);
//   try {
//     await controller.studentQues(
//       name: controller.semester.value.toString(),
//       context: context,
//     );
//   } catch (e) {
//     print("Error: $e");
//   }
//   setState(() => isLoading = false);
// },
//   style: TextButton.styleFrom(
//     backgroundColor: const Color.fromARGB(255, 6, 69, 152),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(8),
//     ),
//   ),
//   child: const Text(
//     'حفظ',
//     style: TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w600,
//       color: Colors.white,
//     ),
//   ),
// ),
// ),
 
])


,SizedBox(width: 100,)  ,isMobile?
Container():RightSidebar()

]))


// , Container( width: 772,child: Container( child:  Column( crossAxisAlignment: CrossAxisAlignment.start,  children: [
//     Container(child: Text('الصورة الشخصية',style: TextStyle(
//       fontSize: 32,fontWeight: FontWeight.w600,
//       color: Color.fromARGB(255, 6, 69, 152)),)
//   ,),
// Container(width: 724,height: 130,child: Column(
  
  
//   children: [
// Container(width: 676,
// child:Row(
  
//   mainAxisAlignment: MainAxisAlignment.start
//   ,
//   children: [
// // Container(width: 60,height: 60 ,child:  CircleAvatar(
  
// //   backgroundImage: AssetImage('assets/p-image.jpg',),
//   Container(width: 513, child:Column(spacing: 8,
//   crossAxisAlignment: CrossAxisAlignment.end,
//   children: [
// Text('صورتك الشخصية',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
// ,fontWeight:FontWeight.w500,fontSize: 24 
// ),)

// ,Text(textAlign: TextAlign.end,
//   'الصورة الشخصية لازم تكون بصيغة jpg, jpeg, png و متكونش اكبر من 800px طول او عرض'
//   ,style: TextStyle(color: Color.fromARGB(255, 80, 124, 181),
//    fontWeight: 
//    FontWeight.w400
//   ,fontSize: 14
//   ),
//   )  ],) ,),
//   Container(
//   width: 60,
//   height: 60,
//   child: ClipOval(
//     child: Image.asset(
//       'assets/p-image.jpg',
//       fit: BoxFit.cover, // This ensures the image covers the entire circle
//       width: 60,
//       height: 60,
//     ),
//   // ),
// // )
//   ),
// )


// ]))
// ,
// Container(width: 394,height: 44,   child: 
// TextButton(onPressed: (){}, child: Text('تعديل البيانات',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
// style:TextButton.styleFrom(
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//   backgroundColor: Color.fromARGB(255, 6, 69, 152)))
// ,

// )
// ],),)
// ],),))







       
            
            // const SizedBox(height: 20),
      
     ,
                  

         
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
            const SizedBox(height: 10),])    );
    });}));
  }


Widget _buildDropdownField(
   controller,isMobile,
  String hint,
  Rx<String?> value,
  List<Course> items,
  Function(String?) onChanged,
)  {
  controller.fetchSAllCourses();
  return Container(
    width:isMobile?263: 552,decoration: BoxDecoration(color: Colors.white
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 16),
       Container(height: 44,child:     Directionality(
          textDirection: TextDirection.rtl,
          child: DropdownButtonFormField<String?>(
            value: value.value,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              hintTextDirection: TextDirection.rtl,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 154, 175, 228),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 154, 175, 228),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 6, 69, 152),
            ),
            isExpanded: true,
            items: [
              DropdownMenuItem<String?>(
                value: null,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    hint,
                    style: const TextStyle(
                      fontSize: 16,
                      color:  Color.fromARGB(255, 154, 175, 228),
                    ),
                  ),
                ),
              ),
                ...items.map((Course course) {
                return DropdownMenuItem<String?>(
                value: course.name ?? 'Unknown',
                child: Text(course.name ?? 'Unknown',
                style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 154, 175, 228),
                      ),
                    
                  ),
                );
              }).toList(),
            ],
            onChanged: (newValue) {
              onChanged(newValue);
            },
          ),
        ),
      ) 
   ],
    ),
  );
}

//   Widget _buildDropdownField(
//   HomeController controller,
//   String hint,
//   Rx<String?> value,
//   List<String> items,
//   Function(String?) onChanged
// ) {
//   return Container(
//     width: 505,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         // Text(
//         //   label,
//         //   style: const TextStyle(
//         //     fontSize: 16,
//         //     fontWeight: FontWeight.w500,
//         //     color: Color.fromARGB(255, 6, 69, 152),
//         //   ),
//         // ),
//         const SizedBox(height: 16),
//         Directionality(
//           textDirection: TextDirection.rtl,
//           child: DropdownButtonFormField<String>(
//             value: value.value,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               hintText: hint,
//               hintTextDirection: TextDirection.rtl,
//               border: OutlineInputBorder(
//                 borderSide: const BorderSide(
//                   color: Color.fromARGB(255, 154, 175, 228),
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(
//                   color: Color.fromARGB(255, 154, 175, 228),
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             icon: const Icon(
//               Icons.keyboard_arrow_down,
//               color: Color.fromARGB(255, 6, 69, 152),
//             ),
//             isExpanded: true,
//             items: [
//               // Add a null item as the first option
//               DropdownMenuItem<String>(
//                 value: null,
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     hint,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//               ),
//               // Add the actual items
//               ...items.map((String item) {
//                 return DropdownMenuItem<String>(
//                   value: item,
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Text(
//                       item,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ],
//             onChanged: onChanged,
//           ),
//         ),
//       ],
//     ),
//   );
// }Widget _buildAppBarButton({
//     required String label,
//     required VoidCallback onPressed,
//     required Color backgroundColor,
//     required Color textColor,
//   }) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         foregroundColor: textColor,
//         backgroundColor: backgroundColor,
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//           side: BorderSide(color: textColor),
//         ),
//         textStyle: const TextStyle(fontWeight: FontWeight.bold),
//         elevation: 0,
//       ),
//       child: Text(label),
//     );
//   }
 
   
  Widget _buildButton(String text, {bool isPrimary = false}) {
    return Container(
      height: 50,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor:
              isPrimary ? Colors.white : Colors.transparent,
          side: isPrimary
              ? null
              : const BorderSide(color: Colors.white),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: isPrimary ? const Color.fromARGB(255, 6, 69, 152) : Colors.white,
          ),
        ),
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
    // padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1280),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
// SizedBox(height: 16,),
           Container(
                      padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                      child:    Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 24,
              spacing: 24,
              children: [
                // Column: Contact Us Section
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
                      // _buildInfoRow('icons/location.png',
                      //     '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/sms_1.png', 'support@ashtar.app'),
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
                mainAxisAlignment: MainAxisAlignment.end,        children: [
                          _storeButton('icons/Frame_16.png', 'Google play'),
                          const SizedBox(width: 12),
                          _storeButton('icons/Frame_15.png', 'App Store'),
                        ],
                      )
                    ],
                  ),
                ),

                // Column: About Section
                SizedBox(
                  width: screenWidth < 600 ? double.infinity : 600,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                      child:   Wrap(
                        
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
                      ),),
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
            ),)
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
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.right,
          ),
        ],
      ),
      const SizedBox(width: 8),
      Image.asset(iconPath, width: 24, height: 24),
    ],
  );
}

Widget _icon(String path) {
  return Image.asset(path, width: 24, height: 24);
}
 Widget menuButton(BuildContext context, String label, Color bgColor, Color textColor) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          // Add navigation here if needed
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(color: textColor),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
  
  
  
  
  
  }

class _MenuItem extends StatelessWidget {
  final String title;
  final bool isActive;
  const _MenuItem({required this.title, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white.withOpacity(0.7),
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
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
            Text("Get it on", style: TextStyle(fontWeight: FontWeight.w600)),
            Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
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


Widget _buildPagination(controller, int currentPage) {
    int currentIndex = 1;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(10, (index) {
      final pageIndex = index + 1;
      return GestureDetector(
        onTap: () {
          // setState(() {
            currentIndex = pageIndex;
            controller.fetchCodes(page: pageIndex,); // Fixed: pass pageIndex instead of currentPage
            controller.update();
          // });
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
// import 'package:flutter/material.dart';

class ExamCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String buttonText;
  final VoidCallback onPressed;

  const ExamCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          children: [
            // الصورة
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              child: Image.asset(
                "assets/exam.png", // ضع صورة الامتحان هنا
                width: 120,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // باقي المحتوى
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.date_range, size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(date, style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(time, style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: onPressed,
                        child: Text(buttonText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ExamCards extends StatelessWidget {
  const ExamCards({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 215, // نفس العرض من Figma
      height: 91, // خليته أكبر علشان يستوعب المحتوى
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.only(topLeft: e,topRight: ),
        gradient: const LinearGradient( // من Figma old blue linear
          colors: [
            Color.fromRGBO(6, 69, 152, 0.884),   // rgba(6,70,152,1)
            Color.fromRGBO(118, 162, 212, 0.952) // rgba(118,162,212,1)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 🖼️ الصورة فوق
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8),
          //   child: Image.network(
          //     "https://via.placeholder.com/215x91", // حط لينك/asset الصورة
          //     height: 60,
          //     width: double.infinity,
          //     fit: BoxFit.cover,
          //   ),
          // ),

          const SizedBox(height: 8),

          // 📌 النصوص
          const Text(
            "امتحان الشهر 8",
textDirection: TextDirection.rtl,            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 242, 195, 42),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 4),

          const Text(
            "اونلاين",
            style: TextStyle(
          fontWeight: FontWeight.w400 ,    fontSize: 14,
              color: Colors.white70,
            ),textDirection: TextDirection.rtl, 
            textAlign: TextAlign.center,
          ),

          const Spacer(),

          // 🔘 زر "ابدأ دلوقتي"
     ],
      ),
        );
  }
}
