import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/controllers/trueAnswerExam.dart';
import 'package:my_app/app/modules/home/views/emptycart.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/menuebar%20paym.dart';
import 'package:my_app/app/modules/home/views/profile%20copy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
import 'package:my_app/app/modules/home/views/textfield.dart';

import '../../../models/wallet.dart';
import 'exam_solve.dart';
import 'myquestions.dart';
import 'wallet_cart.dart';
// class Schedule el malazem extends StatefulWidget {
//   const Schedule el malazem({super.key,});

//   @override
//   State<Schedule el malazem> createState() => _Schedule el malazemState();
// }
class Addedto extends StatefulWidget {
  
  const Addedto({super.key,});

  @override
  State<Addedto> createState() => _MyexamState();
}

class _MyexamState extends State<Addedto> {
bool isLoading = false;
 int Price=0;
 int Price2=0;
bool ontap=false;
bool ontap2=false;
bool ontap3=false;List items=['',''];
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
final int _currentPage=0;
final _maxLengthNotifier = ValueNotifier<int?>(null); 
var selectedMethod=''.obs;
  @override 
  Widget build(BuildContext context) {
  //  final HomeController _controller = HomeController();
  final int maxLength = 500;
  final FocusNode focusNode = FocusNode();
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
int cart=0;
    int currentPage=0;
  // final screenWidth = MediaQuery.of(context).size.width;
  //   final isMobile = screenWidth < 600;
          // print('eee${courseInfos}');
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

PageController pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22,
initialPage: 1

);  int currentIndex = 1;
HomeController controller=HomeController();
var g=controller.course_info.map((e)=>e.section?.length);
  void scrollToIndex(int index) {
    pageController.animateToPage(
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
//               Image.asset(
//                 'assets/logo.png',
//                 height: 40,
//               ),

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
                InkWell(child:Image.asset('icons/Vector(3).png',width: 40,height: 41,) ,
                onTap: (){Navigator .push(context, MaterialPageRoute(builder: (context)=>Addedto()));},
                )
                    ,
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
      body:
      
      GetBuilder( init:HomeController() ,builder: (controller){

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
    .where((e) => e.section != null)
    .fold(0, (sum, e) => sum + (e.section?.length ?? 0));
    int cardsPerRow = (constraints.maxWidth / cardWidth).floor();
          return  SingleChildScrollView(
        child: 
        Column(crossAxisAlignment: CrossAxisAlignment.center,
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
, SizedBox(width: 
1820,    child:Row(
  crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              isMobile?Container():
RightSidebar(),
              // ,SizedBox(width: 100,)  ,
          Expanded(child:               
                 Container(
          width: !isMobile ? 852 : 375,child:
               Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(padding: EdgeInsets.fromLTRB(40,48,40,48),
decoration: BoxDecoration(
  color:Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(16)),
// border: Border.all(width: )
)
,child: 
Wrap(alignment: WrapAlignment.center,//spacing: 24,
  // crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    
  SizedBox(width:!isMobile ?770:311, //height: 110,
  // alignment: Alignment.centerRight,
 
  child:Text("سلة المشتريات",textAlign: TextAlign.start
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 32,fontWeight: FontWeight.w600,
)
 ,),
) 

,
 SizedBox(height: 24,),

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
controller.cart.isNotEmpty?
SizedBox(
  width:isMobile?311: 768,//height: 2000,
  child:Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing:isMobile?14: 16, children: [
SizedBox(width:isMobile?311: 768,
child:Column(spacing:isMobile?14: 16, children: [
controller.cart.isNotEmpty?
SizedBox(width:isMobile?311: 768, child:Column(spacing: 16, children: [
  SizedBox(width:isMobile?311: 768,child:Wrap(children: [

   
    SizedBox( width:isMobile?207: 664,child:Text(
      textAlign: TextAlign.start,
      'تفصيل المشتريات',style:
     TextStyle(
      fontSize: 20,fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 6, 69, 152)),) ,)
    ,SizedBox(width:isMobile?14: 16),
 InkWell(onTap:(){

setState(() {
 Emptycart();
  controller.fetchCart();controller.clearCart();
  cart=0;controller.update();
});
controller.update();
    } ,child: Text('مسح الكل',style: TextStyle(
    
    fontSize: 16,fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 179, 179, 179)),))
  ],)) , SizedBox( width:isMobile?188: 768,child:Text(
    textAlign: TextAlign.start,
    'رقم الطلب: #165278',style:
     TextStyle(color: Color.fromARGB(255, 6, 69, 152)),)
,)

],) ,):Container(),
// controller.cart.map((e)=>e.course)
SizedBox(width:isMobile?311: 768,child: Column(
  spacing: 16,
  children: [
    
  ...List.generate(controller.cart.map((e)=>e.course).length,(index){
// print((controller.cart.map((e)=>e.course!['isUsed']).join())) ;
   controller. fetchCart();
 cart=controller.cart.length;
    // Price=controller.cart[index].attachment?['price'].length;
    // Price=controller.cart[index].attachment?['price'];
    // print(Price.bitLength);
    // print(Price2);

return
    Container( //assets/ashtarlogo.png
    padding:isMobile?EdgeInsets.all(16) :EdgeInsets.fromLTRB(24, 16, 24, 16),
    width:isMobile? 311:768,decoration: BoxDecoration
  (border: Border.all(width: 2,color
  :Color.fromARGB(255, 6, 69, 152) 
  )
  ,borderRadius: BorderRadius.circular(8)

  
  ),
   child: Column(children: [
Wrap(alignment: WrapAlignment.spaceBetween,
 children: [
       SizedBox( width:isMobile?240: 680,child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [ 
      Image.asset('assets/ashtarlogo.png',width: 40,height: 40)  ,

SizedBox(width:isMobile?200: 335,child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text('كورس المراجعة'
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)

,fontSize: 24,fontWeight: FontWeight.w500
),
)

,Text('الترم التاني (الصف الثالث الثانوي) ',
style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 14,fontWeight: FontWeight.w400


),),

],),),


  ],),),
SizedBox(
  height: 57,
  child:
  Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    
     Container( decoration: BoxDecoration
    (
      color: Color.fromARGB(255, 235, 239, 249),
      borderRadius: BorderRadius.circular(50)
    
    ),
      width: 32,height: 32,
      child:InkWell(child:Icon(Icons.delete_outline,color
  :Color.fromARGB(255, 6, 69, 152) ,size:18 ,)  ,
  onTap: (){
    controller. deletefromcart(controller.cart[index].id.toString());
 controller.fetchCart();

  
  },
  ) ,)
   ],))
],)


,
 SizedBox ( width:isMobile?311: 720,child:Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
  
  Text('650 ج .م',style: TextStyle(color:
 Color.fromARGB(255, 6, 69, 152)
 ,fontSize: 20,fontWeight: FontWeight.w600)
 ),
   Text(' ج .م${controller.cart[index].attachment?['price']??0}'

,style: TextStyle(color:Color.fromARGB(255, 80, 124, 181)


 ),


),


],))
    
   ],) );
 

  })
  ,
  ...List.generate(controller.cart.map((e)=>e.attachment).length,(index){
print((controller.cart.map((e)=>e.attachment).length)) ;
   controller. fetchCart();
 cart=controller.cart.length;
    // Price=controller.cart[index].attachment?['price'].length;
    Price=controller.cart[index].course?['price']??0;
    // print(Price.bitLength);
    // print(Price2);

return
    Container( //assets/ashtarlogo.png
    padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
    width:isMobile?311: 768,decoration: BoxDecoration
  (border: Border.all(width: 2,color
  :Color.fromARGB(255, 6, 69, 152) 
  )
  ,borderRadius: BorderRadius.circular(8)

  
  ),
   child: Column(children: [
Wrap(alignment: WrapAlignment.spaceBetween,
 children: [
  SizedBox(
  height: 57,
  child:
  Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    
 ],))
 
  , SizedBox(width:isMobile?245: 680,child: Wrap(
    alignment: WrapAlignment.start,
    children: [ 
          Image.asset('assets/ashtarlogo.png',width: 40,height: 40,),
SizedBox(width:isMobile?200 :335,child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text('ملازمة المراجعة'
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)

,fontSize: 24,fontWeight: FontWeight.w500
),
)

,Text('الترم التاني (الصف الثالث الثانوي) ',
style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 14,fontWeight: FontWeight.w400


),),

],),),


  ],),),
    Container( decoration: BoxDecoration
    (
      color: Color.fromARGB(255, 235, 239, 249),
      borderRadius: BorderRadius.circular(50)
    
    ),
      width: 32,height: 32,
      child:InkWell(child:Icon(Icons.delete_outline,color
  :Color.fromARGB(255, 6, 69, 152) ,size:18 ,)  ,
  onTap: (){
    controller. deletefromcart(controller.cart[index].id.toString());
 controller.fetchCart();

  
  },
  ) ,)

],)


,
 SizedBox ( width: 720,child:Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
  
  Text('650 ج .م',style: TextStyle(color:
 Color.fromARGB(255, 6, 69, 152)
 ,fontSize: 20,fontWeight: FontWeight.w600)
 ),
   Text(' ج .م${controller.cart[index].course?['price']??0}'

,style: TextStyle(color:Color.fromARGB(255, 80, 124, 181)


 ),


),


],))
    
   ],) );
 

  })
  ,

