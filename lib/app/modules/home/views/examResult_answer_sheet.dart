import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/controllers/subjectbooks2.dart';
// import 'package:my_app/app/modules/home/views/mainpage%20copy.dart';
import 'package:my_app/app/modules/home/views/mainpage.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'mainpage copy 2.dart';
class ExamresultAnswerSheet extends StatefulWidget {
  const ExamresultAnswerSheet({super.key});

  @override
  State<ExamresultAnswerSheet> createState() => _ExamresultAnswerSheetState();
}

class _ExamresultAnswerSheetState extends State<ExamresultAnswerSheet> {
 final List<String> images = [
  'assets/use1.png',
  'assets/use2.png',
  'assets/use3.png',
  'assets/use5.png',
  'assets/use4.png',
  'assets/use7.png',
  'assets/use2.png',
  'assets/use3.png',
  'assets/use1.png',
];

  final List<List<String>> imageGroups = [
    ['assets/use1.png', 'assets/use2.png', 'assets/use3.png', 'assets/use5.png'],
    ['assets/use4.png', 'assets/use5.png', 'assets/use2.png', 'assets/use5.png'],
    ['assets/use7.png', 'assets/use1.png', 'assets/use2.png', 'assets/use5.png'],
  ];







final int _currentPage=0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

PageController pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, 
initialPage: 1

);

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
 showDialog(
      context: context,
      barrierColor: Colors.transparent, 
      builder: (context) => const MenuDialog(),
    );
       

       }, child:  Icon(Icons.menu, color:Colors.white ,))   
