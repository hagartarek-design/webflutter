// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:get/get.dart';
// import 'package:my_app/app/modules/home/controllers/home_controller.dart';
// import 'package:my_app/app/modules/home/controllers/subjectbooks2.dart';
// // import 'package:my_app/app/modules/home/views/mainpage%20copy.dart';
// import 'package:my_app/app/modules/home/views/schedule_center.dart';
// import 'package:my_app/app/modules/home/views/subject.dart';
// import 'package:my_app/app/modules/home/views/subjecttype.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'Schudle_for_the_exam .dart';
// class SchudleForTheExam  extends StatefulWidget {
//   const SchudleForTheExam ({super.key});

//   @override
//   State<SchudleForTheExam > createState() => _HomeafterloginState();
// }

// class _HomeafterloginState extends State<SchudleForTheExam > {

// int _currentPage=0;

// bool isSelected=true;
// bool isSelected2=false;

// PageController _pageController=PageController(
//     viewportFraction: 0.22, // ~1 / 4.5
// initialPage: 1

// );
// // int _currentPage=0;
//   @override
//   Widget build(BuildContext context) {

//   int currentIndex = 1;
//   void scrollToIndex(int index) {
//     _pageController.animateToPage(
//       index,
//       duration: Duration(milliseconds: 400),
//       curve: Curves.easeInOut,
//     );
//   }
// int _currentPage=0;

//     final screenWidth = MediaQuery.of(context).size.width;
//     final isMobile = screenWidth < 600;
//     return Scaffold(
//       appBar:isMobile? 
      
      
//        AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: const Color.fromARGB(255, 6, 70, 152),
//           elevation: 0,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Logo
//        InkWell( onTap: (){
//  showDialog(
//       context: context,
//       barrierColor: Colors.transparent, 
//       builder: (context) => const Subjecttype(),
//     );
       

//        }, child:  Icon(Icons.menu, color:Colors.white ,))   
// ,
//               // Buttons
//               Row(
//                 children: [
//               Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Group 87935.png', width: 55),
//                 ],
//               ),
//             ],
//           ),
//         )
      
// // AppBar(
// //           automaticallyImplyLeading: false,
// //           backgroundColor: const Color.fromARGB(255, 6, 70, 152),
// //           elevation: 0,
// //           title: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               // Logo
// //               Image.network(
// //                 'https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/logo.png',
// //                 height: 40,
// //               ),

// //               // Buttons
// //               Row(
// //                 children: [
// //                   _buildAppBarButton(
// //                     label: 'تسجيل دخول',
// //                     onPressed: () {},
// //                     backgroundColor: Colors.white,
// //                     textColor: const Color.fromARGB(255, 6, 70, 152),
// //                   ),
// //                   const SizedBox(width: 10),
// //                   _buildAppBarButton(
// //                     label: 'إنشاء حساب',
// //                     onPressed: () {},
// //                     backgroundColor: const Color.fromARGB(255, 255, 255, 255),
// //                     textColor: const Color.fromARGB(255, 6, 70, 152),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         )
   

   
      
//       :AppBar(
//         automaticallyImplyLeading: false,
//         toolbarHeight: 85,
//         backgroundColor: const Color.fromARGB(255, 6, 69, 152),
//         title: Center(
//           child: Container(
//             // width: screenWidth * 0.95,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Container(
                        
//                         width: 40,
//                         height: 40,
//                         child: CircleAvatar(
                          
