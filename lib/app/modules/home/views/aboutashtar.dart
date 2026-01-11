// import 'dart:js_interop';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:get/get.dart';
import 'package:my_app/app/models/wallet.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
// import 'package:my_app/app/modules/home/views/mainpage%20copy.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjects.dart';
import '';

class Aboutashtar extends StatelessWidget {

   
   Aboutashtar({super.key,
   });


  //  subject({super.key,required this. courseId});





final PageController _pageController=PageController(
    viewportFraction: 0.22, // ~1 / 4.5
initialPage: 1

);

final int _currentPage=0;
  @override
  Widget build(BuildContext context) {


  void scrollToIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
  HomeController controller=HomeController();
final lengths = controller.courses2
    .map((course) => course.course_info?.length ?? 0)
    .toList();
final result = controller.courses2
    .map((e) => e.course_info?.length ?? 0)
    .toList();

    //     final courseInfos = controller.courses2
    // .map((sc) => sc.course_info) // get the student_course list
    // .where((list) => list != null) // ignore nulls
    // .expand((list) => list!)
    
    
    //  // flatten into a single list
    // // .map((course) {
    // //   print('course item: $course'); // debug
    // //   return course['course']?['course_info'];
    // // })
    // // .where((info) => info != null)
    // .toList();
    // print('nnn$courseInfos');

// print(courseInfos);
// print('Length: ${courseInfos.length}');
// controller.fetchcourseinfo(controller.course.map((id)=>id.id).toString());
final lengths2 = controller.courses2
    .map((e) => e.course_info?.length ?? 0) // map to lengths, handle null
    .toList();
    // print('222${lengths2}');
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
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
 showDialog(
      context: context,
      barrierColor: Colors.transparent, 
      builder: (context) => const MenuDialog(),
    );
       

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
                    SizedBox(
                        
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          
                          radius: 24,
                          // backgroundImage: NetworkImage('${controller.img}')==null
                          // ? NetworkImage('${controller.img2}'): NetworkImage('${controller.img}'),
                        ),
                      ),
                    Image.asset('icons/Vector(3).png',width: 40,height: 41,),
                    Image.asset('icons/Vector(2).png',width: 39.02,height: 40,)
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
      body:GetBuilder(init: HomeController()

      ,builder: (controller){
           final controller = Get.put(HomeController());
    
    // // Use initial data if available, otherwise fetch
    // if (initialCourseData != null) {
    //   controller.courses2 = [initialCourseData!];
    // } else {
      // controller.fetchcourseinfo(courseId);
    // }
        return SingleChildScrollView(
        child: Column(
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
           
     
            // Wrap(
            //   spacing: 16,
            //   runSpacing: 16,
            //   alignment: WrapAlignment.center,
            //   children: [
    
  SizedBox(height: 24,)
        ,
          SizedBox( width: 1123, child:Column(
            spacing: 24,
            children: [
          Container(child: Row(spacing: 1,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
         Text('اختار الاقسام',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)),)
            ,
            
            Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),)
      ,
           
            Text('اختار نشاطك',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),)
          
          
            ,  Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),),
            Text('الفيزياء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),)
            ,  Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),),
             Text('الصف الثالث الثانوي',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),
            
            ),  Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
            (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181))),
            Text('الرئيسية',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),
          ), 
          
          ],),)  
           ,
          //  Container(width:1121,child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //   Text('اختيار القسم',textAlign: TextAlign.end,style: TextStyle(fontWeight: FontWeight.w600,
          //  fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)),)
          //  ,Container(width: 1121,child:Row(spacing: 16, children: [
          //   // Image.asset('assets/')
          //  ],) ,)
           
          //  ],)),
      
     
   
     
    Container(
     padding: EdgeInsets.fromLTRB(40, 48, 40,48), 
     decoration: BoxDecoration(
     color: Color.fromARGB(255, 255, 255, 255)
     ,borderRadius: BorderRadius.circular(8)
      ),
      width: 1119, child: Column(
        spacing: 24,
        children: [
     Wrap(
                 spacing: 16, 
                  alignment: WrapAlignment.end,
                  children: [  
            Container(width:1039,child: Wrap(alignment: WrapAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            Text('عن اشطر',textAlign: TextAlign.end,style: 
            TextStyle(fontWeight: FontWeight.w600,
           fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)),)
           ,Container(width: 1039,child:Wrap(spacing: 16, children: [
            // Image.asset('assets/')
            Text(textAlign: TextAlign.end,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),fontSize: 18,fontWeight: FontWeight.w400), 'أشتار (Ashtar) هو تطبيق تعليمي مبتكر مصمم لدعم الطلاب والمعلمين في العملية التعليمية باستخدام التكنولوجيا الحديثة. يُعد التطبيق منصة تعليمية شاملة تهدف إلى توفير تجربة تعلم متكاملة، حيث تجمع بين التعليم الأكاديمي، وتطوير المهارات، وتحفيز الطلاب على التعلم بطرق مرنة وممتعة.')
           ],) ,)
           
           ],)),
    
        Container(width: 1039,height: 303, child: Row(
            spacing: 60,mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Image.asset('assets/Frame2.png',width: 205,height: 200,)
              ,
             Stack(children: [Image.asset('assets/Group23.png',width: 205,height: 1000,)
             
           ,   Positioned( top: 115.09,left: 0,
                
                child: Image.asset('assets/Group2.png',width:205,height: 139.66,))
              ,
             
             ],
             ) 
              ,
              // Positioned( top: 157.03,left: 3.84,
                
              //   child: Image.asset('assets/Group2.png',width:205,height: 139.66,))
              // ,
              // Positioned( top: 115.09,left: 52.42,
                
              //   child: Image.asset('assets/1.png',width:35.23,height: 35.23,))
              // ,
             
              // // Positioned( top: 115.09,left: 52.42,
                
              // //   child: Image.asset('assets/1.png',width:35.23,height: 35.23,))
              // // ,
              // Positioned( top: 204.46,left: 0,
                
              //   child: Image.asset('assets/5.png',width:205,height: 18.36,))
              // ,
              // Positioned( top: 125.67,left: 117.66,
                
              //   child: Image.asset('assets/3.png',width:27.29,height: 27.33,))
              // ,
              // Positioned( top: 142.93,left: 78.95,
                
              //   child: Image.asset('assets/2.png',width:27.33,height: 27.33,))
              // ,
              // Positioned( top: 157.03,left: 3.84,
                
              //   child: Image.asset('assets/4.png',width:197.31,height: 56.4,))
              
              Image.asset('assets/Frame12.png',width: 200,height: 200,)
              ,
              
              
              ],),)])
              ,Container(
                width: 1039,
                child: Wrap(
                  spacing: 8,alignment: WrapAlignment.end,
                  children: [
                  Text(textAlign: TextAlign.end ,  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 6, 69, 152)) ,'1  منهاج تعليمي متكامل: يوفر أشتار مناهج تعليمية متوافقة مع المعايير العالمية والمحلية، تشمل مواضيع مختلفة مثل الرياضيات، العلوم، اللغات، والتكنولوجيا.'),     
                  Text(textAlign: TextAlign.end , 
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 6, 69, 152))  ,
                    '2  سهولة الوصول: يُمكن للطلاب الوصول إلى المواد التعليمية في أي وقت ومن أي مكان، سواء عبر الهواتف الذكية أو الأجهزة اللوحية.')
                 , Text(textAlign: TextAlign.end ,  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 6, 69, 152)),'3  دروس تفاعلية: يحتوي التطبيق على محتوى تفاعلي مثل الفيديوهات، الألعاب التعليمية، والاختبارات التفاعلية التي تُحفز الطلاب على التعلم.') 
              ,Text( textAlign: TextAlign.end , style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 6, 69, 152)),'4  دعم المعلمين: يوفر أشتار أدوات للمعلمين لتخطيط الدروس، تقييم أداء الطلاب، وتقديم ملاحظات فورية لتحسين نتائج التعلم.')
              ,Text(textAlign: TextAlign.end ,  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 6, 69, 152)),'5   إدارة الوقت والمهام: يساعد الطلاب في تنظيم وقتهم ومتابعة تقدمهم من خلال تقارير دورية وإشعارات مخصصة.')
             , Text(textAlign: TextAlign.end , style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 6, 69, 152)),'6  تعدد اللغات: يُقدم محتوى بلغات متعددة لدعم الطلاب من خلفيات مختلفة.')
              ,Container(width: 1119,child: Column(spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Text('الدعم الفني',style: TextStyle(
                  color: Color.fromARGB(255, 6, 69, 152)
                  ,fontSize:32,fontWeight: FontWeight.w600
                  ),textAlign:TextAlign.end,)

                  ,Container( child: 
                  Row(spacing: 12,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
               
             Text(
              textAlign: TextAlign.end,
              '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬ 4234006',
             style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),fontSize: 18,fontWeight: FontWeight.w500),
             
             
             ),         
                           Icon(
                    
                      Icons.location_pin,color: Color.fromARGB(255, 6, 69, 152),)
                      
             ,  ],),
                      
                      
                      )
           
                  ,Container( child: 
                  Row(spacing: 12,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
             Text(
              textAlign: TextAlign.end,
              '+20 106 662 0129',
             style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),fontSize: 18,fontWeight: FontWeight.w500),
             
             
             ),         Icon(
                    
                      Icons.mobile_screen_share,color: Color.fromARGB(255, 6, 69, 152),)
                      
             ,
                      ],),
                      
                      
                      )
             
             
                  ,Container( child: 
                  Row(spacing: 12,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
             Text(
              textAlign: TextAlign.end,
              'support@ashtar.app',
             style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),fontSize: 18,fontWeight: FontWeight.w500),
             
             
             ),         Icon(
                    
                      Icons.email,color: Color.fromARGB(255, 6, 69, 152),)
                      
             ,
                      ],),
                      
                      
                      )
             
             
                  ,Container( child: 
                  Row(//spacing: 12,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
        //           IconButton(
        //   icon: FaIcon(FontAwesomeIcons.facebookF, color:  Color.fromARGB(255,6,69,152), size: 20),
        //   onPressed: () {
        //   },
        // ),
        //           IconButton(
        //   icon: FaIcon(FontAwesomeIcons.youtube, color:  Color.fromARGB(255,6,69,152), size: 20),
        //   onPressed: () {
        //   },
        // )
        //      , IconButton(
        //   icon: FaIcon(FontAwesomeIcons.instagram, color: Color.fromARGB(255,6,69,152), size: 20),
        //   onPressed: () {
        //   },
        // )
        //      , IconButton(
        //   icon: FaIcon(FontAwesomeIcons.facebookMessenger, color: Color.fromARGB(255,6,69,152), size: 20),
        //   onPressed: () {
        //   },
        // )
        //      , IconButton(
        //   icon: FaIcon(FontAwesomeIcons.tiktok, color: Color.fromARGB(255,6,69,152), size: 20),
        //   onPressed: () {
        //   },
        // ),
                      
                      ],),
                      
                      
                      )
             
             
              ],),)
              ],),)