,
              Row(
                children: [
              Image.network('assets/Group87935.png', width: 55),
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
//               Image.network(
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
                    Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Vector_3.png',width: 40,height: 41,),
                    Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Vector_2.png',width: 39.02,height: 40,)
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
                      Image.network('assets/Group87935.png', width: 55),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
      body:GetBuilder( init: HomeController()
      ,builder: (controller){return SingleChildScrollView(
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
//             Image.network(
//               'assets/teachers cover.png',
//               width: screenWidth,
//               fit: BoxFit.fitWidth,
//             ),
//             const SizedBox(height: 20),
            
//             _buildTeacherInfo(isMobile,screenWidth),
//             const SizedBox(height: 20),
//             // Wrap(
//             //   spacing: 16,
//             //   runSpacing: 16,
//             //   alignment: WrapAlignment.center,
//             //   children: [
//               Wrap(
//               spacing: 16,
//               runSpacing: 16,
//               alignment: WrapAlignment.center,
//               children: [
//               InkWell(child: _buildClassCard('احجز ملازمك', 'assets/1st sec.@2x.png',context) ,onTap: (){

//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>subjectBooks2()));
//               },) ,
//                 _buildClassCard('المحضرات المباشرة', 'assets/2nd sec. .png',context),
//             InkWell(child:  _buildClassCard('شوف محضراتك', 'assets/use7.png',context) ,onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder:( context){
// return Subjectbooks();
//               }));

//             },)  
//               ],
//             ),  const SizedBox(height: 20),
//               Wrap(
//               spacing: 16,
//               runSpacing: 16,
//               alignment: WrapAlignment.end,
//               children: [
//                 _buildClassCard('احجز امنحنات الشامل', 'assets/1st sec.@2x.png',context),
//            InkWell(onTap: (){

//             Navigator.push(context, MaterialPageRoute(builder: (context){return
     SizedBox(height: 32,),SizedBox(width: 1120,
     height: 938,child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 32,
      children: [  

   Container(
            
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            TextButton( onPressed: (){},style: 
TextButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
  backgroundColor: Color.fromARGB(255, 6, 69, 152),padding: EdgeInsets.fromLTRB(24, 16, 24, 16)), child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: 
              [
                
               RichText(
            text: const TextSpan( children: [

              TextSpan(text: 'سنوي/',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color.fromARGB(255, 255, 255, 255)))
        
              ,  ])),  Text( '150',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18 ,color: Color.fromARGB(255, 255, 255, 255)),)
              ,Text('اشترك الان',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 255, 255, 255)),)],),)
       ,
             Row( spacing: 1,
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
          
          ],),],)) 
      ,
      Container( decoration: BoxDecoration( 
    color: Colors.white, borderRadius: 
    BorderRadius.circular(20)), width:
     1120//,//height: 851
     ,padding: 
     EdgeInsets.all(32),
   child: Column(
    spacing: 48,
    children: [

SizedBox(
  width: 1056,
  child:Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [ Text('امتحان القوة المتبادلة بين سلكين متوازيين'
    ,style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
    fontSize: 32,fontWeight: FontWeight.w600 ),)],) 
,)
,SizedBox(
  width: 
  1056,//height: 699,


  child:Column(children: [ 
    SizedBox(width: 313,height:64,child:Row(
      spacing: 32,
      children:[

      Container(child: Row(children: [
        Text('ممتاز',style: TextStyle(fontWeight:FontWeight.w600
        ,fontSize: 24,color: Color.fromARGB(255, 6, 69, 152)),)
        ,Image.network('assets/Frame_1.png',width: 64,height: 64,)
        
        ],),)
      ,
      Text(':نتيجة الامتحان',style: TextStyle(fontWeight:
       FontWeight.w600,fontSize: 24,color: Color
       .fromARGB(255, 6, 69, 152)),)
       
       ])),
       Center(child:Column(children: [
         Stack(
  alignment: Alignment.center,
  children: const [
    GreenHalfCircle(),   
    RedQuarterCircle(),  
    YellowArc(),        
    GreyCircle(),
    WhiteCircle(),
],
) , SizedBox(height: 32,) ,
Container(child: 
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  spacing: 10,
  children: [
Container(child: Row(
  
  spacing: 10, children: [
    Text(' عدد الاجابات الصحيحة',style: TextStyle(
      fontWeight: FontWeight.w400,fontSize: 16,
      color: Color.fromARGB(255, 26, 35, 46)),),
Container(width: 27,height: 13,decoration: BoxDecoration
(color: Color.fromARGB(255, 39, 114, 83),borderRadius: BorderRadius.circular(20)),)

],),),
Container(child: Row(
  
  spacing: 10, children: [
    Text(' عدد الاجابات الصحيحة',style: TextStyle(
      fontWeight: FontWeight.w400,fontSize: 16,
      color: Color.fromARGB(255, 26, 35, 46)),),
Container(width: 27,height: 13,decoration: BoxDecoration
(color: Color.fromARGB(255, 242, 195, 42),borderRadius: BorderRadius.circular(20)),)

],),),
Container(child: Row(
  
  spacing: 10, children: [
    Text(' عدد الاجابات الصحيحة',style: TextStyle(
      fontWeight: FontWeight.w400,fontSize: 16,
      color: Color.fromARGB(255, 26, 35, 46)),),
Container(width: 27,height: 13,decoration: BoxDecoration
(color: Color.fromARGB(255, 244, 67, 54),borderRadius: BorderRadius.circular(20)),)

],),),

],),),
SizedBox(height: 36,)
],)  ) ,SizedBox(width: 1056,child:Column(
  
  spacing: 16,
  children: [
  Container(
    width: 1056,height: 88,decoration: 
    BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8),),
    color: Color.fromARGB(255, 222, 247, 227))
    ,padding: EdgeInsets.fromLTRB(12, 22,12, 22),
    child:Column(children: [Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('اجابات8',style: TextStyle(
          color: Color.fromARGB(255, 28, 125, 49),
        fontSize: 14,fontWeight: FontWeight.w400),),
      Text("عدد الاجابات الصحيحة",
      style: TextStyle(color: 
       Color.fromARGB(255, 28, 125, 49),
       fontWeight: FontWeight.w400
       ,fontSize: 16
       ))],),
       
       Container(  width: screenWidth, 
        child:
  Wrap( //alignment: WrapAlignment.center,  
  children:
   [ new LinearPercentIndicator( width:isMobile? screenWidth:1032, lineHeight: 8.0,
    barRadius: Radius.circular(18), percent: 0.2, 
     isRTL: true, progressColor: Color.fromARGB(255, 77, 195, 44)) ,])    ,

                         )    
       ],) )
 , Container(
    width: 1056,height: 88,decoration: 
    BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8),),
    color: Color.fromARGB(255, 255, 247, 219))
    ,padding: EdgeInsets.fromLTRB(12, 22,12, 22),
    child:Column(children: [Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('عدد الاجابات الفائتة',style: TextStyle(
          color: Color.fromARGB(255, 224, 175, 0),
        fontSize: 14,fontWeight: FontWeight.w400),),
      Text("عدد الاجابات الخائطة",
      style: TextStyle(color: 
       Color.fromARGB(255, 224, 175, 0),
       fontWeight: FontWeight.w400
       ,fontSize: 16
       ))],),
       
       Container(  width: screenWidth, 
        child:
  Wrap( //alignment: WrapAlignment.center,  
  children:
   [ new LinearPercentIndicator( width:isMobile? screenWidth:1032, lineHeight: 8.0,
    barRadius: Radius.circular(18), percent: 0.2, 
     isRTL: true, progressColor: Color.fromARGB(255, 224, 175, 0)) ,])    ,

                         )    
       ],) )
