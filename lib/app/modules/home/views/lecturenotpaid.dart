import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart'; 
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/controllers/assignment2.dart';
import 'package:my_app/app/modules/home/controllers/subjectbooks2.dart';
import 'package:my_app/app/modules/home/controllers/trueAnswerExam.dart' hide MenuDialog;
import 'package:my_app/app/modules/home/views/mainpagecopy.dart' hide MenuDialog;
import 'package:my_app/app/modules/home/views/settings.dart';
import 'package:my_app/app/modules/home/views/subjectbooks.dart';
import 'package:my_app/app/modules/home/views/subjects.dart';
import 'package:my_app/app/modules/home/views/videobyid.dart';
import 'package:video_player/video_player.dart';
// import '';
import '../controllers/pdf.service copy 3.dart';
import '../controllers/pdf.service.dart';
import 'videofullscreen.dart';
class Lecturenotpaid extends StatefulWidget {
  final String courseId;
  final index;
  final lesson;
  const Lecturenotpaid({super.key, required this.courseId,required this.index,required this.lesson});

  @override
  State<Lecturenotpaid> createState() => _LectureNotPaidState();
}

class _LectureNotPaidState extends State<Lecturenotpaid> {
  // @override
  // void initState() {
  //   super.initState();
  // }
  bool selectedsection=false;
  bool selectpdf=false;
  bool selectexamsassiggnment=false;
  bool contentsection=false;
// final isMobile=
  var allCourseInfos;
  var allCourseInfos2;
  var content;
PageController _pageController=PageController(
    viewportFraction: 0.22, // ~1 / 4.5
initialPage: 1

);
// bool _hasNavigated=false;
  bool _hasNavigated = false;

