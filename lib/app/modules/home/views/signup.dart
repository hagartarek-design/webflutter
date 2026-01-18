import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/login.dart';

class Signup extends StatelessWidget {
   Signup({super.key});
   final _maxLengthNotifier = ValueNotifier<int?>(null); 
  @override 
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: Container(

            color: const Color.fromARGB(255, 245, 245, 245),
            child:
            
            SingleChildScrollView(child: 
             Stack(
              children: [
                Container( height: 352,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(115, 21, 112, 239),
                        Color.fromARGB(255, 245, 245, 245),
                      ],
                    
                    ),
                  ),
                ),
              Padding(padding:EdgeInsets.fromLTRB(80, 85,0,0),child:  
               Row(
                spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.center
                  ,
                  children: [

                  SizedBox(width: 1120,//,height: 862,//,color: Colors.yellow,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                  Image.network('https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/ashtar.png',width: 106,height: 106,)  
                  ,
                  SizedBox(width: 1120,//height: 740,
                   child: Column(
                    spacing: 32,
                    
                    children: [
                    SizedBox(
                      width: 1120,child: Column(spacing: 16,
                   crossAxisAlignment: CrossAxisAlignment.end,  children: [
                         Text('محتاجين البيانات دي لتسجيل حساب جديد',style: TextStyle(fontWeight: FontWeight.w600
                         ,fontSize: 32,color: Color.fromARGB(255, 6, 69, 152)
                         ),),
SizedBox( width: 1120,//height: 580,
 child:Column(spacing: 8, children: [
Row(spacing: 16, children: [
SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
  Text('الاسم المستخدم',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(
      
      decoration: InputDecoration(
       fillColor: Colors.white,
filled: true,        
      hintText: 'ادخل الاسم المستخدم',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
     border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    )),)
],))

,SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
  Text('الاسم بالكامل رباعي',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(decoration: InputDecoration(
filled: true,
         fillColor: Colors.white,
      hintText: 'ادخل الاسم رباعي',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228)
      ,fontSize: 16,fontWeight:FontWeight. w400),
       border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],))
],)
,Row(spacing: 16, children: [
SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
  Text('المدرسه',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(decoration: InputDecoration(
filled: true,
         fillColor: Colors.white,
      hintText: 'ادخل المدرسه',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),fontSize: 16,fontWeight:FontWeight. w400),
      border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    )),)
],))
,SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
  Text('البريد الاليكتروني',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(decoration: InputDecoration(filled: true,
         fillColor: Colors.white,
      hintText: 'ادخل البريد الاليكتروني',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228)
      ,fontSize: 16,fontWeight:FontWeight. w400),
     border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),)),
],))
],)
,Row(spacing: 16, children: [
SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
  Text('الشعبه العلميه',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(decoration: InputDecoration(
      filled: true,
         fillColor: Colors.white,
      hintText: 'ادخل الشعبه العلميه',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
    border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],))
,SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
  Text('اختار السنه الدراسيه ',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(decoration: InputDecoration(
      filled: true,
         fillColor: Colors.white,
      hintText: 'ادخل  اختار السنه الدراسيه',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
     border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],))
],
)

,Row( spacing: 16, children: [
SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
    Text('ادخل رقم تليفون الاب',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),),
Directionality(
  textDirection: TextDirection.rtl,
  child: SizedBox(
    width: 552,
    child: Row(
      children: [
        Container(
          width: 80,
          height: 44,
          decoration: BoxDecoration(
            border: Border.all(
            color: Color.fromARGB(255, 154, 175, 228), 
            width: 1),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          // padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: IntlPhoneField(
          dropdownIcon:
          Icon(
             Icons.keyboard_arrow_down,size: 16,),
  disableLengthCheck: true,

  // dropdownIcon: Icon(Icons.keyboard_arrow_down),
  dropdownIconPosition: IconPosition.leading, // يحرك الأيقونة مع العلم
  // disableLengthCheck: true,
  decoration: const InputDecoration(
    counter: SizedBox.shrink(),
    border: InputBorder.none,
    counterText: "",
    contentPadding: EdgeInsets.zero,
    isDense: true,

  ),
   dropdownTextStyle:
    TextStyle(
    fontSize: 0.0001, 
    height: 0.0001,
    color: Colors.transparent,
  ),
  // dropdownIconPosition: IconPosition. leading,
  initialCountryCode: 'EG',
  languageCode: "ar",
  obscureText: false,
  showDropdownIcon: true,
  // flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 10),
  // dropdownTextStyle: const TextStyle(color: Colors.black),
  style:
   const TextStyle(
    fontSize: 0.0001,
    color: Colors.transparent, // 👈 Hides the dial code text visually
    height: 0.0001, // Prevent layout issues
  ),
  onChanged: (phone) {
    // phone.completeNumber still contains the full number
  },
  onCountryChanged: (country) {
    _maxLengthNotifier.value = country.maxLength;
  },
),
  ),
        const SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: 44,
            child: ValueListenableBuilder<int?>(
              valueListenable: _maxLengthNotifier,
              builder: (context, maxLength, _) {
                return TextField(
                  decoration: InputDecoration(
                    hintText: 'ادخل رقم تليفون الاب ',
                    hintStyle: const TextStyle(color:  Color.fromARGB(255, 154, 175, 228)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    counterText: "",
                  ),
                  style: const TextStyle(fontSize: 16),
                  keyboardType: TextInputType.phone,
                  maxLength: maxLength,
                );
              },
            ),
          ),
        ),
      ],
    ),
  ))
],

) )
,SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
    Text('رقم تليفون الام',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),),