ontap?SizedBox(width: 676,height: 195,child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
   SizedBox(width: 628,child:Text('العنوان المسجل',
   textAlign: TextAlign.end,style: TextStyle(
      fontSize: 20,fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 6, 69, 152)),) ,) ,
      Container(width: 676,height: 146,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 1 ,color: Color.fromARGB(255, 6, 69, 152)
      
       )
      ),child: Row(mainAxisAlignment: MainAxisAlignment.end,
      children: [
       InkWell(child:Container(
          alignment: Alignment.topRight,
          child: Text('تعديل العنوان',style: TextStyle(
            fontSize: 16,fontWeight: FontWeight.w400,
            color:Color.fromARGB(255, 61, 84, 110)),),),
            onTap: () {
              showDialog(context: context, builder: (context){
                return AlertDialog(content: SizedBox(width:757 ,height:496 ,             
              child: Column(
                spacing: 32,
                children: [
                SizedBox(
                  width: 709,
                  child:Text('العنوان',textAlign: TextAlign.end,style: TextStyle(fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 6, 69, 152) ),) ,)
,SizedBox(width: 709,child: Row(children: [
  SizedBox(width: 300,
  child: Column(children: [
    SizedBox(width: 300,child: Column(children: [
      Text('المحافظة',style: TextStyle(
        fontWeight: FontWeight.w500,fontSize: 16,
        color: Color.fromARGB(255, 80, 124, 181)),)
  ,       SizedBox( height: 44,child:     Directionality(
          textDirection: TextDirection.rtl,
          child: DropdownButtonFormField<String?>(
            // value: value.value,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: '',
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
                    'hint',
                    style: const TextStyle(
                      fontSize: 16,
                      color:  Color.fromARGB(255, 154, 175, 228),
                    ),
                  ),
                ),
              ),
              ...items.map((e) {
                return DropdownMenuItem<String?>(
                  value: e,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'course',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 154, 175, 228),
                      ),
                    ),
                  ),
                );
              }),
            ],
            onChanged: (newValue) {
              // onChanged(newValue);
            },
          ),
        ),
      ) 
   
   
    ],),)
  ],),
  )
],),)

              ],),
              ),) ;});
            },
            ), 
        SizedBox(width: 507,child: 
         Row(children: [

SizedBox(width: 440,child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.end, children: [
  Container( child: Text(' احمد محمد احمد القنصل',textAlign: TextAlign.end,style: TextStyle(color:
   Color.fromARGB(255, 80, 124, 181)  ,fontWeight:FontWeight.w500,fontSize:16),),),
  Container( child: Wrap(children: [Text(
    style:TextStyle(color: Color.fromARGB(255, 6, 69, 152)
    ,fontSize: 20,fontWeight: FontWeight.w400
    ) ,
    '134-شارع محمد احمد -مدينه نصر -بجانب صيدليه مريم  القاهره',textAlign: TextAlign.end,)],),)
,Container(child: Text('01234567890+',textAlign: TextAlign.end,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 80, 124, 181)),),)

],),),