  void _handlePress() async{
    if (!_hasNavigated) {
      await Navigator .push(context,MaterialPageRoute(builder: (context) =>FullscreenVideoScreen())
      );
      setState(() {
      _hasNavigated=true;
      });

     
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Notice"),
          content: Text("You already visited the video screen."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
int _currentPage=0;
bool isSelected1=true;
bool isSelected2=false;
bool isSelected3=false;
bool isSelected4=false;
List contentList=[];
int contentCount=0;
  @override
  Widget build(BuildContext context) {
    print("Course ID: ${widget.index}");
List l=[];
  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(1, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
  void scrollToIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 990;
    final isMobile2 = screenWidth < 400;
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
                    onTap: () {},
                    child: Icon(Icons.menu, color: Colors.white),
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
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(radius: 24),
                          ),
                          Image.asset('icons/Vector(3).png', width: 40, height: 41),
                          Image.asset('icons/Vector(2).png', width: 39.02, height: 40)
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
      ,builder: (controller){return SingleChildScrollView(
        child:Container(decoration: BoxDecoration(color: Color.fromARGB(255, 245, 245, 245),borderRadius: BorderRadius.only(topLeft:Radius.circular(8) 
        ,topRight:Radius.circular(8) )),

        child:  Column(
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
           
     
         
    
  SizedBox(height: 24,)
        ,
          Container( child:Column(
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
           Container(width:isMobile?343:1120,child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12,)
           , Text('اختيار القسم',textAlign: TextAlign.start,style:
             TextStyle(fontWeight: FontWeight.w600,
           fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)),),SizedBox(height: 12,)
          ,  Text('المحاضره للأسبوع الاول',textAlign: TextAlign.end,
          style: TextStyle(fontWeight: FontWeight.w400,
           fontSize: 24,color: Color.fromARGB(255, 80, 124, 181)),),SizedBox(height: 12,)
           ,Container(width: 1120,child:Row(spacing: 16, children: [
            // Image.asset('assets/')


           ],) ,)
           

,

       
            
        
        ]
      ),
    ),
 Container(
  width: 1120, child:  Wrap( spacing: 16,
  runAlignment: WrapAlignment.center,
  children: [
 

 Column(
  spacing: 24,crossAxisAlignment: CrossAxisAlignment.center
  ,
  children: [

Container(
  width:isMobile?343: 836,
  height: isMobile?314:474,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(topLeft:Radius.circular(8) ,topRight: Radius.circular(8)),
  ),
  
    child: Stack(alignment: Alignment.center,
      children: [
        controller.controllervideo!.value.isInitialized
            ? AspectRatio(
                aspectRatio: controller.controllervideo!.value.aspectRatio,
                child: VideoPlayer(controller.controllervideo! ,),
              )
            : const Center(child: CircularProgressIndicator()),

        Positioned(
          top:isMobile?122: 206,
          left:isMobile?70: 257,
          child: Container(//alignment: Alignment.center,
            width:isMobile?188: 322,
 decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft:Radius.circular(8)
  ,topRight: Radius.circular(8))),           height: 60,
            child: Wrap
            (
              alignment: WrapAlignment.spaceBetween,
              children: [
                IconButton(
                  icon:  Icon(Icons.forward_10, color: Colors.white, size:isMobile?42: 60),
                  onPressed: () => controller.seekBy(const Duration(seconds: 10)),
                ),
                IconButton(
                  icon: Icon(
                    controller.controllervideo!.value.isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    size:isMobile?42: 60,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      controller.controllervideo!.value.isPlaying
                          ? controller.controllervideo!.pause()
                          : controller.controllervideo!.play();
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.replay_10, color: Colors.white, size:isMobile?42: 60),
                  onPressed: () => controller.seekBy(const Duration(seconds: -10)),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top:isMobile?249: 398,
          child: Container(
            width:isMobile?343: 837,
            height:isMobile?65: 76,decoration: BoxDecoration( color: Colors.black54,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8) )
            ),
           
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10, color: Colors.white),
                  onPressed: () => controller.seekBy(const Duration(seconds: -10)),
                ),
                IconButton(
                  icon: Icon(
                    controller.controllervideo!.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      controller.controllervideo!.value.isPlaying
                          ? controller.controllervideo!.pause()
                          : controller.controllervideo!.play();
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.forward_10, color: Colors.white),
                  onPressed: () => controller.seekBy(const Duration(seconds: 10)),
                ),
                Expanded(
                  child: VideoProgressIndicator(
                    controller.controllervideo!,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                      playedColor: Colors.blue,
                      bufferedColor: Colors.grey,
                      backgroundColor: Colors.white38,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.volume_up, color: Colors.white),
                const SizedBox(width: 8),
                InkWell(
                  onTap: _handlePress,
                  child: const Icon(Icons.fullscreen, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Text(
                  "${formatDuration(controller.controllervideo!.value.position)} / ${formatDuration(controller.controllervideo!.value.duration)}",
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
   
   
     ],
    ),
  ),

    Container( width: 837,
               child:
                Column(
                  spacing: 24,
                  children: [
  isMobile?
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(255, 6, 69, 152)),
        width: 343,height: 106,padding: EdgeInsets.only(left: 8,right:8),
      child:Column(children: [ 
        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween, children: [
        Wrap(children: [
        Container(
          child: Column(
            spacing: 8,
            children: [
AutoTranslateText(text:'المادة:الفزياء',
  weight: FontWeight.w500,fontSize: 14,
  color: Color.fromARGB(255, 255, 255, 255),),
AutoTranslateText(text:'5 محاضرات',
  weight: FontWeight.w500,fontSize: 14,
  color: Color.fromARGB(255, 255, 255, 255),)],)),
          Image.asset('assets/Frame1597882438(8).png',width: 51,height: 49.87,)],) 
   ,   AutoTranslateText(text: '150 جنيه ',color: Color.fromARGB(255, 242, 195, 42)
        ,weight:FontWeight.w500 ,fontSize: 18
        ,),    ],),
      // SizedBox(height: 8,),
      Container(width: 327,height: 32,
      child: TextButton(
      style: TextButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: (){}, child: AutoTranslateText(
      color:  Color.fromARGB(255, 6, 69, 152),
        text: 'اشترك دلؤتي')),
      )
      ,
       SizedBox(height: 10,) ],)
      
      ):Container()
     ,
Container(child: Wrap(
  spacing: 8,
  children: [
    InkWell( child:Container( width:isMobile?80.75:200 ,height:100,decoration: BoxDecoration(  color: Color.fromARGB(255, 245, 245, 245),
 border: Border.all(width: 1,color: Color.fromARGB(255, 181, 181, 181)),
  borderRadius: BorderRadius.circular(8)
  ) ,child: 
Column(
  spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center, children: [
Image.asset('assets/Component234.png',width: 32,height: 32,)
,Text('الامتحنات والواجبات',style: TextStyle(fontWeight: 
FontWeight.w500,fontSize:isMobile?12:16,color: Color.fromARGB(255, 222, 61, 49)),)

],)
),onTap: ()async{
  // selectpdf==false;
  await controller. sectionidlessontype( 
    //  controller.course_info
    //     .map((e) => e.section?[widget.index]['id'].toString())
    //     .first ?? '',
        'واجبات و امتحنات'.toString()
       
       
        );
          contentList = controller.courses_lesson
    .expand((e) => e.section?.map((e)=>e['lesson']//?//.map((lesson) => lesson['content'] ?? []) 
      )  ?? [])
    .expand((content) => content is List ? content : [content])
    .toList();

controller.update();
contentCount = contentList.length;
print('Content items: $contentList');
 selectedsection=false;
selectpdf=false;
selectexamsassiggnment=true;selectpdf==false;
},),

InkWell(
  
  child:Container(width:isMobile?80.75:200  ,height:100,decoration: BoxDecoration(  color: Color.fromARGB(255, 245, 245, 245),
 border: Border.all(width: 1,color: Color.fromARGB(255, 181, 181, 181)),
  borderRadius: BorderRadius.circular(8)
  ) ,child: 
Column(
  spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center, children: [
Image.asset('assets/Component232.png',width: 32,height: 32,)
,Text('pdf',style: TextStyle(fontWeight: FontWeight.w500,fontSize:isMobile?12:16,
color: Color.fromARGB(255, 242, 195, 42)

),)

],)
),onTap: ()async{

 selectedsection=true;contentsection=false;
selectpdf=false;
selectexamsassiggnment=true;
  
  await controller. sectionidlessontype( 
    //  controller.course_info
    //     .map((e) => e.section?[widget.index]['id'].toString())
    //     .first ?? '',
        'pdf'.toString());controller.update();
  contentList = controller.courses_lesson
    .expand((e) => e.section?.map((e)=>e['lesson']//?//.map((lesson) => lesson['content'] ?? []) 
      )  ?? [])
    .expand((content) => content is List ? content : [content]) 
    .toList();

contentCount = contentList.length;

print('Content items: $contentList');
},
 ),

InkWell(
  onTap: ()async{

selectedsection=true;
selectpdf=false;
selectexamsassiggnment=false;
       selectpdf==false;
  await controller. sectionidlessontype( 

        'المحاضرات'.toString()
        
        );
 
        contentList = controller.courses_lesson
    .expand((e) => e.section?.map((e)=>e['lesson']//?//.map((lesson) => lesson['content'] ?? []) 
      )  ?? [])
    .expand((content) => content is List ? content : [content]) // Flatten nested lists
    .toList();

contentCount = contentList.length;

print('Content items: $contentList');
  },
  child:Container(
  width:isMobile?80.75:200 ,height:100,decoration: BoxDecoration(
  color: Color.fromARGB(255, 245, 245, 245),
 border: Border.all(width: 1,color: Color.fromARGB(255, 181, 181, 181)),
  borderRadius: BorderRadius.circular(8)
  ) ,child: 
Column(
  spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center, children: [
Image.asset('assets/Component232.png',width: 32,height: 32,)
,Text('المحاضرات',style: TextStyle(fontWeight: FontWeight.w500,fontSize:isMobile?12:16,color: Color.fromARGB(255, 6, 182, 141)),)

],)
), )
,
InkWell(child:Container( width:isMobile?80.75:200  ,height:100
,decoration: BoxDecoration(
  color: Color.fromARGB(255, 6, 69, 152),
  borderRadius: BorderRadius.circular(8)
  ) ,child: 
Column(
  spacing:8,
  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment:
   MainAxisAlignment.center, children: [
Image.asset('assets/Component233.png',width: 32,height: 32,)
,Text('محتوي الدرس',style: TextStyle(fontWeight:
 FontWeight.w500,fontSize:isMobile?12:16,
 color: Color.fromARGB(255, 245, 245, 245)),)

],)
) ,onTap: () async{

  await controller.fetchsectionidlesson(
    controller.course_info
        .map((e) => e.section?[widget.index]['id'].toString())
        .first ?? '');

   allCourseInfos = controller.course
      .map((e) => e.section?.map((e) => e))
      .where((c) => c?.first['id'].toString() == 
          controller.course_info
              .map((e) => e.section?[widget.index]['id'].toString())
              .first)
      .expand((c) => c?.map((e) => e) ?? []);

   allCourseInfos2 = controller.course
      .map((e) => e.section?.map((e) => e))
      .where((c) => c?.first['id'].toString() == 
          controller.course_info
              .map((e) => e.section?[widget.index]['id'].toString())
              .first)
      .expand((c) => c?.map((e) => e['lesson']) ?? []);

  
  l = allCourseInfos2
      .expand((lessons) => lessons is List ? lessons : [lessons]) .toList();
      // .map((lesson) => lesson['name'].toString()) 
      // .toList();

  print('Lesson names: $l');
selectedsection=false;
contentsection=true;
selectexamsassiggnment==false;
selectpdf==false;
}),

],),),SizedBox(height:8),
selectedsection==false&&selectexamsassiggnment==false&&selectpdf==false&&contentsection==true?
Container( width:isMobile? 343:837 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.start,

  children: [
    
Text(
  textAlign: TextAlign.start,textDirection: TextDirection.rtl,
  'هتتعلم ايه في الدرس ده؟',style: TextStyle(
  
  color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
,Container( width: isMobile?347: 837,height: 382,child:Column(
  spacing: 14,
  children: [ 
    
    ...
  List.generate(l.length,(indexlesson){  
return Container ( width:isMobile?343: 837,height: 52,
padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromRGBO(235, 239, 249, 1)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
    Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),
Container(width: 787,height: 24, child:Wrap(spacing: 12,alignment: WrapAlignment.start, 
children: [

  Text('${
 l[indexlesson]['name']
  
  }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),

  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],));
      }),
Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),//border: Border.all(
  // width: 1,color:Color.fromARGB(255, 154, 175, 228)
  // ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),

 ],),)

,Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
//border: Border.all(
//   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
  Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),
Container(width: 787,height: 24, child:Wrap(spacing: 12,alignment: WrapAlignment.end, 
children: [

  Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)
,
 Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
//border: Border.all(
//   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [ 


  Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),
Container( width: 787,height: 24, 
child:Wrap(spacing: 12,alignment: WrapAlignment.start, 
children: [

  Text('قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)


,Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
//border: Border.all(
//   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
  Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),
Container( width: 787,height: 24, child:Wrap(spacing: 12,alignment: WrapAlignment.start, 
children: [

  Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)

,Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
//border: Border.all(
//   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
  Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),
Container(width: 787,height: 24, child:Wrap(spacing: 12,alignment: WrapAlignment.start, 
children: [

  Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)


  ],) )
,SizedBox(height: 8,)
],),)
:selectedsection==false&&selectexamsassiggnment==true&&selectpdf==false&&contentsection==false?
Container( width: isMobile?347: 837, child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.start,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
,Container( width: isMobile?347: 837,child:Column(
  spacing: 14,
  children: [ 
    
    ...
  List.generate(contentList.length,(indexlesson){  
return
InkWell(
  
  onTap: ()async{

  // controller.cou
      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => assignment2(
       
       
        ),
        
      ),
    
  );
  
final currentIndex = indexlesson;
final currentContentList = List.from(contentList);

if (currentIndex < currentContentList.length) {
  final lessonId = currentContentList[currentIndex]['id'];
  var data = await controller.fetchUserQuestion(
    id: lessonId,
    page: 1,
  );
  print('final ${controller.userquestions}');
}    
  },
  child: 

 Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromRGBO(235, 239, 249, 1)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
    Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),
Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.start, 
children: [

  Text('${
 contentList[indexlesson]['name']
  
  }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),

  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],)));
      }),
Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),//border: Border.all(
  // width: 1,color:Color.fromARGB(255, 154, 175, 228)
  // ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
  Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Wrap(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('فيديو حل على قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)

// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)
// ,
//  Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ 


//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, 
// child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)

// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


  ],) )

],),)
:selectedsection==false&&selectexamsassiggnment==false&&selectpdf==true&&contentsection==false?
Container( width: isMobile?347: 837,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.start,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
,Container( width: isMobile?347: 837,height: 382,child:Column(
  spacing: 14,
  children: [ 
    
    ...
  List.generate(l.length,(indexlesson){  
return 
InkWell(
  onTap: (){
    //  Navigator.push(context, MaterialPageRoute(builder: (context){return PdfViewerScreen();}));
  },
  child: 
Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromRGBO(235, 239, 249, 1)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),
Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.start, 
children: [

  Text('${
 l[indexlesson]['name']
  
  }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),

  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],)));
      }),
Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),//border: Border.all(
  // width: 1,color:Color.fromARGB(255, 154, 175, 228)
  // ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('فيديو حل على قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)

// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)
// ,
//  Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ 


//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, 
// child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)

// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


  ],) )

],),)
      :selectpdf==false &&selectexamsassiggnment==true && selectpdf==false &&contentsection==false?
Container( width:isMobile?347: 837,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.start
  
  ,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
    ,// ,  selected==false? 

Container( width: isMobile?347: 837,height: 382,child:Column(
  spacing: 14,crossAxisAlignment: CrossAxisAlignment.center,
  children: [ 
  ...List.generate(contentList.length!,(indexcontent){
    if(contentList[indexcontent]['content'].map((e)=>e['name'])=='المحاضرات'  )
// InkWell(onTap: (){},child: ,)
return InkWell( onTap: (){},child:Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
    Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),
Container(width: 787,height: 24, child:Wrap(spacing: 12,alignment: WrapAlignment.start, 
children: [

  Text('${
contentList[indexcontent]['name'].toString()
 
 
 }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],)) ,) ;
return InkWell(onTap: (){
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LessonPdfViewer(lessonId: 
        contentList[indexcontent]['id'],totalPages: contentList[indexcontent]['pdfImages'].length        ,//  pageNumber:1 ,pdfId: '65',
      //  courseId:widget.courseId ,
       index: widget.index,lesson: widget.lesson,
       
       
          // pdfId:  '58', pageNumber: 1, // Replace with actual PDF ID
          // initialPage: 1,
        ),
        
      ),
    
  );},child: 
  Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)

,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap( alignment: WrapAlignment.spaceBetween, children: [
    Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),
Container(width: 787,height: 24, child:Wrap(spacing: 12,alignment: WrapAlignment.center, 
children: [

  Text('${
contentList[indexcontent]['name'].toString()
 
 
 }',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],))
  ,) ;
      }),
Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),//border: Border.all(
  // width: 1,color:Color.fromARGB(255, 154, 175, 228)
  // ) 
),
 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('فيديو حل على قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
 ],),)

// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('امتحان 1',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)
// ,
//  Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ 


//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, 
// child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('قانون اوم',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container( width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('Pdf ملخص قانون اوم ',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)

// ,Container ( width: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
// decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

// ,borderRadius:BorderRadius.circular(12),
// //border: Border.all(
// //   width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
// ),
//  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//   Image.asset('assets/Group (10).png',width: 12.74,height: 17.1,),
// Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.end, 
// children: [

//   Text('واجب 5',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
//   fontWeight: FontWeight.w500,fontSize: 16
//   ),),
  
//   Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
//  ],),)


  ],) )
  

],),)
       :
