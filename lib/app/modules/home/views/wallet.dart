import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/menuebar%20paym.dart';
import 'package:my_app/app/modules/home/views/profile%20copy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';

import 'wallet_cart.dart';
// class Schedule el malazem extends StatefulWidget {
//   const Schedule el malazem({super.key,});

//   @override
//   State<Schedule el malazem> createState() => _Schedule el malazemState();
// }
class wallet extends StatefulWidget {
  const wallet({super.key});

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// // class _Schedule el malazemState extends State<Schedule el malazem> {
// class wallet extends StatelessWidget {
 
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
          // print('eee${courseInfos}');
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

PageController _pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, // ~1 / 4.5
initialPage: 1

);  int currentIndex = 1;
HomeController controller=HomeController();
var g=controller.course_info.map((e)=>e.section?.length);
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
1820,    child:Row(
  crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ 
              Column(crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container( width: 852,height: 1252,
                 padding: EdgeInsets.fromLTRB(40, 48, 40, 48)
,
decoration: BoxDecoration(
  color:Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(16)),
// border: Border.all(width: )
)
,child:
Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
  Container(width: double.infinity, 
  alignment: Alignment.centerRight,
  child:Text('محفظتك'
,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
,fontSize: 32,fontWeight: FontWeight.w600,
)
 ,),
) 
,Container(  height: 252,  child: Column(  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Image.asset('assets/ash7enma7faztak1.png',width: 311,height: 185,)
,WalletCard()
],),
Container(height: 40,width: double.infinity,child:TextButton(onPressed: (){
  // DateTime updatedDate = 
showDialog(
  context: context,
  builder: (context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 757,
        height: 730,
        padding: const EdgeInsets.all(32), // optional: add padding if needed
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(// spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // First Row
              Row(
                children: [
                  _buildPaymentMethodCard(
                    image: 'assets/Group23576.png',
                    text: 'فوري باي',
                    value: '2فوري باي',
                  ),
                  SizedBox(width: 8),
                  _buildPaymentMethodCard(
                    image: 'assets/Frame_17.png',
                    text: 'كارت شحن أشطر',
                    value: '2كارت شحن أشطر',
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Second Row
              Row(
                children: [
                  _buildPaymentMethodCard(
                    image: 'assets/Group87970.png',
                    text: 'بطاقة (دفع-ائتمان)',
                    value: '2بطاقة دفع اءتمان',
                    imageWidth: 79,
                  ),
                  SizedBox(width: 8),
                  _buildPaymentMethodCard(
                    image: 'assets/Frame203.png',
                    text: 'بطاقة (دفع-ائتمان)',
                    value: '2دفع-ائتمان',
                    imageWidth: 76.89,
                  ),
                ],
              ),
            
            
            Container(
              width: 677,
              child:Column(
                spacing: 16,crossAxisAlignment: CrossAxisAlignment.end,
                children: [Text('قيمة المبلغ',style: TextStyle(
                
                fontWeight: FontWeight.w500,fontSize: 16,
                color: Color.fromARGB(255, 80, 124, 181)),),
                Container(width: 677,height: 44, child: 
                TextField(textAlign: TextAlign.end,controller: controller.rechargeCode,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    
                    color:
                Color.fromARGB(255, 152, 175, 228)
                  ,fontSize: 16,fontWeight: FontWeight.w400
                  ),
                  hintText: 'ادخل قيمة المبلغ',
      enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 154, 175, 228),
        width: 1.0,
      ),
    ),),
                )
              )
              , Container(width: 677,height: 44,child:TextButton(
                style: TextButton.styleFrom(backgroundColor: 
                Color.fromARGB(255, 6, 69, 152)
               , shape:RoundedRectangleBorder(borderRadius
               :  BorderRadius.circular(8)
                                )                ),
                
                onPressed:(){

controller.charge(amount: 10,context: context);
controller.update();
                } , child: Text('ادفع',style: TextStyle(
                  fontSize: 18,fontWeight:FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255)),))
              
             ) ],) )
            
            ],
          ),
        ),
      ),
    );
  },
);

}
,style: TextButton.styleFrom(backgroundColor:
 Color.fromARGB(255, 6, 69, 152)
,padding: EdgeInsets.fromLTRB(24,8, 24, 8)
,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
)
, 

child:Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  
  Text('شحن محفظتك',style: TextStyle(
    fontSize: 18,fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 255, 255, 255)),),
Image.asset('assets/Icon.png',width:24 ,height:24 ,)
],) )
 ,)

],) ,width:772 ,)
,Container(width: 772,height: 482,padding: EdgeInsets.only(top: 24),
child: 
Column(crossAxisAlignment: CrossAxisAlignment.end,
  // spacing: 24,
  children: [
    Text('تفصيل المعاملات',textAlign: TextAlign.end,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152)
    ,fontWeight: FontWeight.w500
   ,fontSize:24 ),)
,    Container(
  decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10)) 
  ,color: Color.fromARGB(255, 212, 221, 232),),