//                           radius: 24,
//                           // backgroundImage: NetworkImage('${controller.img}')==null
//                           // ? NetworkImage('${controller.img2}'): NetworkImage('${controller.img}'),
//                         ),
//                       ),
//                     Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Vector (3).png',width: 40,height: 41,),
//                     Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Vector (2).png',width: 39.02,height: 40,)
//                     // _buildButton('تسجيل دخول', isPrimary: true),
//                     // const SizedBox(width: 12),
//                     // _buildButton('انشاء حساب'),
//                   ],
//                 ),
//                 if (!isMobile)
//                   Row(
//                     children: [
//                       _navText('تواصل معنا'),
//                       _navText('عن أشطر'),
//                       _navText('مصادري'),
//                       _navText('كورساتى'),
//                       _navText('مدرسينا'),
//                       _navText('ذاكر'),
//                       _navText('الرئيسية', highlight: true),
//                       const SizedBox(width: 12),
//                       Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Group 87935.png', width: 55),
//                     ],
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body:GetBuilder(init: HomeController()
//       ,builder: (controller){
    
//         return SingleChildScrollView(
//         child: Column(
//           children: [
//           Wrap(
//   spacing: 16,
//   runSpacing: 16,
//   alignment: WrapAlignment.center,
//   children: [     Container(
//               width: double.infinity,
//               color: const Color.fromARGB(255, 242, 195, 42),
//               padding: const EdgeInsets.all(8),
//               child: Column(
//                 children: [
//                   Text(
//                     'استخدم كود خصم (ANER) واحصل على خصم على الدروس الخصوصية 36%',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: const Color.fromARGB(255, 6, 69, 152),
//                       fontSize: isMobile ? 14 : 18,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   )
//                 ],
//               ),
//             ),
           
     
//             // Wrap(
//             //   spacing: 16,
//             //   runSpacing: 16,
//             //   alignment: WrapAlignment.center,
//             //   children: [
    
//   SizedBox(height: 24,)
//         ,
//           Container(child:Column(
//             spacing: 24,
//             children: [
//           Container(child: Row(spacing: 1,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//          Text('اختار نشاطك',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)),)
//             ,
            
//             Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
//             (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),)
//       ,
           
//             Text('اختار نشاطك',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),)
          
          
//             ,  Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
//             (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),),
//             Text('الفيزياء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),)
//             ,  Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
//             (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181)),),
//              Text('الصف الثالث الثانوي',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),
            
//             ),  Container(width: 18,height: 18,decoration: BoxDecoration(),      child: Icon
//             (Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181))),
//             Text('الرئيسية',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 181, 181, 181)),
//           ), 
          
//           ],),)  
//            ,
//            SizedBox( width:1120,child: Column(
//             spacing: 24,
//               crossAxisAlignment: CrossAxisAlignment.start,  children: [
//             Text('تفصيل الاسالة',textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w600,
//            fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)),)
//            ,
//            Container(
//               width: 428,height: 44,
//            decoration: BoxDecoration(
//           color:  Color.fromARGB(255, 235, 239, 249)
//            ,border:Border.all(color:  Color.fromARGB(255, 6, 69, 152),width: 1 )
// ,borderRadius:BorderRadius.circular(8) 
//             ),
//            child: Wrap( children: [
//         InkWell(child:   Container(
//             padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
//           width: 213
//           ,height: 44,
//             decoration: BoxDecoration(  color:         
//             isSelected==true&&isSelected2==false? Color.fromARGB(255, 235, 239, 249):Color.fromARGB(255, 6, 69, 152)
// ,
//             borderRadius: BorderRadius.circular(8)
//             ),child: Wrap(children: [Text('امتحنات اونلاين',
//             style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20
//            , color: Color.fromARGB(255, 255, 255, 255)
//             ),),Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Frame.png',height: 30,width: 30,)
            
//             ],),),
//         onTap: (){
// setState(() {
//   isSelected=false;
//   isSelected2=true;
// });
// controller.fetchExams(online: 1);

//         },),
//    InkWell(child:       Container(
//          width: 213
//          ,
//          height: 44,
          
//            child: Wrap(children: [

// Text('امتحان في السنتر',style: TextStyle(
//   color: isSelected==true&&isSelected2==false?
//    Color.fromARGB(255, 235, 239, 249):Color.fromARGB(255, 6, 69, 152),
// fontSize: 20,fontWeight: FontWeight.w500

// ),),Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Group (1).png',width: 30,height: 30,)
          
//          ],),
//          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)
//        ,  color:  isSelected==false&&isSelected2==true? Color.fromARGB(255, 235, 239, 249):Color.fromARGB(255, 6, 69, 152)
//          ),
//         //  padding: EdgeInsets.fromLTRB(20, 4, 20, 4),
//          )
      
//            ,onTap: (){
//             setState(() {
//               isSelected2=false;
//               isSelected=true;
//             });
// controller.fetchExams(online: 0);}, ) ],),
           
//            )
       
          
//           ,
          
          
          
          
          
          
          
//           Container(
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//             width: 1120,height: 651,
//             child: Column(
//             spacing: 2,
//             children: [

//               Container(
//             // decoration: BoxDecoration(/),
//                 decoration: BoxDecoration(color: Color.fromARGB(99, 80, 124, 181)
// ,borderRadius: BorderRadius.circular(10)
// ),
//                 padding: EdgeInsets.all(24),
//                 width: 1120,height: 93,
//                 child: Row(
                  
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
//                   children: [
// Container(child: Text('الحجز'
// ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),fontSize:20,fontWeight: FontWeight.w500),

// ),padding: EdgeInsets.fromLTRB(10, 10, 10, 10),)


// ,Container(child: Text('سعر الامتحان'
// ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),fontSize:20,fontWeight: FontWeight.w500),

// ),padding: EdgeInsets.fromLTRB(10, 10, 10, 10),),
// Container(child: Text('تاريخ انتهاء صلاحيه الامتحان '
// ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),fontSize:20,fontWeight: FontWeight.w500),

// ),padding: EdgeInsets.fromLTRB(10, 10, 10, 10),)
// ,

// Container(child: Text('تاريخ بدا الامتحان'
// ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),fontSize:20,fontWeight: FontWeight.w500),

// ),padding: EdgeInsets.fromLTRB(10, 10, 10, 10),)



// ,Container(child: Text('نوع الامتحان'
// ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),fontSize:20,fontWeight: FontWeight.w500),

// ),padding: EdgeInsets.fromLTRB(10, 10, 9, 10),)

// ,                 ],),),
// ...List.generate(controller.exams.length,(index){
  
//   return
//       Container( width: 1120,padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
//       decoration: BoxDecoration(boxShadow: [BoxShadow(
//                   color: Colors.black.withOpacity(0.05), 
//                   offset: Offset(0, 3), 
//                   blurRadius: 13, 
//                   spreadRadius: 0, 
//                 ),],color: Color.fromARGB(255, 255, 255, 255),
//         border: Border.all( width: 1,color: Color.fromARGB(255, 245, 245, 245))),
       
//       child: 
//       Container(width: 1072,height: 95,
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// Container(width: 145,height: 60,child:TextButton(
//   style: TextButton.styleFrom(backgroundColor:
//    Color.fromARGB(255, 6, 69, 152)//,padding: EdgeInsets.fromLTRB(24, 10, 24, 10)
//    ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)
//   , side:BorderSide(color:Color.fromARGB(255, 6, 69, 152),width: 1
  
  
//    ) 
   
//    )
   
//    ),
//   onPressed: (){}, child:Text('اشترك دلوقتي',style: 
//   TextStyle(fontSize: 18,fontWeight: FontWeight.w500
//   ,color: Color.fromARGB(255, 255, 255, 255)),)),)
// ,

//   Container( padding: EdgeInsets.all(10)
    
//      ,child: Text('${controller.exams[index].examprice} جنيه',style: TextStyle(
//       fontSize: 20,fontWeight: FontWeight.w500,
//       color: Color.fromARGB(255, 6, 69, 152)),),),
//     Container(padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
//     child: Container(child:
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
      
      
//       Text('12/10/2024',style: TextStyle(
//       fontSize: 16,fontWeight: FontWeight.w500,
//       color: Color.fromARGB(255, 6, 69, 152)),
      
//       )
//       ,Text('4:30PM',style: TextStyle( 
//         color: Color.fromARGB(255, 6, 69, 152)
//       ,fontWeight: FontWeight.w300,fontSize: 15
//       ),)
//       ],)
//      ,),
//     )
//     ,
//     Container(padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
//     child: Container(child:
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
      
      
//       Text('12\10\2024',style: TextStyle(
//       fontSize: 16,fontWeight: FontWeight.w500,
//       color: Color.fromARGB(255, 6, 69, 152)),
      
//       )
//       ,Text('4:30PM',style: TextStyle(  fontWeight: FontWeight.w300,fontSize: 15
//        , color: Color.fromARGB(255, 6, 69, 152)
      
//       ),)
//       ],)
   
//      ,),
//     )
  
  
//   ,
  
//       Container(
      
//       child: Text('${controller.exams[index].exam_type}',style: TextStyle(
//         fontSize: 16,fontWeight: FontWeight.w500,
//         color: Color.fromARGB(255, 6, 69, 152)),),decoration: BoxDecoration(),
//     //       padding: 
//     // EdgeInsets.fromLTRB(24, 25, 24, 25),
    
//     )  ,
//       ],),
//       ));
      

// })
    
//     ,         Container( width: 1120,
//                               child: Container(
                              
//                                 decoration: BoxDecoration( 
//                                    color: Color.fromARGB(255, 255, 255, 255),
//                     boxShadow: [BoxShadow(
//                   color: Colors.black.withOpacity(0.05), 
//                   offset: Offset(0, 3), 
//                   blurRadius: 13, 
//                   spreadRadius: 0, 
//                 ),],         borderRadius: BorderRadius.circular(10),      border: Border.all(width: 1 ,
//                                    color:Color.fromARGB(255, 245, 245, 245)
//                                    ,
//                                     )
//                                    ),
//                                 padding: const EdgeInsets.fromLTRB(
//                                     24, 13, 24, 13),
//                                 width: 1130,
//                                 height: 70,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Container(
//                                       width: 116,
//                                       height: 44,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                           ),
//                                           padding: const EdgeInsets.fromLTRB(
//                                               24, 10, 24, 10),
//                                           backgroundColor: const Color.fromARGB(
//                                               255, 6, 69, 152),
//                                         ),
//                                         onPressed: () {},
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/arrowleft.png',
//                                                 width: 9.53, height: 20),
//                                             const SizedBox(width: 12),
//                                             const Text(
//                                               'التالي',
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.w500,
//                                                 fontSize: 18,
//                                                 color: Color.fromARGB(
//                                                     255, 255, 255, 255),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 20),
//                                     _buildPagination(controller, currentIndex),
//                                     const SizedBox(width: 20),
//                                     Container(
//                                       width: 116,
//                                       height: 44,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           padding: const EdgeInsets.fromLTRB(
//                                               24, 10, 24, 10),
//                                           side: const BorderSide(
//                                             color: Color.fromARGB(
//                                                 255, 6, 69, 152),
//                                             width: 1,
//                                           ),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                           ),
//                                         ),
//                                         onPressed: () {
//                                           if (currentIndex > 0) {
//                                             setState(() {
//                                               currentIndex--;
//                                             });
//                                           }
//                                         },
//                                         child: const Text(
//                                           'لاحق',
//                                           style: TextStyle(
//                                             color: Color.fromARGB(
//                                                 255, 61, 84, 110),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
                        
        
//             ],),
          
//               )    ],)),
  
      
//       ],) ,width: 1123, ),
      
//             _buildFooter(context),
//             const SizedBox(height: 10),
//             const Text(
//               'Copyright © 2023 Ashtar App | Terms of Use | Privacy Policy',
//               style: TextStyle(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 14,
//                 color: Color.fromARGB(255, 6, 69, 152),
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 10),
        