Directionality(
  textDirection: TextDirection.rtl,
  child: SizedBox(
    width: 552,
    child: Row(
      children: [
        Container(
          width: 80,
          height: 44,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 154, 175, 228), width: 1),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          // padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: IntlPhoneField(
          dropdownIcon:
          Icon(
             Icons.keyboard_arrow_down,size: 16,),
  disableLengthCheck: true,

  // dropdownIcon: Icon(Icons.keyboard_arrow_down),
  dropdownIconPosition: IconPosition.leading, // يحرك الأيقونة مع العلم
  // disableLengthCheck: true,
  decoration: const InputDecoration(
    counter: SizedBox.shrink(),
    border: InputBorder.none,
    counterText: "",
    contentPadding: EdgeInsets.zero,
    isDense: true,

  ),
   dropdownTextStyle:
    TextStyle(
    fontSize: 0.0001, 
    height: 0.0001,
    color: Colors.transparent,
  ),
  // dropdownIconPosition: IconPosition. leading,
  initialCountryCode: 'EG',
  languageCode: "ar",
  obscureText: false,
  showDropdownIcon: true,
  // flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 10),
  // dropdownTextStyle: const TextStyle(color: Colors.black),
  style:
   const TextStyle(
    fontSize: 0.0001,
    color: Colors.transparent, // 👈 Hides the dial code text visually
    height: 0.0001, // Prevent layout issues
  ),
  onChanged: (phone) {
    // phone.completeNumber still contains the full number
  },
  onCountryChanged: (country) {
    _maxLengthNotifier.value = country.maxLength;
  },
),
  ),
        const SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: 44,
            child: ValueListenableBuilder<int?>(
              valueListenable: _maxLengthNotifier,
              builder: (context, maxLength, _) {
                return TextField(
                  decoration: InputDecoration(
                    hintText: 'ادخل رقم تليفون الام',
                    hintStyle: const TextStyle(color:  Color.fromARGB(255, 154, 175, 228)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    counterText: "",
                  ),
                  style: const TextStyle(fontSize: 16),
                  keyboardType: TextInputType.phone,
                  maxLength: maxLength,
                );
              },
            ),
          ),
        ),
      ],
    ),
  ))
],

) )
                    
                  
                  
                  ],) ,
           
         Row(spacing: 16, children: [
SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
  Text('المنطقه السكانيه ',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(decoration: InputDecoration(
    filled: true,
              fillColor: Colors.white,

      hintText: 'ادخل المنطقه السكانيه',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
  border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],))
,SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
  Text('المحافظه ',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(decoration: InputDecoration(
     filled: true,
         fillColor: Colors.white, hintText: 'ادخل المحافظه',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
      border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],))
],
)
  
         ,Row(spacing: 16, children: [
SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
  Text('رقم العماره',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(decoration: InputDecoration(
      filled: true,
         fillColor: Colors.white,
      hintText: 'ادخل رقم العماره',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
      border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],))
,SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
  Text('العنوان',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(decoration: InputDecoration(filled: true,
         fillColor: Colors.white,
      hintText: 'ادخل العنوان',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
     border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],))
],
)
,Row(spacing: 16, children: [
SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
  Text('علامه مميزه',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(decoration: InputDecoration(
  filled: true,
         fillColor: Colors.white,    hintText: 'ادخل علامه مميزه',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
     border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],))
,SizedBox( width: 552,child:  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  spacing: 16, children: [
  Text('رقم الشقه',style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 6, 69, 152)),)
    ,TextField(decoration: InputDecoration(
filled: true,
         fillColor: Colors.white,      hintText: 'ادخل رقم الشقه',hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(color:Color.fromARGB(255, 154, 175, 228),
      fontSize: 16,fontWeight:FontWeight. w400),
    border: OutlineInputBorder(
                      borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide( width: 1,color:  Color.fromARGB(255, 154, 175, 228)),
                      borderRadius: BorderRadius.circular(8),
                    ),),)
],))
],
)

,SizedBox(height: 72, width: 1120,child:Column(children: [
SizedBox( width: 1120,height: 44, child:
TextButton(onPressed: (){},style: TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 6, 69, 152),
shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // <-- Radius
    ),
), child: Text('اعمل حساب جديد',
style:TextStyle(color:Color.fromARGB(255, 255, 255, 255) 
,fontSize: 18,fontWeight: FontWeight.w600

),
)
,
)
 )
         , SizedBox(width: 1120,height: 20,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
InkWell(
  onTap: (){

Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
  },
  child:           Text('تسجيل دخول',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Color.fromARGB(255, 80, 124, 181),),),
 ), Text('عملت حساب قبل كده ؟!',style: TextStyle(fontSize:16 ,fontWeight:FontWeight.w400 ,color:Color.fromARGB(255, 12, 12, 12)  ),)


        ],)
         ) ]))
          
          ])),SizedBox(height: 16,)
                ],))
                ]))]))]))]))));});
    
  }
}