SizedBox(width: 55,child: Column(
  
  spacing: 15,
  children: [
  Text(':الاسم',style: TextStyle(
  color: Color.fromARGB(255, 181, 181, 181)
  
  ,fontSize: 16,fontWeight:FontWeight.w500 
  ),),
  SizedBox(height: 32, child: Text(':العنوان',style: TextStyle(
  color: Color.fromARGB(255, 181, 181, 181)
  
  ,fontSize: 16,fontWeight:FontWeight.w500 
  ),),),
 
  Text(':التلفون',style: TextStyle(
  color: Color.fromARGB(255, 181, 181, 181)
  
  ,fontSize: 16,fontWeight:FontWeight.w500 
  ),),


],) ,)
         
         ],),)
      ],
      
      ),)
  ],
),):Container(),
ontap2?Column(children: [Container(
width: 676 ,padding: EdgeInsets.all(24),
child: Column(spacing: 24, children: [
Container(child: Column(
  spacing: 24,
  crossAxisAlignment: CrossAxisAlignment.end, children: [
  Text('طريقه الدفع',style: TextStyle(
  color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 20,fontWeight: FontWeight.w500
  
  ),),
  Wrap(alignment: WrapAlignment.end, children: [Text(
    
    textAlign: TextAlign.end,
    style: TextStyle(color: Color.fromARGB(255, 244, 67, 54)
  ,fontSize: 16,fontWeight: FontWeight.w400
  ), 'الرصيد الموجود في حسابك غير كافي لشراء الطلبية، يرجى شحن المحفظه عن  طريق الشحن السريع من خلال الكود , لازم تزود 500 جنيه رصيد.  ')],)
,SizedBox(width: 220,height: 44,
// color: Color.fromARGB(255, 6, 69, 152)
 
//  ,
 child: 
 TextButton( style:
 TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 6, 69, 152)
 ,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),) 
  )
 ,onPressed: () {
  showDialog(
context: context,
builder: (context){
return AlertDialog(
  backgroundColor: Colors.white,
  contentPadding: EdgeInsets.all(16),
  shape:RoundedRectangleBorder(
  borderRadius:BorderRadius.circular(16) 
  
  ),
   content: SizedBox(width: 431,height: 405,
child: Column( children: [SizedBox(height: 7,),
SizedBox( width: 383,
child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
Text('اشحن محفظتك',style: TextStyle( 
  color: Color.fromARGB(255, 6, 69, 152),
fontSize: 32,fontWeight: FontWeight.w600


),




)
,
Text('رصيدك دلوقتي 500 جنيه',style:
 TextStyle(color: Color.fromARGB(255, 80, 124, 181)
 ,fontSize: 14,fontWeight: FontWeight.w400
 ),)
,
SizedBox(height: 7,)

],)

  
 
),Container(width: 383,decoration: BoxDecoration(borderRadius: BorderRadius.only(
  topLeft:Radius.circular(16) ,topRight: Radius.circular(16))
  
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(width: 383,height: 68,alignment: Alignment.center,decoration: BoxDecoration(
      color:Color.fromARGB(255, 212, 221, 232) 
      ,borderRadius: BorderRadius.only(topLeft: Radius.circular(24),
      topRight: Radius.circular(24)
      
      ),border: Border(
         top: BorderSide( width: 1,color: Color.fromARGB(255, 154, 175, 228)),
         right: BorderSide( width: 1,color: Color.fromARGB(255, 154, 175, 228)),
         left: BorderSide( width: 1,color: Color.fromARGB(255, 154, 175, 228)),
      
      
      )
      ),child: Text('الشحن السريع'
      ,textAlign: TextAlign.center
      ,style: TextStyle(
        
        color: Color.fromARGB(255, 6, 69, 152),
      fontSize: 20,fontWeight: FontWeight.w600
      
       ),),),
// SizedBox(height: 24,),
Container(
  width: 383,decoration: BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16)),
    border: Border(
    bottom:BorderSide(width: 1,color: Color.fromARGB(255, 154, 175, 228)),
    left:BorderSide(width: 1,color: Color.fromARGB(255, 154, 175, 228))
   ,right:BorderSide(width: 1,color: Color.fromARGB(255, 154, 175, 228))
     )),
  child: Column(
   spacing: 16,
    children: [

      SizedBox(height: 24,),SizedBox(
        width: 335,
        child:Text('استخدم الكود لشحن ع المنصه',textAlign: TextAlign.end,style: TextStyle(
  fontSize: 16,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 6, 69, 152)),) ,)

 , Container(
    width: 335,height: 44,decoration: BoxDecoration(border:Border.all(color:Color.fromARGB(255, 154, 175, 228) ,width: 1) ),
    child:TextField(
      controller: controller.chargeCode,
      decoration: InputDecoration(border:OutlineInputBorder(
  borderRadius: BorderRadius.circular(8)
  ,borderSide:BorderSide(color:Color.fromARGB(255, 154, 175, 228) ,width: 1) 
 )),))
 ,  SizedBox(
    width: 335,height: 44,
    child: TextButton(
  style: TextButton.styleFrom(shape: 
  RoundedRectangleBorder(
borderRadius: BorderRadius
.circular(8)),backgroundColor:
 Color.fromARGB(255, 6, 69, 152)),
  onPressed: (){

    controller.chargewallet();
    Navigator.pop(context);
showDialog(context: context, builder: (context){
  
  return AlertDialog(content:SizedBox(width: 431,height: 405,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [Image.asset('assets/bigright.png',width: 229,height: 229,
  )
  ,SizedBox(width: 315,height: 88, child: Wrap(children: [
   Text('تم شحن محفظتك بنجاح',
   style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 32,fontWeight: FontWeight.w600
   
   ),)
,Text('انت دلوقتي رصيدك 1568 جنيه تقدر دلوقتي تتم عمليه الشراء بسهوله !!!'
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontSize: 16,fontWeight: FontWeight.w400
),
)

  ],),)
  
  ],),));

});

  }, child: Text('اشحن دلوقتي',style: 
  TextStyle(color: Color.fromARGB(255, 255, 255, 255)
 , fontSize: 18,fontWeight: FontWeight.w500
  ),)
  
  ),),
SizedBox(height: 16,)
  ],
  
  ),) ,

  ],),
  
  ),SizedBox(width: 383,child: Wrap(alignment: WrapAlignment.end, children: [ Text(
   textAlign: TextAlign.end,
   textDirection: TextDirection.rtl,
    style: TextStyle(
      color: Color.fromARGB(255, 107, 107, 107),fontSize: 12,fontWeight: FontWeight.w400),
    'الرصيد الموجود في حسابك غير كافي لشراء الطلبية، يرجى شحن المحفظه عن  طريق الشحن السريع من خلال الكود , لازم تزود 500 جنيه رصيد.  ')
],),)
 ],),
),);
  });
 }, child:Text('اشحن دلؤتي',style: 
 TextStyle(color: Color.fromARGB(255, 255, 255, 255)
 ,fontSize: 18,fontWeight: FontWeight.w600
 
 ),) ,),
 )

],),)
],),

),Container(width: 676,
padding: EdgeInsets.fromLTRB(24, 16, 24, 24),
child: Column(crossAxisAlignment: CrossAxisAlignment.end, 
children: [
  SizedBox(width: 676,child:
  Text(textAlign: TextAlign.end, 'معك كود خصم؟',style: 
TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontSize: 20,fontWeight: FontWeight.w500
),
  )
)

,SizedBox(width: 628,child: Row(
  spacing: 16,
  children: [
SizedBox(width: 173,height: 44,child: TextButton(
  style: TextButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),  
    backgroundColor: Color.fromARGB(255, 6, 69, 152),),
  onPressed: (){}, child: Text('تطبيق',style: TextStyle(
    fontSize: 18,fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 255, 255, 255)),)),),
    SizedBox(width: 439,height: 44, child:
    TextField(
  textAlign: TextAlign.end,
  decoration: InputDecoration(
  hintText: 'ادخل الكود',hintTextDirection:TextDirection.rtl,
    hintStyle: TextStyle(color: Color.fromARGB(255, 80, 124, 181)
    ,fontSize: 16,fontWeight: FontWeight.w400
    ),
    contentPadding: EdgeInsets.only(right: 16,left: 16),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
    // gapPadding: EdgeInsets.only(right: 16),
    borderSide:
 BorderSide(width: 1,color: Color.fromARGB(255, 154, 175, 228)))),)

     ,)

]
,),)

],),

)
],):Container(),
controller.cart.isNotEmpty?
ontap3==false?
Container( width:isMobile?311: 768,padding: EdgeInsets.fromLTRB(24, 24, 24, 48), 
child: Column(  spacing: 24, children: [
SizedBox( width: 720,child: 
Column(crossAxisAlignment: CrossAxisAlignment.end,spacing: 4, children: [
  SizedBox(width: 720, 
child:Text('تفصيل الطلبية',textAlign: TextAlign.end,style: TextStyle(
  fontSize: 20,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 6, 69, 152)),) ,),

  SizedBox( width: 720,child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('${controller.pricelength} ج.م',style:
   TextStyle(color: Color.fromARGB(255, 80, 124, 181)),
   
   ),
    Text('الإجمالى',style:
   TextStyle(color: Color.fromARGB(255, 80, 124, 181)),
   
   ),
    
   
   
   ],),),
  SizedBox( width: 720,child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('300 ج.م',style:
   TextStyle(color: Color.fromARGB(255, 80, 124, 181)),
   
   ),
    Text('قيمة الخصم',style:
   TextStyle(color: Color.fromARGB(255, 80, 124, 181)),
   
   ),
    
   
   
   ],),),
  SizedBox( width: 720,child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('${controller.pricelength-300} ج.م',style:
   TextStyle(color: Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 24,fontWeight: FontWeight.w500
   ),
   
   ),
    Text('الإجمالى بعد الخصم',style:
   TextStyle(fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),
   
   ),
    
   
   
   ],),),
  
],)
),
ontap==false?
SizedBox( width: 628,height: 44,child:TextButton( 
  onPressed: (){
  setState(() {
     ontap=true;
  });

},style:
 TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)) ,
  backgroundColor: Color.fromARGB(255, 6, 69, 152)),
 child: Text('اتمام الشراء',style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w600,
  color: Color.fromARGB(255, 255, 255, 255)),),) ,)