//    ])]));}));
//   }
//   Widget _buildAppBarButton({
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
 
   
//   Widget _buildButton(String text, {bool isPrimary = false}) {
//     return Container(
//       height: 50,
//       child: TextButton(
//         onPressed: () {},
//         style: TextButton.styleFrom(
//           backgroundColor:
//               isPrimary ? Colors.white : Colors.transparent,
//           side: isPrimary
//               ? null
//               : const BorderSide(color: Colors.white),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//             color: isPrimary ? const Color.fromARGB(255, 6, 69, 152) : Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
//    Widget _buildClassCard(String title, String imagePath,context) {
//     final screenWidth=MediaQuery.of(context).size.width;
//     return Column(children: [ 
//       Container(
//       width: 363,
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 212, 221, 232),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: 180,width:screenWidth,
//             padding: const EdgeInsets.all(8),
//             child: Image.network(imagePath, fit: BoxFit.contain),
//           ),
         
//         ],
//       ),
//     )
//     , Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 20,
//                 color: Color.fromARGB(255, 6, 69, 152),
//               ),
//             ),
//           ),
//     ],); 
   
//   }

//   Widget _navText(String text, {bool highlight = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.w400,
//           color: highlight
//               ? const Color.fromARGB(255, 242, 195, 42)
//               : const Color.fromARGB(255, 181, 181, 181),
//         ),
//       ),
//     );
//   }