width: 772,height: 75,padding: EdgeInsets.fromLTRB(24, 15, 24, 15),
child:

Column(children: [
  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
 children: [
  Container(alignment: Alignment.center,child:Text('العملية',style:
  TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 6, 69, 152)),) ,
 width: 139,height: 45,padding: EdgeInsets.all(10),
 ),
  Container(alignment: Alignment.center,
    padding: EdgeInsets.all(10),width: 237,height: 45,
    child: Text('الخدمة',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500
  
  ,color: Color.fromARGB(255, 6, 69, 152)),) ,),
  Container(alignment: Alignment.center,width: 124,height: 45,padding: EdgeInsets.all(10),
  child: Text('التاريخ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500
  
  ,color: Color.fromARGB(255, 6, 69, 152)),),
  ),
  Container(alignment: Alignment.center,width: 128,height: 45,padding: EdgeInsets.all(10),
  child: Text('المبلغ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500
  
  ,color: Color.fromARGB(255, 6, 69, 152)),),
  )
 ],),

],)
),...List.generate( controller.codes.length,(index){
return Container(
decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.05), 
                  offset: Offset(0, 3), 
                  blurRadius: 13, 
                  spreadRadius: 0, 
                ),],),
  height: 62,width: 772,padding: EdgeInsets.only(right: 24,left: 24),
child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween

, children: [
  
  Container(alignment: Alignment.center,width: 128,height: 45,padding: EdgeInsets.fromLTRB(24, 10, 24,10),
   child: Text('+${controller.codes[index].balance}.م',style: TextStyle(
    fontSize: 16,fontWeight:FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),),)
   ,Container(width: 124,height: 60,alignment: Alignment.center,//padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
child:   Column(
  
  mainAxisAlignment: MainAxisAlignment.center,
  children: [Text('${DateTime.parse(controller.codes[index].updateddate.toString()).day}/${DateTime.parse(controller.codes[index].updateddate.toString()).month}/${DateTime.parse(controller.codes[index].updateddate.toString()).year}'
,style: TextStyle(fontWeight: FontWeight.w500,
fontSize: 16,color: Color.fromARGB(255, 6, 69, 152)),
),
Container(alignment: Alignment.center,child: Text('${DateTime.parse(controller.codes[index].updateddate.toString()).hour}:${DateTime.parse(controller.codes[index].updateddate.toString()).minute}:${DateTime.parse(controller.codes[index].updateddate.toString()).second}',style: 
TextStyle(color: Color.fromARGB(255, 6, 69, 152) ,fontSize: 15,fontWeight: FontWeight.w300),))
],)
  ),
  Container(width: 237,height: 45,child:Container(width: 237,height: 45
  ,padding: EdgeInsets.all(10),
alignment: Alignment.center,
  child: Text('شحن المحفظه',style: TextStyle(   fontSize: 16,fontWeight:
    FontWeight.w500, color: Color.fromARGB(255, 6, 69, 152)),),
  ),),
  
  
   Container(padding: EdgeInsets.fromLTRB(16, 8, 16, 8), alignment: Alignment.center,height: 45,child: Row(children:
   [Text('استرجاع',style: TextStyle(   fontSize: 16,fontWeight:
    FontWeight.w500, color: Color.fromARGB(255, 6, 69, 152)),),
     Image.asset('assets/empty-wallet-change.png',width:24 ,height: 24,)],),)
  
,

],),) ;

}),


// ,Container(
// decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(
//                   color: Colors.black.withOpacity(0.05), 
//                   offset: Offset(0, 3), 
//                   blurRadius: 13, 
//                   spreadRadius: 0, 
//                 ),],),
//   height: 62,width: 772,padding: EdgeInsets.only(right: 24,left: 24),
// child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween

// , children: [
  