:
ontap2==false?
SizedBox( width: 720,height: 44,child:TextButton( onPressed: (){
  setState(() {
    //  ontap=true;
    ontap2=true;
  });

},style:
 TextButton.styleFrom(shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8)) ,
  backgroundColor: Color.fromARGB(255, 6, 69, 152)),
 child: Text('العنوان صح',style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w600,
  color: Color.fromARGB(255, 255, 255, 255)),),) ,)
:ontap2==true?Column(
  
  children: [
    
    SizedBox( width: 720,height: 44,child:TextButton( onPressed: (){
  setState(() {
    //  ontap=true;
    // ontap2=true;
    ontap3=true;

  });

},style:
 TextButton.styleFrom(shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8)) ,
  backgroundColor: Color.fromARGB(255, 6, 69, 152)),
 child: Text('تاكيد الطلب',style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w600,
  color: Color.fromARGB(255, 255, 255, 255)),),) ,)],)
   :Container(),


],)):Container():Container(
  
) ,
// :
ontap3?
SizedBox( width: 676, child: Column(children: [
  SizedBox( width: 628,child: Text('تفصيل الطلبية',
  style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  
  ,fontSize: 20,fontWeight: FontWeight.w500,
  ),
  textAlign: TextAlign.end,
  
  ),),SizedBox(height: 14,),
SizedBox(width: 628, child:Column(
  spacing: 14,
  children: [
 SizedBox(width: 628,child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
Text('100 ج.م',style: TextStyle(color:  Color.fromARGB(255, 80, 124, 181)),),

  Text('رسوم الشحن',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181)
  
  
  ),)

 ],),) 

, SizedBox(width: 628,child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
Text('300 ج.م',style: TextStyle(color:  Color.fromARGB(255, 80, 124, 181)),),

  Text('رسوم الشحن',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181)
  
  
  ),)

 ],),) 

 ,SizedBox(width: 628,child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
Text('950 ج.م',style: TextStyle(color:  Color.fromARGB(255, 80, 124, 181)),),

  Text('رسوم الشحن',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181)
  
  
  ),)

 ],),) 
 ,SizedBox(width: 628,child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
Text('650 ج.م',style: TextStyle(
  fontSize: 24,fontWeight: FontWeight.w600,
  color:  Color.fromARGB(255, 6, 69, 152)),),

  Text('الإجمالى بعد الخصم',style: TextStyle(
    fontWeight: FontWeight.w500,fontSize: 16,
    color: Color.fromARGB(255, 6, 69, 152)
  
  
  ),)

 ],),) 


],) ,)
,SizedBox(width: 768,child: Column(
  spacing: 16,
  children: [
    
  ...List.generate(controller.cart.map((e)=>e.section).length,(index){
// print((controller.cart.map((e)=>e.section!['isUsed']).join())) ;
   controller. fetchCart();
 cart=controller.cart.length;
    // Price=controller.cart[index].attachment?['price'].length;
    // Price=controller.cart[index].attachment?['price'];
    // print(Price.bitLength);
    // print(Price2);

return
    Container( //assets/ashtarlogo.png
    padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
    width: 768,decoration: BoxDecoration
  (border: Border.all(width: 2,color
  :Color.fromARGB(255, 6, 69, 152) 
  )
  ,borderRadius: BorderRadius.circular(8)

  
  ),
   child: Column(children: [
Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
 children: [
     Container( decoration: BoxDecoration
    (
      color: Color.fromARGB(255, 235, 239, 249),
      borderRadius: BorderRadius.circular(50)
    
    ),
      width: 32,height: 32,
      child:InkWell(child:Icon(Icons.delete_outline,color
  :Color.fromARGB(255, 6, 69, 152) ,size:18 ,)  ,
  onTap: (){
    controller. deletefromcart(controller.cart[index].id.toString());
 controller.fetchCart();

  
  },
  ) ,)

//   , Container(width: 680,child: Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: [ 
// Container(width: 335,child: Column(
//   crossAxisAlignment: CrossAxisAlignment.end,
//   children: [
//   Text('سكشن المراجعة'
// ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)

// ,fontSize: 24,fontWeight: FontWeight.w500
// ),
// )

// ,Text('الترم التاني (الصف الثالث الثانوي) ',
// style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
// ,fontSize: 14,fontWeight: FontWeight.w400


// ),),

// ],),),
// Container(
//   height: 57,
//   child:
//   Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
    
//      Image.asset('assets/ashtarlogo.png',width: 40,height: 40,)],))

//   ],),),

],)


,
 SizedBox ( width: 720,child:Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
  
  Text('650 ج .م',style: TextStyle(color:
 Color.fromARGB(255, 6, 69, 152)
 ,fontSize: 20,fontWeight: FontWeight.w600)
 ),
   Text(' ج .م${controller.cart[index].attachment?['price']??0}'

,style: TextStyle(color:Color.fromARGB(255, 80, 124, 181)


 ),


),


],))
    
   ],) );
 

  })
  ,
  ...List.generate(controller.cart.map((e)=>e.attachment).length,(index){
print((controller.cart.map((e)=>e.attachment).length)) ;
   controller. fetchCart();
 cart=controller.cart.length;
    // Price=controller.cart[index].attachment?['price'].length;
    Price=controller.cart[index].section?['price']??0;
    // print(Price.bitLength);
    // print(Price2);

return
    Container( //assets/ashtarlogo.png
    padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
    width: 768,decoration: BoxDecoration
  (border: Border.all(width: 2,color
  :Color.fromARGB(255, 6, 69, 152) 
  )
  ,borderRadius: BorderRadius.circular(8)

  
  ),
   child: Column(children: [
Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
 children: [
     Container( decoration: BoxDecoration
    (
      color: Color.fromARGB(255, 235, 239, 249),
      borderRadius: BorderRadius.circular(50)
    
    ),
      width: 32,height: 32,
      child:InkWell(child:Icon(Icons.delete_outline,color
  :Color.fromARGB(255, 6, 69, 152) ,size:18 ,)  ,
  onTap: (){
    controller. deletefromcart(controller.cart[index].id.toString());
 controller.fetchCart();

  
  },
  ) ,)

  , SizedBox(width: 680,child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [ 
SizedBox(width: 335,child: Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
  Text('ملازمة المراجعة'
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)

,fontSize: 24,fontWeight: FontWeight.w500
),
)

,Text('الترم التاني (الصف الثالث الثانوي) ',
style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 14,fontWeight: FontWeight.w400


),),

],),),
SizedBox(
  height: 57,
  child:
  Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    
     Image.asset('assets/ashtarlogo.png',width: 40,height: 40,)],))

  ],),),

],)