// ...List.generate(
//   courseInfos.length,
//   (index) {

//     // print(courseInfos.length)
//     final info = courseInfos[index];
//     return InkWell(
//       onTap: () async {
 
// await      FutureBuilder<bool>(
//       future: controller.usedEnrollmentsection( courseInfos.map((e)=>e['section']?.map((e)=>e['id']).join()).join(),
//       ),   builder: (context, snapshot) {
//         bool enrolled = snapshot.data ?? false;
        
//         return Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: Image.asset('assets/lecturecard.png', width: 268, height: 396),
//             ),
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   color: const Color.fromARGB(1, 255, 255, 255),
//                 ),
//               ),
//             ),
//             // _buildLectureCardHeader(controller, sectionIndex),
//             // _buildLectureCardButton(context, controller, sectionIndex, enrolled),
//           ],
//         );
//       },
//     );
 
//     //  print('pppp${courseInfos[index]['id']}');
//     //  var ci=courseInfos[index]['id'];
//           // print('wewewe${courseInfos!.map((e)=>e['course_info']?.map((e)=>e['id'])).toString()}');
//     // controller.checkEnrollment(courseId);      // print('wewewe${courseInfos![index]['course_info'][index]['id'].toString()}');
//         // Fetch course info by ID
//         // await controller.fetchcourseinfoid('${courseInfos!.map((e)=>e['course_info'].map((e)=>e['id']))}');
//         // print('yyy${info[index]['course_info']}');
//         // Get the filtered course info
//         final filteredCourseInfos = controller.course_info
//             .where((c) => c.id == info['id'].toString())
//             .expand((c) => c.section ?? [])
//             .toList();
            