,  Container(
    width: 1056,height: 88,decoration: 
    BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8),),
    color: Color.fromARGB(255, 254, 222, 220))
    ,padding: EdgeInsets.fromLTRB(12, 22,12, 22),
    child:Column(children: [Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('اجابات8',style: TextStyle(
          color: Color.fromARGB(255, 200, 17, 4),
        fontSize: 14,fontWeight: FontWeight.w400),),
      Text("عدد الاجابات الخائطة",
      style: TextStyle(color: 
    Color.fromARGB(255, 200, 17, 4),
       fontWeight: FontWeight.w400
       ,fontSize: 16
       ))],),
       
       Container(  width: screenWidth, 
        child:
  Wrap( //alignment: WrapAlignment.center,  
  children:
   [ new LinearPercentIndicator( width:isMobile? screenWidth:1032, lineHeight: 8.0,
    barRadius: Radius.circular(18), percent: 0.2, 
     isRTL: true, progressColor: Color.fromARGB(255, 200, 17, 4)),])    ,

                         )    
       ],) )


],) ,)
],)  
   ,)
  ],),    )   
// //  EllipseExample()



// ;
// }));
          //  },child: _buildClassCard('احجز السنتر', 'assets/2nd sec. .png',context), )    
          //     ],
            // ),  
            // const SizedBox(height: 20),
            
            // const SizedBox(height: 20),

//         Image.network(
//               'assets/thumb 4.png',
//               width: screenWidth,
//               fit: BoxFit.fitWidth,
//             ),
//             const SizedBox(height: 20),
//               Column(
//                 //crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//       SizedBox(
//   height: 250,
//   width:isMobile?268: screenWidth,
//   child: PageView.builder(
//     reverse: true,
//     controller: _pageController,
//     itemCount:isMobile?images.length-2: images.length,
//     onPageChanged: (index) {
//       setState(() => _currentPage = index);
//     },
//     itemBuilder: (context, index) {
//       return Container(
//         width:isMobile? screenWidth:268,
//         decoration: BoxDecoration(shape:BoxShape.circle),
//         // padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//             Image.network(
//               images[index],
//               width:isMobile?1000:screenWidth,
//               height: 180,
//               // fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'الصف الثاني الثانوي',
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 20,
//                 color: Color.fromARGB(255, 6, 69, 152),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   ),
// ),
        //  , Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children:[
        //       Icon(Icons.arrow_back_ios_new_outlined,color: Color.fromARGB(255, 6, 69, 152),),
        //       ... List.generate(
              
        //       imageGroups.length,
        //       (index) => GestureDetector(

        //         onTap: () {
        //           _pageController.animateToPage(
        //             index,
        //             duration: Duration(milliseconds: 400),
        //             curve: Curves.easeOut,
        //           );
        //         },
        //         child: Container(
        //           margin: const EdgeInsets.all(6.0),
        //           width: _currentPage == index ? 100 : 100,
        //           height: _currentPage == index ? 12 : 8,
        //           decoration: BoxDecoration(
                    
        //             // shape: BoxShape.circle,
        //             borderRadius: BorderRadius.circular(8),
        //             color: _currentPage
        //             == index ? 
        //             Color.fromARGB
        //             (255, 6, 69, 152)
        //              : Colors.grey,
        //           ),
        //         ),

        //       ),
        //     ),
        //     Icon(Icons.arrow_forward_ios_outlined,color: Color.fromARGB(255, 6, 69, 152),),
        //     ]
        //   ),
          
      //     SizedBox(height: 20),
        ],
      ),
       ),  _buildFooter(context),
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
        
    ],),);
    }
    ));
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
            child: Image.network(imagePath, fit: BoxFit.contain),
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

  Widget _buildTeacherInfo(bool isMobile,screenWidth) {
    return Container(
width: !isMobile?1120:screenWidth,      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.network('assets/Frame (10).png', width: 43, height: 40),
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
                      _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/location.png',
                          '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
                      const SizedBox(height: 12),
                      _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Phone.png', '+20 106 662 0129'),
                      const SizedBox(height: 12),
                      _buildInfoRow('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/sms_1.png', 'support@ashtar.app'),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame_14.png'),
                          const SizedBox(width: 12),
                          _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame_13.png'),
                          const SizedBox(width: 12),
                          _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame_12.png'),
                          const SizedBox(width: 12),
                          _icon('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame_11.png'),
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
                          _storeButton('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame (16).png', 'Google play'),
                          const SizedBox(width: 12),
                          _storeButton('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/icons/Frame (15).png', 'App Store'),
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
                        child: Image.network(
                          'assets/Group 87935.png',
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
      Image.network(iconPath, width: 24, height: 24),
    ],
  );
}

Widget _icon(String path) {
  return Image.network(path, width: 24, height: 24);
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
        Image.network(iconPath, width: 40, height: 40),
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