,
 SizedBox ( width: 720,child:Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
  
  Text('650 ج .م',style: TextStyle(color:
 Color.fromARGB(255, 6, 69, 152)
 ,fontSize: 20,fontWeight: FontWeight.w600)
 ),
   Text(' ج .م${controller.cart[index].section?['price']??0}'

,style: TextStyle(color:Color.fromARGB(255, 80, 124, 181)


 ),


),


],))
    
   ],) );
 

  })
  ,

ontap?SizedBox(width: 676,height: 195,child: Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
   SizedBox(width: 628,child:Text('العنوان المسجل',
   textAlign: TextAlign.end,style: TextStyle(
      fontSize: 20,fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 6, 69, 152)),) ,) ,
      Container(width: 676,height: 146,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 1 ,color: Color.fromARGB(255, 6, 69, 152)
      
       )
      ),child: Row(mainAxisAlignment: MainAxisAlignment.end,
      children: [
       InkWell(child:Container(
          alignment: Alignment.topRight,
          child: Text('تعديل العنوان',style: TextStyle(
            fontSize: 16,fontWeight: FontWeight.w400,
            color:Color.fromARGB(255, 61, 84, 110)),),),
            onTap: () {
              showDialog(context: context, builder: (context){
                return AlertDialog(content: SizedBox(width:757 ,height:496 ,             
              child: Column(
                spacing: 32,
                children: [
                SizedBox(
                  width: 709,
                  child:Text('العنوان',textAlign: TextAlign.end,style: TextStyle(fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 6, 69, 152) ),) ,)
,SizedBox(width: 709,child: Row(children: [
  SizedBox(width: 300,
  child: Column(children: [
    SizedBox(width: 300,child: Column(children: [
      Text('المحافظة',style: TextStyle(
        fontWeight: FontWeight.w500,fontSize: 16,
        color: Color.fromARGB(255, 80, 124, 181)),)
  ,       SizedBox( height: 44,child:     Directionality(
          textDirection: TextDirection.rtl,
          child: DropdownButtonFormField<String?>(
            // value: value.value,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: '',
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
                    'hint',
                    style: const TextStyle(
                      fontSize: 16,
                      color:  Color.fromARGB(255, 154, 175, 228),
                    ),
                  ),
                ),
              ),
              ...items.map((e) {
                return DropdownMenuItem<String?>(
                  value: e,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'course',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 154, 175, 228),
                      ),
                    ),
                  ),
                );
              }),
            ],
            onChanged: (newValue) {
              // onChanged(newValue);
            },
          ),
        ),
      ) 
   
   
    ],),)
  ],),
  )
],),)

              ],),
              ),) ;});
            },
            ), 
        SizedBox(width: 507,child: 
         Row(children: [

SizedBox(width: 440,child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.end, children: [
  Container( child: Text(' احمد محمد احمد القنصل',textAlign: TextAlign.end,style: TextStyle(color:
   Color.fromARGB(255, 80, 124, 181)  ,fontWeight:FontWeight.w500,fontSize:16),),),
  Container( child: Wrap(children: [Text(
    style:TextStyle(color: Color.fromARGB(255, 6, 69, 152)
    ,fontSize: 20,fontWeight: FontWeight.w400
    ) ,
    '134-شارع محمد احمد -مدينه نصر -بجانب صيدليه مريم  القاهره',textAlign: TextAlign.end,)],),)
,Container(child: Text('01234567890+',textAlign: TextAlign.end,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 80, 124, 181)),),)

],),),