//         // print('Course ID: ${filteredCourseInfos}');
        
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Subjects(
//               courseId:ci.toString(),
//               courseInfos: courseInfos,
//             ),
//           ),
//         );
//       },
      
//       child: _buildClassCard(
//         info['course_num'].toString(),
//         'assets/Frame 1597882438 (5).png',
//         context,
//         true, // isMobile
//       ),
//     );
//   },
// ),
    

                //  ...List.generate(lengths.length,(index){
// print('wwwh:$lengths',);
// return Container();
//                   controller.fetchcourseinfo(controller.courses2[index].id.toString());
// //  return     
//                 ...List .generate(controller.courses2
//     .map((c) => c.course_info?.length ?? 0) // null-safe
//     .toList().length,(index){
//         print('yyy${controller.courses2
//     .map((c) => c.course_info?.length ?? 0) 
     
//       }',);
      
//                   // print('objects:${controller.courses2[index].course_info?[index]['course_num']}');
//                 controller.fetchcourseinfo( controller.courses2[index].course_info![index]['id'].toString());

// // print('222${lengths2.length}');
//    return      InkWell(
//                     onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context){return  Subjects();})) ;  
//                     },
//                     child:                 _buildClassCard('${controller.courses2[index].course_info?[index]['course_num'].toString()}', 'assets/Frame 1597882438 (5).png',context,isMobile)
//          );
//                 })
            // SizedBox(height: 24,);
                // _buildClassCard('القسم التاني', 'assets/Frame 1597882438@2x.png',context,isMobile),
                // _buildClassCard('القسم الاول', 'assets/Frame 1597882438.png',context,isMobile),
                
// Wrap(
//                  spacing: 16, 
//                   alignment: WrapAlignment.center,
//                   children: [ InkWell(
//                     onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context){return  Subjects();})) ;  
//                     },
//                     child:
                    
//                 _buildClassCard('قسم الدروس المتنوعه', 'assets/Frame 1597882438 (3).png',context,isMobile),)  ,
//                 _buildClassCard('القسم السادس','assets/Frame 1597882438 (1).png',context,isMobile),
//                 _buildClassCard('القسم الخامس', 'assets/Frame 1597882438 (2).png',context,isMobile),
//                 ],),
       
      
            ]))]),),
      
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
        
   ]));}));
  }
  Widget _buildAppBarButton({
    required String label,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: textColor),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        elevation: 0,
      ),
      child: Text(label),
    );
  }
 
   
  Widget _buildButton(String text, {bool isPrimary = false}) {
    return SizedBox(
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

   Widget _buildClassCard(String title, String imagePath,context,bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
    
      child: Column(
        children: [
          Container(
             
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 212, 221, 232),
        borderRadius: BorderRadius.circular(16),
      ),
            height: 150,width:isMobile? 362.67:300,
            padding: const EdgeInsets.all(8),
            child: Image.asset(imagePath),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Color.fromARGB(255, 6, 69, 152),
              ),
            ),
          ),
        ],
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

  // Widget _buildClassCard(String title, String imagePath) {
  //   return Container(
  //     width: 362,
  //     decoration: BoxDecoration(
  //       color: const Color.fromARGB(255, 212, 221, 232),
  //       borderRadius: BorderRadius.circular(16),
  //     ),
  //     child: Column(crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Container(
  //           height: 150,
  //           padding: const EdgeInsets.all(8),
  //           child: Image.asset(imagePath, fit: BoxFit.contain),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Text(
  //             title,
  //             style: const TextStyle(
  //               fontWeight: FontWeight.w600,
  //               fontSize: 20,
  //               color: Color.fromARGB(255, 6, 69, 152),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildTeacherInfo(bool isMobile,screenWidth) {
    return Container(
width: !isMobile?1120:screenWidth,      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset('assets/Frame(10).png', width: 43, height: 40),
          const SizedBox(height: 8),
          const Text(
            'الأستاذ شريف البدري',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 6, 69, 152),
            ),
            textAlign: TextAlign.right,
          ),
          const Text(
            'مدرس ماده العلوم',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 6, 69, 152),
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 16),
          const Text(
            'أستاذ العلوم المميز: حاز على شهادة التخرج من كلية الآداب والتربية بتقدير امتياز مع مرتبة الشرف، ويتمتع بخبرة واسعة تمتد لثلاثين عامًا في ميدان تدريس اللغة العربية. يتميز بتدريس مناهج الثانوية العامة بكل دقة واهتمام، وقد أُطلِق عليه لقب "صانع الأوائل" نظرًا لتفانيه الدائم وجهوده الحثيثة في تحفيز وتوجيه طلابه نحو تحقيق النجاح والتفوق. ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 80, 124, 181),
            ),
            textAlign: TextAlign.right,
          ),
        ],
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
                      _buildInfoRow('icons/location.png',
                          '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/sms(1).png', 'support@ashtar.app'),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _icon('icons/Frame(14).png'),
                          const SizedBox(width: 12),
                          _icon('icons/Frame(13).png'),
                          const SizedBox(width: 12),
                          _icon('icons/Frame(12).png'),
                          const SizedBox(width: 12),
                          _icon('icons/Frame(11).png'),
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
                          _storeButton('icons/Frame(16).png', 'Google play'),
                          const SizedBox(width: 12),
                          _storeButton('icons/Frame(15).png', 'App Store'),
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
  }}

class _MenuItem extends StatelessWidget {
  final String title;
  final bool isActive;
  const _MenuItem({required this.title, required this.isActive});

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