Container( width: isMobile?347: 837,height: 423 , child: Column(spacing: 8,
  crossAxisAlignment: CrossAxisAlignment.start,

  children: [
    
Text('هتتعلم ايه في الدرس ده؟',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
fontWeight: FontWeight.w500,fontSize: 20),)
    ,// ,  selected==false? 
Container( width:isMobile?347: 837,child:Column(
  spacing: 14,
  children: [ 
    
  ...List.generate(contentCount!,(indexcontent){  
return 
InkWell(onTap: ()async{
 
await controller.initializePlayer2('${contentList?[indexcontent]?['id'].toString()}');
 print('${contentList?[indexcontent]?['id'].toString()}');
  Navigator.push(context,MaterialPageRoute(builder: (context){
    return Videobyid(index: widget.index,lesson: widget.lesson,courseId:widget.courseId,);
    }));
  // print('${contentList[indexcontent]['id']}');
  // controller.initializePlayer2(contentList[indexcontent]['id']);
  
  }
,child:Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 235, 239, 249)
,borderRadius:BorderRadius.circular(12),border: Border.all(
  width: 1,color:Color.fromARGB(255, 154, 175, 228) ) 
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
    Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),
Container(width: 787,height: 24, child:Row(spacing: 12,mainAxisAlignment: MainAxisAlignment.center, 
children: [

  Text('${contentList[indexcontent]['name'].toString()}',style: TextStyle(color: Color.fromARGB(255, 6, 69, 152),
  fontWeight: FontWeight.w500,fontSize: 16
  ),),
  Image.asset('assets/video-play.png',width: 24,height: 24,)],) ,)
      ],))
    ,);
   }),