SizedBox(width: 55,child: Column(
  
  spacing: 15,
  children: [
  Text(':الاسم',style: TextStyle(
  color: Color.fromARGB(255, 181, 181, 181)
  
  ,fontSize: 16,fontWeight:FontWeight.w500 
  ),),
  SizedBox(height: 32, child: Text(':العنوان',style: TextStyle(
  color: Color.fromARGB(255, 181, 181, 181)
  
  ,fontSize: 16,fontWeight:FontWeight.w500 
  ),),),
 
  Text(':التلفون',style: TextStyle(
  color: Color.fromARGB(255, 181, 181, 181)
  
  ,fontSize: 16,fontWeight:FontWeight.w500 
  ),),


],) ,)
         
         ],),)
      ],
      
      ),)
  ],
),):Container(),
ontap2?Column(children: [Container(
width: 676 ,padding: EdgeInsets.all(24),
child: Column(spacing: 24, children: [
Container(child: Column(
  spacing: 24,
  crossAxisAlignment: CrossAxisAlignment.end, children: [
  Text('طريقه الدفع',style: TextStyle(
  color: Color.fromARGB(255, 6, 69, 152)
  ,fontSize: 20,fontWeight: FontWeight.w500
  
  ),),
  Wrap(alignment: WrapAlignment.end, children: [Text(
    
    textAlign: TextAlign.end,
    style: TextStyle(color: Color.fromARGB(255, 244, 67, 54)
  ,fontSize: 16,fontWeight: FontWeight.w400
  ), 'الرصيد الموجود في حسابك غير كافي لشراء الطلبية، يرجى شحن المحفظه عن  طريق الشحن السريع من خلال الكود , لازم تزود 500 جنيه رصيد.  ')],)
,SizedBox(width: 220,height: 44,
// color: Color.fromARGB(255, 6, 69, 152)
 
//  ,
 child: 
 TextButton( style:
 TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 6, 69, 152)
 ,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),) 
  )
 ,onPressed: () {
  showDialog(
context: context,
builder: (context){
return AlertDialog(
  backgroundColor: Colors.white,
  contentPadding: EdgeInsets.all(16),
  shape:RoundedRectangleBorder(
  borderRadius:BorderRadius.circular(16) 
  
  ),
   content: SizedBox(width: 431,height: 405,
child: Column( children: [SizedBox(height: 7,),
SizedBox( width: 383,
child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
Text('اشحن محفظتك',style: TextStyle( 
  color: Color.fromARGB(255, 6, 69, 152),
fontSize: 32,fontWeight: FontWeight.w600


),




)
,
Text('رصيدك دلوقتي 500 جنيه',style:
 TextStyle(color: Color.fromARGB(255, 80, 124, 181)
 ,fontSize: 14,fontWeight: FontWeight.w400
 ),)
,
SizedBox(height: 7,)

],)

  
 
),Container(width: 383,decoration: BoxDecoration(borderRadius: BorderRadius.only(
  topLeft:Radius.circular(16) ,topRight: Radius.circular(16))
  
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(width: 383,height: 68,alignment: Alignment.center,decoration: BoxDecoration(
      color:Color.fromARGB(255, 212, 221, 232) 
      ,borderRadius: BorderRadius.only(topLeft: Radius.circular(24),
      topRight: Radius.circular(24)
      
      ),border: Border(
         top: BorderSide( width: 1,color: Color.fromARGB(255, 154, 175, 228)),
         right: BorderSide( width: 1,color: Color.fromARGB(255, 154, 175, 228)),
         left: BorderSide( width: 1,color: Color.fromARGB(255, 154, 175, 228)),
      
      
      )
      ),child: Text('الشحن السريع'
      ,textAlign: TextAlign.center
      ,style: TextStyle(
        
        color: Color.fromARGB(255, 6, 69, 152),
      fontSize: 20,fontWeight: FontWeight.w600
      
       ),),),
// SizedBox(height: 24,),
Container(
  width: 383,decoration: BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16)),
    border: Border(
    bottom:BorderSide(width: 1,color: Color.fromARGB(255, 154, 175, 228)),
    left:BorderSide(width: 1,color: Color.fromARGB(255, 154, 175, 228))
   ,right:BorderSide(width: 1,color: Color.fromARGB(255, 154, 175, 228))
     )),
  child: Column(
   spacing: 16,
    children: [

      SizedBox(height: 24,),SizedBox(
        width: 335,
        child:Text('استخدم الكود لشحن ع المنصه',textAlign: TextAlign.end,style: TextStyle(
  fontSize: 16,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 6, 69, 152)),) ,)

 , Container(
    width: 335,height: 44,decoration: BoxDecoration(border:Border.all(color:Color.fromARGB(255, 154, 175, 228) ,width: 1) ),
    child:TextField(
      controller: controller.chargeCode,
      decoration: InputDecoration(border:OutlineInputBorder(
  borderRadius: BorderRadius.circular(8)
  ,borderSide:BorderSide(color:Color.fromARGB(255, 154, 175, 228) ,width: 1) 
 )),))
 ,  SizedBox(
    width: 335,height: 44,
    child: TextButton(
  style: TextButton.styleFrom(shape: 
  RoundedRectangleBorder(
borderRadius: BorderRadius
.circular(8)),backgroundColor:
 Color.fromARGB(255, 6, 69, 152)),
  onPressed: (){

    controller.chargewallet();
    Navigator.pop(context);
showDialog(context: context, builder: (context){
  
  return AlertDialog(content:SizedBox(width: 431,height: 405,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [Image.asset('assets/bigright.png',width: 229,height: 229,
  )
  ,SizedBox(width: 315,height: 88, child: Wrap(children: [
   Text('تم شحن محفظتك بنجاح',
   style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 32,fontWeight: FontWeight.w600
   
   ),)
,Text('انت دلوقتي رصيدك 1568 جنيه تقدر دلوقتي تتم عمليه الشراء بسهوله !!!'
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontSize: 16,fontWeight: FontWeight.w400
),
)

  ],),)
  
  ],),));

});

  }, child: Text('اشحن دلوقتي',style: 
  TextStyle(color: Color.fromARGB(255, 255, 255, 255)
 , fontSize: 18,fontWeight: FontWeight.w500
  ),)
  
  ),),
SizedBox(height: 16,)
  ],
  
  ),) ,

  ],),
  
  ),SizedBox(width: 383,child: Wrap(alignment: WrapAlignment.end, children: [ Text(
   textAlign: TextAlign.end,
   textDirection: TextDirection.rtl,
    style: TextStyle(
      color: Color.fromARGB(255, 107, 107, 107),fontSize: 12,fontWeight: FontWeight.w400),
    'الرصيد الموجود في حسابك غير كافي لشراء الطلبية، يرجى شحن المحفظه عن  طريق الشحن السريع من خلال الكود , لازم تزود 500 جنيه رصيد.  ')
],),)
 ],),
),);
  });
 }, child:Text('اشحن دلؤتي',style: 
 TextStyle(color: Color.fromARGB(255, 255, 255, 255)
 ,fontSize: 18,fontWeight: FontWeight.w600
 
 ),) ,),
 )

],),)
],),

),Container(width: 676,
padding: EdgeInsets.fromLTRB(24, 16, 24, 24),
child: Column(crossAxisAlignment: CrossAxisAlignment.end, 
children: [
  SizedBox(width: 676,child:
  Text(textAlign: TextAlign.end, 'معك كود خصم؟',style: 
TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontSize: 20,fontWeight: FontWeight.w500
),
  )
)

,SizedBox(width: 628,child: Row(
  spacing: 16,
  children: [
SizedBox(width: 173,height: 44,child: TextButton(
  style: TextButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),  
    backgroundColor: Color.fromARGB(255, 6, 69, 152),),
  onPressed: (){}, child: Text('تطبيق',style: TextStyle(
    fontSize: 18,fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 255, 255, 255)),)),),
    SizedBox(width: 439,height: 44, child:
    TextField(
  textAlign: TextAlign.end,
  decoration: InputDecoration(
  hintText: 'ادخل الكود',hintTextDirection:TextDirection.rtl,
    hintStyle: TextStyle(color: Color.fromARGB(255, 80, 124, 181)
    ,fontSize: 16,fontWeight: FontWeight.w400
    ),
    contentPadding: EdgeInsets.only(right: 16,left: 16),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
    // gapPadding: EdgeInsets.only(right: 16),
    borderSide:
 BorderSide(width: 1,color: Color.fromARGB(255, 154, 175, 228)))),)

     ,)

]
,),)

],),

)
],):Container(),
controller.cart.isNotEmpty?
ontap3==false?
Container( width: 768,padding: EdgeInsets.fromLTRB(24, 24, 24, 48), 
child: Column(  spacing: 24, children: [
SizedBox( width: 720,child: 
Column(crossAxisAlignment: CrossAxisAlignment.end,spacing: 4, children: [
  SizedBox(width: 720, 
child:Text('تفصيل الطلبية',textAlign: TextAlign.end,style: TextStyle(
  fontSize: 20,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 6, 69, 152)),) ,),

  SizedBox( width: 720,child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('${controller.pricelength} ج.م',style:
   TextStyle(color: Color.fromARGB(255, 80, 124, 181)),
   
   ),
    Text('الإجمالى',style:
   TextStyle(color: Color.fromARGB(255, 80, 124, 181)),
   
   ),
    
   
   
   ],),),
  SizedBox( width: 720,child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('300 ج.م',style:
   TextStyle(color: Color.fromARGB(255, 80, 124, 181)),
   
   ),
    Text('قيمة الخصم',style:
   TextStyle(color: Color.fromARGB(255, 80, 124, 181)),
   
   ),
    
   
   
   ],),),
  SizedBox( width: 720,child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('${controller.pricelength-300} ج.م',style:
   TextStyle(color: Color.fromARGB(255, 6, 69, 152)
   ,fontSize: 24,fontWeight: FontWeight.w500
   ),
   
   ),
    Text('الإجمالى بعد الخصم',style:
   TextStyle(fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),
   
   ),
    
   
   
   ],),),
  
],)
),
ontap==false?
SizedBox( width: 628,height: 44,child:TextButton( 
  onPressed: (){
  setState(() {
     ontap=true;
  });

},style:
 TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)) ,
  backgroundColor: Color.fromARGB(255, 6, 69, 152)),
 child: Text('اتمام الشراء',style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w600,
  color: Color.fromARGB(255, 255, 255, 255)),),) ,)
