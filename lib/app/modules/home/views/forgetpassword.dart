import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:my_app/app/modules/home/views/forgetpasswordotp.dart';
import 'package:my_app/app/modules/home/views/signup.dart';
import '../controllers/home_controller.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
class Forgetpassword extends StatelessWidget {
  Forgetpassword({super.key});
final _maxLengthNotifier = ValueNotifier<int?>(null); 
  final TextEditingController phoneNumberController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
alignment: Alignment.center,           
color: const Color.fromARGB(255, 245, 245, 245),
            child: Stack(
              children: [
                Container(
                  height: 352,
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

                // Align(
                  // alignment: Alignment.center,
                  // child:
                  //  Container(
                  //   width: 704,
//  child :Stack(children: [  Positioned(top: 209,left: 48, child: 
//  child:
Container(child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
   Image.asset('assets/forgotpassword1.png',width: 497,height: 388,)   ,                 // color: const Color.fromARGB(48, 244, 67, 54),
                  // )]),
                // ),
            
                // العنصر الرئيسي Positioned
                // Positioned(
                //   top: 2,
                //   left: 666,
                //   child:
                   Container(
                    width: 613,
                    height: 832,
                    padding: const EdgeInsets.fromLTRB(80, 85, 80, 52),
                    // color: const Color.fromARGB(61, 212, 182, 12),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                       SizedBox(width: 453,height: 426,
                       child: Column(
                        spacing: 16,
                        children: [
                        SizedBox(
                          width: 457,height: 106,
                          child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [ Image.asset('assets/logo1.png',width: 106,height: 106,)],) 
                          ,)
                     ,
                     SizedBox(
                      width: 453,
                      child:Column(
                        spacing: 32,
                        children: [
                      SizedBox( width: 457,child:Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        spacing: 16, children: [
                      Row( mainAxisAlignment: MainAxisAlignment.end, 
                      children: [ Text('هل نسيت كلمة السر؟',style: TextStyle(
                        color:Color.fromRGBO(6, 69, 152, 1),fontSize: 32
                        ,fontWeight: FontWeight.w600 ),)
                       
                        ])
                        ,Text('اكتب رقم الهاتف بتاعك و هنبعتلك OPT',textAlign: TextAlign.end
                        ,style: TextStyle(color:
                         Color.fromARGB(255, 80, 124, 181)
                        ,fontWeight: FontWeight.w400
                          ,fontSize: 18,
                        ),) ,
            // Directionality(textDirection: TextDirection.rtl, child: 
// Directionality(
//       textDirection: TextDirection.rtl,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: IntlPhoneField(
//           decoration: InputDecoration(
//             hintText: 'ادخل رقم الهاتف',
//             hintStyle: TextStyle(color: Colors.grey),
//             filled: true,
//             fillColor: Colors.white,
//             contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.purple, width: 1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.purple, width: 1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//           dropdownIconPosition: IconPosition.trailing,
//           initialCountryCode: 'EG',
//           languageCode: "ar",
//           showDropdownIcon: true,
//           flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 10),
//           dropdownTextStyle: TextStyle(color: Colors.black),
//           style: TextStyle(fontSize: 16),
//           onChanged: (phone) {
//             print(phone.completeNumber);
//           },
//         ),
//       ),
//            )



SizedBox( width: 457, child:Column(
  spacing: 8,
  children: [ 
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
Text('رقم التليفون',
style: TextStyle(fontWeight: FontWeight.w500,
fontSize: 16,color: Color.fromARGB(255, 80, 124, 181)),),
  ]),Directionality(
  textDirection: TextDirection.rtl,
  child:SizedBox(width: 457, child:  Row(

mainAxisAlignment: MainAxisAlignment.start,    children: [
      Container(
               width: 76,height: 44,
        decoration: BoxDecoration(
          border: Border.all(
            color:  Color.fromARGB(255, 154, 175, 228), width: 1),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: IntlPhoneField(
          dropdownIcon:
          Icon(
             Icons.keyboard_arrow_down,size: 16,),
  disableLengthCheck: true,

  // dropdownIcon: Icon(Icons.keyboard_arrow_down),
  dropdownIconPosition: IconPosition.leading,

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

    color: Colors.transparent,
    height: 0.0001, 
  ),
  onChanged: (phone) {
  },
  onCountryChanged: (country) {
    _maxLengthNotifier.value = country.maxLength;
  },
),
 ),
      const SizedBox(width: 8),
      Expanded(
        child: ValueListenableBuilder<int?>(
          valueListenable: _maxLengthNotifier,
          builder: (context, maxLength, _) {
            return SizedBox(
              width: 373,height: 44,
              child:  TextField(

              decoration: InputDecoration(
            
                hintText: 'ادخل رقم الهاتف',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                counterText: "", 
              ),
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.phone,
              maxLength: maxLength,
             ) );
          },
        ),
      ),
    ],
  ),
) 
  )

])
                        // Container(
                        //   height: 50,
                        //   color: Colors.grey[300],
                        )   ,                     //   child: const Center(child: Text("Item 1")),
                        // ),
                        // const SizedBox(height: 24),
                        // Container(
                        //   height: 50,
                        //   color: Colors.grey[300],
                        //   child: const Center(child: Text("Item 2")),
                        // ),
                        // const SizedBox(height: 24),
                        // Container(
                        //   height: 50,
                        //   color: Colors.grey[300],
                        //   child: const Center(child: Text("Item 3")),
                        // ),
                      
                    
                  SizedBox(width: 457,
                  child: Column(
                    spacing: 16,
                    children: [
                SizedBox( width: 457,height: 44, child:     TextButton(
                     style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                 backgroundColor:WidgetStateProperty.all( Color.fromARGB(255, 6, 69, 152)
      ),  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          
          
                                    ))),
      
                      onPressed: (){}, child: Text('استمرار',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255) )))
                  )
                  
                  ,Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 0, children: [
                    
                  // ],) ,)

              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgetpasswordotp()));
                },
                child:    Text('ماعندكش حساب ؟  ',style:TextStyle(color:Color.fromARGB(255, 6, 69, 152) ,fontSize: 16,fontWeight: FontWeight.w400) ,)
                )  ,Text('دوس هنا و الحق اشترك ببلاش' ,style:TextStyle(color:Color.fromARGB(255, 6, 69, 152) ,fontSize: 16,fontWeight: FontWeight.w400))
                     ])) ],),
              
                  ) 
              
                        ])  ) ],
            ),
          ),
                      ]))]))//)
                      ]))],)));
      },
    );
  }
final ValueNotifier<Country>selectedCountry=ValueNotifier(countries.firstWhere((c)=>c.code=='EG'));

  void _showCountryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => ListView(
        children: countries.map((country) {
          return ListTile(
            leading: Text(country.flag),
            title: Text(country.name),
            onTap: () {
              // setState(() {
                selectedCountry.value = country;
              // });
              Navigator.pop(context);
            },
          );
        }).toList(),
      ),
    );
  }
}