//   Container(alignment: Alignment.center,width: 128,height: 45,padding: EdgeInsets.fromLTRB(24, 10, 24,10),
//    child: Text('+15000ج.م',style: TextStyle(
//     fontSize: 16,fontWeight:FontWeight.w500,
//     color: Color.fromARGB(255, 6, 69, 152)),),)
//    ,Container(width: 124,height: 60,alignment: Alignment.center,//padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
// child:   Column(
  
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [Text('12/10/2024'
// ,style: TextStyle(fontWeight: FontWeight.w500,
// fontSize: 16,color: Color.fromARGB(255, 6, 69, 152)),
// ),
// Container(alignment: Alignment.center,child: Text('4:30PM',style: 
// TextStyle(color: Color.fromARGB(255, 6, 69, 152) ,fontSize: 15,fontWeight: FontWeight.w300),))
// ],)
//   ),
//   Container(width: 237,height: 45,child:Container(width: 237,height: 45
//   ,padding: EdgeInsets.all(10),
// alignment: Alignment.center,
//   child: Text('شحن المحفظه',style: TextStyle(   fontSize: 16,fontWeight:
//     FontWeight.w500, color: Color.fromARGB(255, 6, 69, 152)),),
//   ),),
  
  
//    Container( alignment: Alignment.center,height: 45,child: Row(children:
//    [Text('استرجاع',style: TextStyle(   fontSize: 16,fontWeight:
//     FontWeight.w500, color: Color.fromARGB(255, 6, 69, 152)),),
//      Image.asset('assets/empty-wallet-change.png',width:24 ,height: 24,)],),)
  
// ,

// ],),) 
// ,Container(
// decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(
//                   color: Colors.black.withOpacity(0.05), 
//                   offset: Offset(0, 3), 
//                   blurRadius: 13, 
//                   spreadRadius: 0, 
//                 ),],),
//   height: 62,width: 772,padding: EdgeInsets.only(right: 24,left: 24),
// child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween

// , children: [
  
//   Container(alignment: Alignment.center,width: 128,height: 45,padding: EdgeInsets.fromLTRB(24, 10, 24,10),
//    child: Text('+15000ج.م',style: TextStyle(
//     fontSize: 16,fontWeight:FontWeight.w500,
//     color: Color.fromARGB(255, 6, 69, 152)),),)
//    ,Container(width: 124,height: 60,alignment: Alignment.center,//padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
// child:   Column(
  
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [Text('12\10\2024'
// ,style: TextStyle(fontWeight: FontWeight.w500,
// fontSize: 16,color: Color.fromARGB(255, 6, 69, 152)),
// ),
// Container(alignment: Alignment.center,child: Text('4:30PM',style: 
// TextStyle(color: Color.fromARGB(255, 6, 69, 152) ,fontSize: 15,fontWeight: FontWeight.w300),))
// ],)
//   ),
//   Container(width: 237,height: 45,child:Container(width: 237,height: 45
//   ,padding: EdgeInsets.all(10),
// alignment: Alignment.center,
//   child: Text('شحن المحفظه',style: TextStyle(   fontSize: 16,fontWeight:
//     FontWeight.w500, color: Color.fromARGB(255, 6, 69, 152)),),
//   ),),
  
  
//    Container( alignment: Alignment.center,height: 45,child: Row(children:
//    [Text('استرجاع',style: TextStyle(   fontSize: 16,fontWeight:
//     FontWeight.w500, color: Color.fromARGB(255, 6, 69, 152)),),
//      Image.asset('assets/empty-wallet-change.png',width:24 ,height: 24,)],),)
  
// ,

// ],),) 
// ,Container(
// decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(
//                   color: Colors.black.withOpacity(0.05), 
//                   offset: Offset(0, 3), 
//                   blurRadius: 13, 
//                   spreadRadius: 0, 
//                 ),],),
//   height: 62,width: 772,padding: EdgeInsets.only(right: 24,left: 24),
// child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween

// , children: [
  
//   Container(alignment: Alignment.center,width: 128,height: 45,padding: EdgeInsets.fromLTRB(24, 10, 24,10),
//    child: Text('+15000ج.م',style: TextStyle(
//     fontSize: 16,fontWeight:FontWeight.w500,
//     color: Color.fromARGB(255, 6, 69, 152)),),)
//    ,Container(width: 124,height: 60,alignment: Alignment.center,//padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
// child:   Column(
  
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [Text('12\10\2024'
// ,style: TextStyle(fontWeight: FontWeight.w500,
// fontSize: 16,color: Color.fromARGB(255, 6, 69, 152)),
// ),
// Container(alignment: Alignment.center,child: Text('4:30PM',style: 
// TextStyle(color: Color.fromARGB(255, 6, 69, 152) ,fontSize: 15,fontWeight: FontWeight.w300),))
// ],)
//   ),
//   Container(width: 237,height: 45,child:Container(width: 237,height: 45
//   ,padding: EdgeInsets.all(10),
// alignment: Alignment.center,
//   child: Text('شحن المحفظه',style: TextStyle(   fontSize: 16,fontWeight:
//     FontWeight.w500, color: Color.fromARGB(255, 6, 69, 152)),),
//   ),),
  
  
//    Container( alignment: Alignment.center,height: 45,child: Row(children:
//    [Text('استرجاع',style: TextStyle(   fontSize: 16,fontWeight:
//     FontWeight.w500, color: Color.fromARGB(255, 6, 69, 152)),),
//      Image.asset('assets/empty-wallet-change.png',width:24 ,height: 24,)],),)
  
// ,

// ],),) 

 ],)

)

,
     Container( width: 1120,
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
                                        onPressed: () {

   if (_currentPage > 1) {
        setState(() {
          _currentPage--;
        });
        controller.fetchCodes(page: _currentPage);
      }
                                        },
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
                                             if (_currentPage < 10) { // افترضنا أن هناك 10 صفحات كحد أقصى
        setState(() {
          _currentPage++;
        });
        controller.fetchCodes(page: _currentPage);
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

]))])


,SizedBox(width: 100,)  ,
RightSidebar()

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
        Container(
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
    return Container(
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
                      // _buildInfoRow('icons/location.png',
                      //     '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
                      const SizedBox(height: 12),
                      _buildInfoRow('icons/sms_1)png', 'support@ashtar.app'),
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