:
ontap2==false?
SizedBox( width: 720,height: 44,child:TextButton( onPressed: (){
  setState(() {
    //  ontap=true;
    ontap2=true;
  });

},style:
 TextButton.styleFrom(shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8)) ,
  backgroundColor: Color.fromARGB(255, 6, 69, 152)),
 child: Text('العنوان صح',style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w600,
  color: Color.fromARGB(255, 255, 255, 255)),),) ,)
:ontap2==true?Column(
  
  children: [
    
    SizedBox( width: 720,height: 44,child:TextButton( onPressed: (){
  setState(() {
    //  ontap=true;
    // ontap2=true;
    ontap3=true;

  });

},style:
 TextButton.styleFrom(shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8)) ,
  backgroundColor: Color.fromARGB(255, 6, 69, 152)),
 child: Text('تاكيد الطلب',style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w600,
  color: Color.fromARGB(255, 255, 255, 255)),),) ,)],)
   :Container(),


],)):Container():Container(
  
) ,
// :
ontap3?
SizedBox( width: 676, child: Column(children: [
  SizedBox( width: 628,child: Text('تفصيل الطلبية',
  style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
  
  ,fontSize: 20,fontWeight: FontWeight.w500,
  ),
  textAlign: TextAlign.end,
  
  ),),SizedBox(height: 14,),
SizedBox(width: 628, child:Column(
  spacing: 14,
  children: [
 SizedBox(width: 628,child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
Text('100 ج.م',style: TextStyle(color:  Color.fromARGB(255, 80, 124, 181)),),

  Text('رسوم الشحن',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181)
  
  
  ),)

 ],),) 

, SizedBox(width: 628,child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
Text('300 ج.م',style: TextStyle(color:  Color.fromARGB(255, 80, 124, 181)),),

  Text('رسوم الشحن',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181)
  
  
  ),)

 ],),) 

 ,SizedBox(width: 628,child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
Text('950 ج.م',style: TextStyle(color:  Color.fromARGB(255, 80, 124, 181)),),

  Text('رسوم الشحن',style: TextStyle(color: Color.fromARGB(255, 80, 124, 181)
  
  
  ),)

 ],),) 
 ,SizedBox(width: 628,child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
Text('650 ج.م',style: TextStyle(
  fontSize: 24,fontWeight: FontWeight.w600,
  color:  Color.fromARGB(255, 6, 69, 152)),),

  Text('الإجمالى بعد الخصم',style: TextStyle(
    fontWeight: FontWeight.w500,fontSize: 16,
    color: Color.fromARGB(255, 6, 69, 152)
  
  
  ),)

 ],),) 


],) ,)

,SizedBox( width: 628,child: Column(children: [
  SizedBox(height: 24,),
SizedBox(width: 628,height: 44,child:  
TextButton( onPressed: (){


  
},  style: TextButton.styleFrom(
  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(8) ) ,
  backgroundColor: Color.fromARGB(255, 6, 69, 152)), child: Text('تاكيد الطلب',style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w600,
  color: Color.fromARGB(255, 255, 255, 255)),)
,
  
  ) ,), SizedBox(height: 24,),
Wrap (alignment: WrapAlignment.end, children: [
 
  Text(' الآمان والخصوصية',style: TextStyle(
  fontSize: 14,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 80, 124, 181)),)
  ,SizedBox(height: 8,),
 Container( child:  Wrap(alignment:  WrapAlignment.end, children: [Text(
  textAlign: TextAlign.end,
   style: TextStyle(
    fontSize: 12,fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 80, 124, 181)),
    'عملية الدفع عندنا آمنة وموثوقة، حيث بيتم تشفير معلوماتك الشخصية وبيانات الدفع الخاصة بيك بنظام تشفير 128 بت، وكمان مش هيتم تخزين أي معلومات تخص بطاقة الدفع على النظام عندنا.')],)
)],)
],),)
],),)