Container ( width: isMobile?347: 837,height: 52,padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)

,borderRadius:BorderRadius.circular(12),
),
 child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
  Image.asset('assets/Group(10).png',width: 12.74,height: 17.1,),

 ],),)


  ],) )
 

  

],),)
       
               ],),
               )
             ])

,  !isMobile? Container(
  width: 267,
  padding: const EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.blue.shade100),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        blurRadius: 6,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Stack(
        children: [
          // Yellow character image (placeholder)
          Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8))  ,
            child:
             Image.asset(
              'assets/Frame1597882438(8).png', // Replace with your image path
              height: 200,
              width: 267,
              // fit: BoxFit.cover,
            ),
          ),
          // Gradient label
          Positioned(
            top: 2,
            left: 0,
            right: 0,
            child: Container(width: 267,height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(6, 69, 152, 0.685),
                    Color.fromRGBO(118, 162, 212, 0.658),
                  ],
                ),
              ),
              // child: const Center(
                child: Text(textAlign: TextAlign.start,
                  'الفيرياء',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              // ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 8),

      // Subject title and lectures
    Container( width: 251,height: 98,child:Wrap( children: [Image.asset('assets/Group(12).png',height: 30,width: 30,),
      Container(width: 205,height: 98,child: Column(
        mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.end,
        children: [
         
          
          const Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'المادة:الفيزياء' ,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
              "محاضرات5",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
              " جنيه150",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ) ,)
     ],) ,)  
,


      // Subscribe Button
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){return subjectBooks2();}));

          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade800,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text(
            'اشترك دلوقتي',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  ),

)
 :Container() ],)
  
  
 )
              
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
            const SizedBox(height: 10),
        
   ]))])));}));
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
// Future<void> sectionidlessontype(String title) async {
//   try {
//     final queryParams = <String, String>{};
//     if (title.isNotEmpty) {
//       queryParams['title'] = title;
//     }

//     final Uri uri = Uri.http(
//       'localhost:3000',
//       '/lesson/typelesson',
//       queryParams,
//     );

//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');

//     final response = await http.get(
//       uri,
//       headers: {
//         'Authorization': 'Bearer $token',
//         'Content-Type': 'application/json',
//       },
//     );

//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       print('Raw API Response: ${response.body}'); // Debugging

//       final dynamic courseData = jsonResponse['course'];

//       if (courseData is List) {
//         courses_lesson = courseData.map((item) => Course.fromJson(item)).toList();
//         print('Successfully loaded ${courses_lesson.length} courses');
//       } else {
//         print('Error: course data is not a List');
//       }

//       update();
//     } else {
//       print('Failed to fetch: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error in sectionidlessontype: $e');
//   }
// } 
    