//   // Widget _buildClassCard(String title, String imagePath) {
//   //   return Container(
//   //     width: 362,
//   //     decoration: BoxDecoration(
//   //       color: const Color.fromARGB(255, 212, 221, 232),
//   //       borderRadius: BorderRadius.circular(16),
//   //     ),
//   //     child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//   //       children: [
//   //         Container(
//   //           height: 150,
//   //           padding: const EdgeInsets.all(8),
//   //           child: Image.network(imagePath, fit: BoxFit.contain),
//   //         ),
//   //         Padding(
//   //           padding: const EdgeInsets.all(8.0),
//   //           child: Text(
//   //             title,
//   //             style: const TextStyle(
//   //               fontWeight: FontWeight.w600,
//   //               fontSize: 20,
//   //               color: Color.fromARGB(255, 6, 69, 152),
//   //             ),
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   Widget _buildTeacherInfo(bool isMobile,screenWidth) {
//     return Container(
// width: !isMobile?1120:screenWidth,      padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Frame (10).png', width: 43, height: 40),
//           const SizedBox(height: 8),
//           const Text(
//             'الأستاذ شريف البدري',
//             style: TextStyle(
//               fontSize: 32,
//               fontWeight: FontWeight.w600,
//               color: Color.fromARGB(255, 6, 69, 152),
//             ),
//             textAlign: TextAlign.right,
//           ),
//           const Text(
//             'مدرس ماده العلوم',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w400,
//               color: Color.fromARGB(255, 6, 69, 152),
//             ),
//             textAlign: TextAlign.right,
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             'أستاذ العلوم المميز: حاز على شهادة التخرج من كلية الآداب والتربية بتقدير امتياز مع مرتبة الشرف، ويتمتع بخبرة واسعة تمتد لثلاثين عامًا في ميدان تدريس اللغة العربية. يتميز بتدريس مناهج الثانوية العامة بكل دقة واهتمام، وقد أُطلِق عليه لقب "صانع الأوائل" نظرًا لتفانيه الدائم وجهوده الحثيثة في تحفيز وتوجيه طلابه نحو تحقيق النجاح والتفوق. ',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//               color: Color.fromARGB(255, 80, 124, 181),
//             ),
//             textAlign: TextAlign.right,
//           ),
//         ],
//       ),
//     );
//   }

// Widget _buildFooter(BuildContext context) {
//   double screenWidth = MediaQuery.of(context).size.width;

//   return Container(
//     width: double.infinity,
//     color: const Color.fromARGB(255, 6, 69, 152),
//     padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
//     child: Center(
//       child: ConstrainedBox(
//         constraints: const BoxConstraints(maxWidth: 1280),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Wrap(
//               alignment: WrapAlignment.spaceBetween,
//               runSpacing: 24,
//               spacing: 24,
//               children: [
//                 // Column: Contact Us Section
//                 SizedBox(
//                   width: screenWidth < 600 ? double.infinity : 500,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'تواصل معنا',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 242, 195, 42),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 20,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/location.png',
//                           '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
//                       const SizedBox(height: 12),
//                       _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Phone.png', '+20 106 662 0129'),
//                       const SizedBox(height: 12),
//                       _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/sms (1).png', 'support@ashtar.app'),
//                       const SizedBox(height: 12),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame (14).png'),
//                           const SizedBox(width: 12),
//                           _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame (13).png'),
//                           const SizedBox(width: 12),
//                           _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame (12).png'),
//                           const SizedBox(width: 12),
//                           _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame (11).png'),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'حمل التطبيق الان',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 242, 195, 42),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 20,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                 mainAxisAlignment: MainAxisAlignment.start,        children: [
//                           _storeButton('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame (16).png', 'Google play'),
//                           const SizedBox(width: 12),
//                           _storeButton('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame (15).png', 'App Store'),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),

//                 // Column: About Section
//                 SizedBox(
//                   width: screenWidth < 600 ? double.infinity : 600,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Wrap(
//                         alignment: WrapAlignment.start,
//                         spacing: 24,
//                         children: [
//                           _navItem('عن أشطر'),
//                           _navItem('مصادري'),
//                           _navItem('كورساتى'),
//                           _navItem('مدرسينا'),
//                           _navItem('ذاكر'),
//                           _navItem('الرئيسية',
//                               color: Color.fromARGB(255, 242, 195, 42),
//                               fontSize: 24),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Image.network(
//                           'https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Group 87935.png',
//                           width: 80,
//                           height: 65.7,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'عن أشطر',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 242, 195, 42),
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         textAlign: TextAlign.right,
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         'أشطر معتمدة من كوجنيا واحدة من أكبر المؤسسات التعليمية الدولية فى العالم! أشطر منصة تعليم رقمي قائمة على المناهج الدراسية لطلاب المدارس وبتوفر تجربة تعليمية مخصصة لكل طالب وبتوفرلهم طريقة التعليم المناسبة ليهم',
//                         textAlign: TextAlign.right,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
// Widget _buildPagination(HomeController controller, int currentPage) {
//     int currentIndex = 1;
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: List.generate(10, (index) {
//       final pageIndex = index + 1;
//       return GestureDetector(
//         onTap: () {
//           setState(() {
//             currentIndex = pageIndex;
//             controller.fetchExams(page: pageIndex,); // Fixed: pass pageIndex instead of currentPage
//             controller.update();
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

// Widget _buildInfoRow(String iconPath, String text) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             text,
//             style: TextStyle(color: Colors.white, fontSize: 16),
//             textAlign: TextAlign.right,
//           ),
//         ],
//       ),
//       const SizedBox(width: 8),
//       Image.network(iconPath, width: 24, height: 24),
//     ],
//   );
// }

// Widget _icon(String path) {
//   return Image.network(path, width: 24, height: 24);
// }
//  Widget menuButton(BuildContext context, String label, Color bgColor, Color textColor) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.pop(context);
//           // Add navigation here if needed
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: bgColor,
//           foregroundColor: textColor,
//           padding: const EdgeInsets.symmetric(vertical: 12),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6),
//             side: BorderSide(color: textColor),
//           ),
//           elevation: 0,
//         ),
//         child: Text(
//           label,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }}

// class _MenuItem extends StatelessWidget {
//   final String title;
//   final bool isActive;
//   const _MenuItem({required this.title, this.isActive = false});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Text(
//         title,
//         textDirection: TextDirection.rtl,
//         style: TextStyle(
//           color: isActive ? Colors.white : Colors.white.withOpacity(0.7),
//           fontSize: 16,
//           fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//     );
//   }
// }
// Widget _storeButton(String iconPath, String label) {
//   return Container(
//     width: 160,
//     height: 60,
//     padding: const EdgeInsets.all(8),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(8),
//     ),
//     child: Row(
//       children: [
//         Image.network(iconPath, width: 40, height: 40),
//         const SizedBox(width: 8),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Get it on", style: TextStyle(fontWeight: FontWeight.w600)),
//             Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// Widget _navItem(String title,
//     {Color color = const Color.fromARGB(255, 181, 181, 181),
//     double fontSize = 20}) {
//   return Text(
//     title,
//     style: TextStyle(
//       color: color,
//       fontSize: fontSize,
//       fontWeight: FontWeight.w500,
//     ),
//   );
// }


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/controllers/subjectbooks2.dart';
import 'package:my_app/app/modules/home/views/schedule_center.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'Schudle_for_the_exam .dart';

class SchudleForTheExam extends StatefulWidget {
  const SchudleForTheExam({super.key});

  @override
  State<SchudleForTheExam> createState() => _HomeafterloginState();
}

class _HomeafterloginState extends State<SchudleForTheExam> {
  int _currentPage = 0;
  bool isSelected = true;
  bool isSelected2 = false;

  PageController _pageController = PageController(
    viewportFraction: 0.22,
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;
    void scrollToIndex(int index) {
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
    int _currentPage = 0;

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
                        builder: (context) => const Subjecttype(),
                      );
                    },
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                  Row(
                    children: [
                      Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Group87935.png', width: 55),
                    ],
                  ),
                ],
              ),
            )
          : AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 85,
              backgroundColor: const Color.fromARGB(255, 6, 69, 152),
              title: Center(
                child: Container(
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
                            ),
                          ),
                          Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Vector_3.png',
                              width: 40, height: 41),
                          Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Vector_2.png',
                              width: 39.02, height: 40)
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
                            Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Group87935.png', width: 55),
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
          return Column(
            children: [
              // الجزء العلوي من الصفحة (ثابت)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.start,
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
                          SizedBox(height: 24),
                          Container(
                            child: Column(
                              spacing: 24,
                              children: [
                                Container(
                                  child: Row(
                                    spacing: 1,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('اختار نشاطك',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 6, 69, 152))),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(),
                                        child: Icon(Icons.arrow_back_ios,
                                            color: Color.fromARGB(
                                                255, 181, 181, 181)),
                                      ),
                                      Text('اختار نشاطك',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  255, 181, 181, 181))),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(),
                                        child: Icon(Icons.arrow_back_ios,
                                            color: Color.fromARGB(
                                                255, 181, 181, 181)),
                                      ),
                                      Text('الفيزياء',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  255, 181, 181, 181))),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(),
                                        child: Icon(Icons.arrow_back_ios,
                                            color: Color.fromARGB(
                                                255, 181, 181, 181)),
                                      ),
                                      Text('الصف الثالث الثانوي',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  255, 181, 181, 181))),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(),
                                        child: Icon(Icons.arrow_back_ios,
                                            color: Color.fromARGB(
                                                255, 181, 181, 181)),
                                      ),
                                      Text('الرئيسية',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  255, 181, 181, 181))),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 1120,
                                  child: Column(
                                    spacing: 24,
                                    crossAxisAlignment:isMobile?CrossAxisAlignment.center: CrossAxisAlignment.start,
                                    children: [
                                      Text('تفصيل الاسالة',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 32,
                                              color: Color.fromRGBO(6, 69, 152, 1))),
                                      Container(
                                        width:isMobile
                                        ?343: 428,
                                        height:isMobile?71: 44,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 235, 239, 249),
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 6, 69, 152),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Wrap(
                                          children: [
                                            InkWell(
                                              child: Container(
                                                // padding: EdgeInsets.fromLTRB(
                                                //     24, 4, 24, 4),
                                                width:isMobile? 170.5: 213,
                                                height:isMobile?71: 44,
                                                decoration: BoxDecoration(
                                                  color: isSelected == true &&
                                                          isSelected2 == false
                                                      ? Color.fromARGB(
                                                          255, 235, 239, 249)
                                                      : Color.fromARGB(
                                                          255, 6, 69, 152),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Wrap(
                                                  children: [
                                                    Text('امتحنات اونلاين',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255))),
                                                    Image.network(
                                                        'https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Frame.png',
                                                        height: 30,
                                                        width: 30)
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  isSelected = false;
                                                  isSelected2 = true;
                                                });
                                                controller.fetchExams(online: 1);
                                              },
                                            ),
                                            InkWell(
                                              child: Container(
                                                width:isMobile? 170.5: 213,
                                                height:isMobile?71: 44,
                                                child: Wrap(
                                                  children: [
                                                    Text('امتحان في السنتر',
                                                        style: TextStyle(
                                                            color: isSelected ==
                                                                        true &&
                                                                    isSelected2 ==
                                                                        false
                                                                ? Color.fromARGB(
                                                                    255,
                                                                    235,
                                                                    239,
                                                                    249)
                                                                : Color.fromARGB(
                                                                    255,
                                                                    6,
                                                                    69,
                                                                    152),
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Image.network(
                                                        'https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/Group_1.png',
                                                        width: 30,
                                                        height: 30)
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: isSelected == false &&
                                                          isSelected2 == true
                                                      ? Color.fromARGB(
                                                          255, 235, 239, 249)
                                                      : Color.fromARGB(
                                                          255, 6, 69, 152),
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  isSelected2 = false;
                                                  isSelected = true;
                                                });
                                                controller.fetchExams(online: 0);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
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

              // الجزء السفلي (الجدول) قابل للتمرير
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      width: isMobile ? screenWidth : 1120,
                      child: Column(
                        spacing: 2,
                        children: [
                          // رأس الجدول مع تمرير أفقي
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(99, 80, 124, 181),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(24),
                              width: isMobile ? 800 : 1120, // عرض أكبر للتمرير
                              height: 93,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text('الحجز',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 6, 69, 152),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  ),
                                  Container(
                                    child: Text('سعر الامتحان',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 6, 69, 152),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  ),
                                  Container(
                                    child: Text('تاريخ انتهاء صلاحيه الامتحان',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 6, 69, 152),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  ),
                                  Container(
                                    child: Text('تاريخ بدا الامتحان',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 6, 69, 152),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  ),
                                  Container(
                                    child: Text('نوع الامتحان',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 6, 69, 152),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    padding: EdgeInsets.fromLTRB(10, 10, 9, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          
                          // صفوف الجدول مع تمرير أفقي
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: List.generate(controller.exams.length, (index) {
                                return Container(
                                  width: isMobile ? 800 : 1120, // عرض أكبر للتمرير
                                  padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          offset: Offset(0, 3),
                                          blurRadius: 13,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      border: Border.all(
                                          width: 1,
                                          color: Color.fromARGB(255, 245, 245, 245))),
                                  child: Container(
                                    width: isMobile ? 752 : 1072, // عرض أكبر
                                    height: 95,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 145,
                                          height: 60,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 6, 69, 152),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(8),
                                                    side: BorderSide(
                                                        color: Color.fromARGB(
                                                            255, 6, 69, 152),
                                                        width: 1))),
                                            onPressed: () {},
                                            child: Text('اشترك دلوقتي',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255))),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                              '${controller.exams[index].examprice} جنيه',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 6, 69, 152))),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(24, 10, 24, 10),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('12/10/2024',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 6, 69, 152))),
                                                Text('4:30PM',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 6, 69, 152),
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 15)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(24, 10, 24, 10),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('12\\10\\2024',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 6, 69, 152))),
                                                Text('4:30PM',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 15,
                                                        color: Color.fromARGB(
                                                            255, 6, 69, 152))),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                              '${controller.exams[index].exam_type}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 6, 69, 152))),
                                          decoration: BoxDecoration(),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          
                          // التذييل مع تمرير أفقي
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              width: isMobile ? 800 : 1120, // عرض أكبر للتمرير
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        offset: Offset(0, 3),
                                        blurRadius: 13,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 245, 245, 245))),
                                padding:
                                    const EdgeInsets.fromLTRB(24, 13, 24, 13),
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
                                            borderRadius: BorderRadius.circular(8),
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
                                            Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/arrowleft.png',
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
                                            color:
                                                Color.fromARGB(255, 6, 69, 152),
                                            width: 1,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
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
                                            color:
                                                Color.fromARGB(255, 61, 84, 110),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // باقي الدوال المساعدة تبقى كما هي بدون تغيير...
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
    return Container(
      height: 50,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: isPrimary ? Colors.white : Colors.transparent,
          side: isPrimary ? null : const BorderSide(color: Colors.white),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: isPrimary
                ? const Color.fromARGB(255, 6, 69, 152)
                : Colors.white,
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

  
   
  

  Widget _buildPagination(HomeController controller, int currentPage) {
    int currentIndex = 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(10, (index) {
        final pageIndex = index + 1;
        return GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = pageIndex;
              controller.fetchExams(page: pageIndex);
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

  


  Widget menuButton(
      BuildContext context, String label, Color bgColor, Color textColor) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
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