:Container()
// SizedBox(height: 16,),

],),)

,SizedBox( width: 628,child: Column(children: [
  SizedBox(height: 24,),
SizedBox(width: 628,height: 44,child:  
TextButton( onPressed: (){


  
},  style: TextButton.styleFrom(
  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(8) ) ,
  backgroundColor: Color.fromARGB(255, 6, 69, 152)), child: Text('تاكيد الطلب',style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.w600,
  color: Color.fromARGB(255, 255, 255, 255)),)
,
  
  ) ,), SizedBox(height: 24,),
Wrap (alignment: WrapAlignment.end, children: [
 
  Text(' الآمان والخصوصية',style: TextStyle(
  fontSize: 14,fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 80, 124, 181)),)
  ,SizedBox(height: 8,),
 Container( child:  Wrap(alignment:  WrapAlignment.end, children: [Text(
  textAlign: TextAlign.end,
   style: TextStyle(
    fontSize: 12,fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 80, 124, 181)),
    'عملية الدفع عندنا آمنة وموثوقة، حيث بيتم تشفير معلوماتك الشخصية وبيانات الدفع الخاصة بيك بنظام تشفير 128 بت، وكمان مش هيتم تخزين أي معلومات تخص بطاقة الدفع على النظام عندنا.')],)
)],)
],),)
],),)

:Container()
// SizedBox(height: 16,),

],),),

],)
)
],) ,)
: Column(children: [SizedBox(width: 770,
child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
  children: [

  Image.asset("assets/emptycard.png",width:239,height:255)
,


],),
)
,SizedBox(width: 770,child: Column(//spacing: 16,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
  Text('مفيش حاجه ليك في السله دلوقتي',style: TextStyle(
    fontSize: 32,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,
    Text('يلا شوف ايه اللي محتاجه في المنهج و الحق اشتريه !!!',
    style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
    fontSize: 16,fontWeight: FontWeight.w400
    ),)
],
),)],)

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
             ])) )





]))


// , Container( width: 772,child: Container( child:  Column( crossAxisAlignment: CrossAxisAlignment.end,  children: [
//     Container(child: Text('الصورة الشخصية',style: TextStyle(
//       fontSize: 32,fontWeight: FontWeight.w600,
//       color: Color.fromARGB(255, 6, 69, 152)),)
//   ,),
// Container(width: 724,height: 130,child: Column(
  
  
//   children: [
// Container(width: 676,
// child:Row(
  
//   mainAxisAlignment: MainAxisAlignment.end
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
  HomeController controller,
  String hint,
  Rx<String?> value,
  List<Course> items,
  Function(String?) onChanged,
) {
  controller.fetchSAllCourses();
  return Container(
    width: 552,decoration: BoxDecoration(color: Colors.white
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 16),
       SizedBox(height: 44,child:     Directionality(
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
                  value: course.name,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      course.name.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 154, 175, 228),
                      ),
                    ),
                  ),
                );
              }),
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

  Widget _buildClassCard(String title, String imagePath,context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return Column(children: [ 
      Container(
      width: 363,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 212, 221, 232),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 180,width:screenWidth,
            padding: const EdgeInsets.all(8),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
         
        ],
      ),
    )
    , Padding(
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
    ],); 
   
  }
Widget _buildPaymentMethodCard({
  required String image,
  required String text,
  required String value,
  double imageWidth = 40,
}) {
    return Obx(() => Container(
    width: 330,
    height: 166,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 245, 245, 245),
      borderRadius: BorderRadius.circular(16),
    ),
    padding: EdgeInsets.fromLTRB(24, 40, 24, 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        SizedBox(
          width: 282,
          child: Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Radio<String>(
                value: value,
                groupValue: selectedMethod.value,
                onChanged: (val) {
                 selectedMethod.value = val!;
                },
              ),
              Image.asset(image, height: 16, width: imageWidth),
            ],
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Color.fromARGB(255, 6, 69, 152),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  ));
}
  Widget _buildTeacherInfo(bool isMobile,screenWidth) {
    return SizedBox(
width: !isMobile?1280:screenWidth,     // padding: const EdgeInsets.all(16.0),
      child: Row(spacing: 1,
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
        //  SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
        //   ),
    
          Text('منافذ بيع الملازم',style: TextStyle( fontWeight: FontWeight.w400
      ,  color: Color.fromARGB(255, 6, 69, 152)),
          ),
          SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
          ),
          Text('الحق احجز ملازمك  ',style: TextStyle( fontWeight: FontWeight.w400
      ,   color: Color.fromARGB(255, 181, 181, 181)),
          ),
          SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
          )
        //   Text('مادة الفيزياء',style: TextStyle(color: Color.fromARGB(255, 181, 181, 181)),),
        // SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
        //   ),Text('الصف الثالث الثانوي'),
         ,        Text('مادة الفزياء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      ,  color: Color.fromARGB(255, 181, 181, 181),
        ),), Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
        Text('الصف الثالث الثانوي',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      , color: Color.fromARGB(255, 181, 181, 181),
        ),),
          Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
        Text('الرئيسية',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400
      , color: Color.fromARGB(255, 181, 181, 181),
        ),)
        
        ]
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
                      _buildInfoRow('icons/location.png',
                          '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/sms (1).png', 'support@ashtar.app'),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _icon('icons/Frame (14).png'),
                          const SizedBox(width: 12),
                          _icon('icons/Frame (13).png'),
                          const SizedBox(width: 12),
                          _icon('icons/Frame (12).png'),
                          const SizedBox(width: 12),
                          _icon('icons/Frame (11).png'),
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
                          _storeButton('icons/Frame (16).png', 'Google play'),
                          const SizedBox(width: 12),
                          _storeButton('icons/Frame (15).png', 'App Store'),
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


Widget _buildPagination(HomeController controller, int currentPage) {
    int currentIndex = 1;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(10, (index) {
      final pageIndex = index + 1;
      return GestureDetector(
        onTap: () {
          // setState(() {
            currentIndex = pageIndex;
            controller.fetchCodes(page: pageIndex,); 
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
         
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              child: Image.asset(
                "assets/exam.png",
                width: 120,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

         
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
      width: 215,
      height: 91,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.only(topLeft: e,topRight: ),
        gradient: const LinearGradient(
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
      

          const SizedBox(height: 8),

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

     ],
      ),
        );
  }
}
