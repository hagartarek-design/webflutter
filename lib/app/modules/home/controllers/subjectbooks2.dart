import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/addedto.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';
import 'package:my_app/app/modules/home/views/mainpagecopy.dart';
import 'package:my_app/app/modules/home/views/menuebar%20paym.dart';
import 'package:my_app/app/modules/home/views/schedule_el_malazem.dart';
import 'package:my_app/app/modules/home/views/subject.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjecttype.dart';
// class subjectBooks2 extends StatefulWidget {
//   const subjectBooks2({super.key,});

//   @override
//   State<subjectBooks2> createState() => _subjectBooks2State();
// }

// class _subjectBooks2State extends State<subjectBooks2> {

class subjectBooks2 extends StatelessWidget {
 
 
//  final String courseId;
//    final List<dynamic> courseInfos;
   subjectBooks2({super.key//,required this.courseId,required this.courseInfos
   });
   var selectedSection = Rx<String?>(null);

// bool isSelected=0;
final int _currentPage=0;
  @override
  Widget build(BuildContext context) {
          // print('eee${courseInfos}');
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;
bool isSelected=false;
bool isSelected1=false;
bool isSelected2=true;
PageController pageController=PageController(
    viewportFraction:isMobile?1.5: 0.22, // ~1 / 4.5
initialPage: 1

);
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
              Image.asset('assets/Group 87935.png', width: 55),
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
                    Image.asset('icons/Vector (3).png',width: 40,height: 41,),
                    Image.asset('icons/Vector (2).png',width: 39.02,height: 40,)
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
                      Image.asset('assets/Group 87935.png', width: 55),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
      body:
      
      GetBuilder( init:HomeController() ,builder: (controller){
// controller.attachments();
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
            
            const SizedBox(height: 20,),
            _buildTeacherInfo(isMobile,screenWidth),
            const SizedBox(height: 20),
            // Wrap(
            //   spacing: 16,
            //   runSpacing: 16,
            //   alignment: WrapAlignment.center,
            //   children: [
           
       
            
            // const SizedBox(height: 20),

     
            const SizedBox(height: 20),



           SizedBox(width:screenWidth * 0.95 ,//height: 880,
           child: Column(
            spacing: 32,
            children: [
              SizedBox( width:isMobile?343: screenWidth * 0.95,height: 40,
              child:Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
              SizedBox(
                width: 173,height: 44,
                child:   TextButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Schedule_el_malazem();
                  }));
                },
                style:TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 6, 69, 152),
                  shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(8))) ) , child: Text('منافذ البيع',style:
                 TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                ),

              ),
                Text('احجز ملازمك',style: 
              TextStyle(color: Color.fromARGB(255, 6, 69, 152)
              ,fontSize: 32,fontWeight: FontWeight.w600
              ),textAlign: TextAlign.end,

        // Navigator.push(context, MaterialPageRoute(builder: (context){return _Apps()}))        
              )],)
            
             ,
               
              )
          ,
                  // spacing: 16,
                  Wrap(alignment: WrapAlignment.end, children: [     
                     Container(width:isMobile?343: 642,height:isMobile?72: 44,
             decoration: BoxDecoration(//color:  
             //selectedSection.value=='offline'?
             color: 
              Color.fromARGB(255, 235, 239, 249),
              border: 
             Border.all(width: 1,color: Color
             .fromARGB(255, 6, 69, 152)),borderRadius:
              BorderRadius.all(Radius.circular(8))),
             child:
             
             
             Wrap(spacing:isMobile? 14:0,
              alignment: WrapAlignment.end,
              children: [
          
           InkWell(child:    Container(
              width:isMobile?103.67: 213,
              height:isMobile?70: 44,
              padding: EdgeInsets.fromLTRB(15, 4,15, 4)
            ,
             decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))
            ,color:selectedSection.value!='offline'?
              Color.fromARGB(255, 235, 239, 249): Color.fromARGB(255, 6, 69, 152),
            )
             ,child: Wrap(
          alignment: WrapAlignment.center,
             children: [
                   Text(isMobile? 'الاوفلاين':'الملازم الاوفلاين ',style: TextStyle(
                  
                    color:  selectedSection.value!='offline'?
             Color.fromARGB(255, 6, 69, 152):  Color.fromARGB(255, 235, 239, 249)
                    ,fontSize: 20,fontWeight: FontWeight.w500
                    ),
                    
                    )
              ,Image.asset('assets/Group (1).png',width: 29,height: 29,)
             ],),),onTap: ()async{
              selectedSection.value = selectedSection.value == 'offline' ? null : 'offline';
              await controller.attachments(status: 'offline');
             },)
           ,  
            InkWell(child:Container(  width:isMobile?103.67: 213,
              height:isMobile?70: 44
              ,padding: EdgeInsets.fromLTRB(15, 4, 15, 4)
            , decoration: BoxDecoration(
              color: selectedSection.value=='online'?  Color.fromARGB(255, 6, 69, 152):Color.fromARGB(255, 235, 239, 249),
              borderRadius: BorderRadius.all(Radius.circular(8))
            // ,color: Color.fromARGB(255, 6, 69, 152)
            )
             ,child:
  Wrap(//spacing: 4,
             alignment: WrapAlignment.end,
             children: [
                   Text(isMobile?'الاونلاين' :'الملازم الاوملاين',style: TextStyle(
                  
                    color:selectedSection.value=='online'? Color.fromARGB(255, 235, 239, 249): Color.fromARGB(255, 6, 69, 152)
                    ,fontSize: 20,fontWeight: FontWeight.w500
                    ),
                    
                    )
              ,Image.asset('assets/Frame.png',width: 29,height: 29,)
             ],),) ,onTap: ()async{
selectedSection.value = selectedSection.value == 'online' ? null : 'online';
            await  controller.attachments(status: 'online');
             }, )  
             ,  InkWell(child:   Container(
                width:isMobile?103.67: 213,
              height:isMobile?70: 44,
              padding: EdgeInsets.fromLTRB(25, 4, 25, 4)
            , decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))
            ,color: selectedSection.value=='all'? Color.fromARGB(255, 6, 69, 152):Color.fromARGB(255, 235, 239, 249)
            )
             ,child: Wrap(//spacing: 4,
             alignment: WrapAlignment.center,
             children: [
                   Text(isMobile?'الكل': 'كل الملازم',style: TextStyle(
                    
                    color:  selectedSection.value=='all'?  Color.fromARGB(255, 235, 239, 249):Color.fromARGB(255, 6, 69, 152)
                    ,fontSize: 20,fontWeight: FontWeight.w500
                    ),
                    
                    )
              ,Image.asset('assets/Group.png',width: 29,height: 29,)
             ],),),onTap: ()async{await controller.attachments();
             selectedSection.value = selectedSection.value == 'all' ? null : 'all';
             },)
             ,
             ],) ,
            
             ),
          ],)
               ,
         Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.start,
       // space between rows
  // children: List.generate(
  //   8,
    // (index)      {  
      
      // print(controller.sumExamAss.toString());
      // return
    children:  [     
  //                ...List.generate(
  // totalSectionsLength,
  // (index) {
    // controller.fetchcourseinfoid(courseId);
    // print(totalSectionsLength);
    // print('Courseall:${controller.course_info.map((e)=>e.section?.length)}');

    // Fix: Use a different variable name for the section index if needed
    // final sectionIndex = index; // or calculate appropriately
    
    // return 
    ...List.generate(controller.attachment.length,(index){
     
return     Stack( children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset('assets/malazm.jpg', width: 268, height: 396),
      ),
      
      Positioned(
        top: 1, right: 1, left: 1, bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color.fromARGB(1, 255, 255, 255),
          ),
        ),
      ),
      
      Container(
        width: 268, height: 128,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), 
            topRight: Radius.circular(16)
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 6, 69, 152),
              Color.fromARGB(171, 118, 162, 212),
            ],
          ),
        ),
        child: SizedBox(
          width: 236, height: 49,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, 
            children: [
              Text(
                controller.attachment[index].cycle.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    textAlign: TextAlign.end,
                    ' فيديوهات-${controller.attachment[index].totalExamAssignment}\n PDF 7-\n${controller.attachment[index].totalExamAssignment} - امتحانات و واجبات',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 326, left: 24,
        child: SizedBox(
          width: 220, height: 50,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor:controller.attachment[index].isUsed==true? Color.fromARGB(255, 6, 69, 152):Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
            ),
            onPressed: ()async {
          

       controller.attachment[index].isUsed==false? Navigator.push(context, MaterialPageRoute(
        builder: (context){
          controller.fetchCart();
    controller.      addattachtocart( id: controller.attachment[index].id!);
    print(controller.attachment[index].id!);
        return Addedto();
       })):Container()   ;
        },
            child: Text(
              'اشترك دلؤتي',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color:controller.attachment[index].isUsed==true? Color.fromARGB(255, 255, 255, 255): Color.fromARGB(255, 6, 69, 152),
              ),
            ),
          ),
        ),
      
    
  

)
] 
      
  
           );
    })
],),
          
        
    ])),
     const SizedBox(height: 24,),
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
    ]));//;
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

  Widget _buildTeacherInfo(bool isMobile,screenWidth) {
    return SizedBox(
width: !isMobile?1280:343,     // padding: const EdgeInsets.all(16.0),
      child: Wrap(spacing: 1,
      runAlignment:WrapAlignment .center,
        alignment: WrapAlignment.start,
        children: [
         
        //  SizedBox(width: 18,height: 18,child:   Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 181, 181, 181),size: 18,),
        //   ),
          Text('احجز ملازمك',style: TextStyle( fontWeight: FontWeight.w400
      ,  color: Color.fromARGB(255, 6, 69, 152)),
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


