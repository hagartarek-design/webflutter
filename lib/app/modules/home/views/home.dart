import 'dart:convert';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:my_app/Applinks.dart';
import 'package:http/http.dart'as http;
import 'package:my_app/app/modules/home/views/homeafterlogin.dart';
import 'package:my_app/app/modules/home/views/mainpage.dart';
import 'package:my_app/app/modules/home/views/settings.dart';
import 'package:my_app/app/modules/home/views/signup%20copy.dart';
import 'package:my_app/app/modules/home/views/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/home_controller.dart';

class Mainpage extends StatelessWidget {
   Mainpage({super.key});
final _maxLengthNotifier = ValueNotifier<int?>(null); 
  final TextEditingController phoneNumberController = TextEditingController();
  String? _hint;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
  void handleLogin() async {
    HomeController controller=HomeController();
    bool success = await controller.login(
      // emailController.text.toString(),
      // passwordController.text.toString(),
   context );

    if (success) {
      
      // Fluttertoast.showToast(msg: "Login Successful");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Mainpage()),
      );
    } else  {
      ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text("wrong password or email"),
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      label: "Undo",
      onPressed: () {
    
      },
    ),
  ),
);
      // Fluttertoast.showToast(msg: "Invalid Credentials");
    }
  } AuthService auth_service=AuthService();
void signInWithFacebook() async {
  final LoginResult result = await FacebookAuth.instance.login();

  if (result.status == LoginStatus.success) {
    final AccessToken accessToken = result.accessToken!;
    final OAuthCredential facebookAuthCredential =
FacebookAuthProvider.credential(accessToken.tokenString);
;
print(accessToken.tokenString);
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    print("User: ${userCredential.user}");
  } else {
    print("Facebook login failed: ${result.message}");
  }
}
// Future <void >_signInWithFacebook()async {
//   import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


 User? user;

  Future<void> loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken!;
        final credential = FacebookAuthProvider.credential(accessToken.tokenString);


        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // setState(() {
          user = userCredential.user;
        // });

        print("Logged in as: ${userCredential.user!.displayName}");
      } else {
        print("Facebook login failed: ${result.message}");
      }
    } catch (e) {
      print("Login error: $e");
    }
  }


  Future<void> _signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final accessToken = result.accessToken!;
      final facebookAuthCredential =
         FacebookAuthProvider.credential(accessToken.tokenString);


      final userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      print('Logged in as: ${userCredential.user!.displayName}');
    } else {
      print('Facebook login failed: ${result.message}');
    }
  }

 void signin() async {
HomeController controller =HomeController();
    bool success = await controller. signInWithGoogle(
 context     // emailController.text.toString(),
      // passwordController.text.toString(),
    );

    if (success) {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homeafterlogin
        ()),
      );
    } else  {
      ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content:   AutoTranslateText(text:"wrong password or email"),
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      label: "Undo",
      onPressed: () {
    
      },
    ),
  ),
);}
      // Fl}uttertoast.showToast(msg: "Invalid Credentials");
    }

    


    final FirebaseAuth auth = FirebaseAuth.instance;
String?photoUrl='';
//      Future<bool> signInWithGoogle(context) async {
//   try {
    
//     GoogleAuthProvider googleProvider = GoogleAuthProvider();

//  
//   }
// }
   
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body:SingleChildScrollView( child: Wrap(children: [Container(
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
                 !isMobile?  Container(
                    width: 704,
                    height: 832,
 child :Stack(children: [  Positioned(top: 276,left: 32, child:  Image.asset('assets/signup221.png')                    // color: const Color.fromARGB(48, 244, 67, 54),
                 ,width: 641, )]),
                // ),
              ):Container(),
              !isMobile?  Positioned(
                 left:0, top: 2,
                  right: 662,
                  child: Container(
                    width: 617,
                    height: 832,
                    padding: const EdgeInsets.fromLTRB(80, 85, 80, 52),
                    // color: const Color.fromARGB(61, 212, 182, 12),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                       Container(width:!isMobile? 457:343,//height: 438,
                       child: Column(
                        spacing: 24,
                        children: [
                        Container(
                          child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [ Image.asset('assets/logo 1.png',width: 106,height: 106,)],) 
                          ,width: 457,height: 106,)
                     ,
                     Container(
                      width: 457,
                      child:Column(
                        spacing: 32,
                        children: [
                      Container( width: 457,child:Column(spacing: 16, children: [
                      Row( mainAxisAlignment: MainAxisAlignment.start, 
                      children: [
                        AutoTranslateText(text:'تسجيل انشاء حساب' ,
                        color:Color.fromARGB(255, 6, 69, 152),fontSize: 32,weight:FontWeight.w600)
                      ])
                        ,
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




Container( width: 457, child:Column(
  spacing: 8,
  children: [ 
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
 AutoTranslateText(text:'البريد الالكتروني',weight: FontWeight.w500,fontSize: 16,color: Color.fromARGB(255, 80, 124, 181))
//     color:Color.fromARGB(255, 6, 69, 152))(,
// style: TextStyle(fontWeight: FontWeight.w500,
// fontSize: 16,color: Color.fromARGB(255, 80, 124, 181)),),
  ]),Directionality(
  textDirection: TextDirection.rtl,
  child:
  
  Container(width: 457, child:  Row(

mainAxisAlignment: MainAxisAlignment.start,    children: [
  
  
      const SizedBox(width: 8),
      Expanded(
        child: ValueListenableBuilder<int?>(
          valueListenable: _maxLengthNotifier,
          builder: (context, maxLength, _) {
            return SizedBox(
              width: 373,height: 44,
              child:
              
              
              TextField(
                
                controller: controller.emailController,          
              decoration: InputDecoration(    
                label: AutoTranslateText(
      text: 'ادخل البريد الالكتروني',
      color: Colors.grey,
      fontSize: 16,
    ),     
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
Container( width: 457, child:Column(
  spacing: 8,
  children: [ 
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
  AutoTranslateText(text:'كلمة المرور',weight: FontWeight.w500,fontSize: 16,
    color:Color.fromARGB(255, 6, 69, 152))
  ]),Directionality(
  textDirection: TextDirection.rtl,
  child:
  
  Container(width: 457, child:  Row(

mainAxisAlignment: MainAxisAlignment.start,    children: [
    
//    dropdownTextStyle:
//     TextStyle(
//     fontSize: 0.0001, 
//     height: 0.0001,
//     color: Colors.transparent,
//   ),
//   // dropdownIconPosition: IconPosition. leading,
//   initialCountryCode: 'EG',
//   languageCode: "ar",
//   obscureText: false,
//   showDropdownIcon: true,
//   // flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 10),
//   // dropdownTextStyle: const TextStyle(color: Colors.black),
//   style:
//    const TextStyle(
//     fontSize: 0.0001,
//     color: Colors
//   ),
//   onChanged: (phone) {
//   },
//   onCountryChanged: (country) {
//     _maxLengthNotifier.value = country.maxLength;
//   },
// ),
//  ),
    
      const SizedBox(width: 8),
      Expanded(
        child: ValueListenableBuilder<int?>(
          valueListenable: _maxLengthNotifier,
          builder: (context, maxLength, _) {
            return SizedBox(
              width: 373,height: 44,
              child:
              
              
              TextField(
                       controller: controller.passwordController,
              decoration: InputDecoration(
            
              label: AutoTranslateText(
      text: 'ادخل البريد الالكتروني',
      color: Colors.grey,
      fontSize: 16,
    ),
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
                counterText: "", // Hide the counter
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
// Container( width: 457, child:Column(
//   spacing: 8,
//   children: [ 
//     Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
// Text('رقم التليفون',
// style: TextStyle(fontWeight: FontWeight.w500,
// fontSize: 16,color: Color.fromARGB(255, 80, 124, 181)),),
//   ]),Directionality(
//   textDirection: TextDirection.rtl,
//   child:
  
//   Container(width: 457, child:  Row(

// mainAxisAlignment: MainAxisAlignment.start,    children: [
//       // Country code dropdown with flag
// //       Container(
// //                width: 76,height: 44,
// //         decoration: BoxDecoration(
// //           border: Border.all(
// //             color:  Color.fromARGB(255, 154, 175, 228), width: 1),
// //           borderRadius: BorderRadius.circular(8),
// //           color: Colors.white,
// //         ),
// //         child: IntlPhoneField(
// //           dropdownIcon:
// //           Icon(
// //              Icons.keyboard_arrow_down,size: 16,),
// //   disableLengthCheck: true,

// //   // dropdownIcon: Icon(Icons.keyboard_arrow_down),
//ion: const InputDecoration(
// //     counter: SizedBox.shrink(),
// //     border: InputBorder.none,
// //     counterText: "",
// //     contentPadding: EdgeInsets.zero,
// //     isDense: true,

// //   ),
// //    dropdownTextStyle:
// //     TextStyle(
// //     fontSize: 0.0001, 
// //     height: 0.0001,
// //     color: Colors.transparent,
// //   ),
// //   // dropdownIconPosition: IconPosition. leading,
// //   initialCountryCode: 'EG',
// //   languageCode: "ar",
// //   obscureText: false,
// //   showDropdownIcon: true,
// //   // flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 10),
// //   // dropdownTextStyle: const TextStyle(color: Colors.black),
// //   style:
// //    const TextStyle(
// //     fontSize: 0.0001,
// //     color: Colors.transparent,
// //   ),
// //   onChanged: (phone) {
// //     // phone.completeNumber still contains the full number
// //   },
// //   onCountryChanged: (country) {
// //     _maxLengthNotifier.value = country.maxLength;
// //   },
// // ),
// //  ),
    
//       const SizedBox(width: 8),
//       Expanded(
//         child: ValueListenableBuilder<int?>(
//           valueListenable: _maxLengthNotifier,
//           builder: (context, maxLength, _) {
//             return SizedBox(
//               width: 373,height: 44,
//               child:
              
              
//               TextField(
                       
//               decoration: InputDecoration(
            
//                 hintText: 'ادخل رقم الهاتف',
//                 hintStyle: const TextStyle(color: Colors.grey),
//                 filled: true,
//                 fillColor: Colors.white,
//                 contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
//                 border: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Color.fromARGB(255, 154, 175, 228), width: 1),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color:  Color.fromARGB(255, 154, 175, 228), width: 1),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               style: const TextStyle(fontSize: 16),
//               keyboardType: TextInputType.phone,
//               maxLength: maxLength,
//              ) );
//           },
//         ),
//       ),
  
//     ],
//   ),
// ) 
//   )

// ])
//                         // Container(
//                         //   height: 50,
//                         //   color: Colors.grey[300],
//                         )   ,                     //   child: const Center(child: Text("Item 1")),
//                         // ),
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
                      
                    
                  Container(width: 457,
                  child: Column(
                    spacing: 24,
                    children: [
                Container( width: 457,height: 44, child:     TextButton(
                     style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                 backgroundColor:MaterialStateProperty.all( Color.fromARGB(255, 6, 69, 152)
      ),  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          
          
                                    ))),
      
                      onPressed:
                        handleLogin
                      , child:
                      AutoTranslateText(text:  'تسجيل دخول',
                    color: Color.fromARGB(255, 255, 255, 255) )
                      )
                  )
                  
                  ,
                  
                  Container(
                    
                    width: 457,height: 72,
                    child:Column(
                      spacing: 8,
                      children: [ 

               Container(
                width: 457,
                child:    Row(
                  
                  spacing: 16,
                  children: [
          Container(
       width: 220.5,  height: 44,   child: 
          
TextButton(
  onPressed:() async {
    try {
      final authService = AuthService();
      final userCredential = await authService.signInWithFacebook();
      if (userCredential != null) {
        print('Logged in: ${userCredential.user?.displayName}');
        // Navigate or show success
      }
    } catch (e) {
      print('Error during Facebook login: $e');
    }
  } ,style : ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
       side:MaterialStateProperty.all<BorderSide>(BorderSide(color:Color.fromARGB(255, 6, 69, 152) ,width: 1)) ,       shape: MaterialStateProperty
       .all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          
          )
          
          )
                                    )
 , child:  Row(
  spacing: 16,
  children: [ 
  Image.asset('assets/facebookcircle.png',width: 24,height: 24.56,),
 AutoTranslateText (text:'تسجبل دخول عبر',
    weight: FontWeight.w500,fontSize: 18,
    color:Color.fromARGB(255, 6, 69, 152),),
  
  ]) )
                  
                  
                  
                        )  ,
        
        
          Container(
       width: 220.5,  height: 44,   child: 
          
TextButton(
  onPressed: (){
// HomeController controller=HomeController();
 

 return   signin();
  },style : ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
       side:MaterialStateProperty.all<BorderSide>(BorderSide(color:Color.fromARGB(255, 6, 69, 152) ,width: 1)) ,       shape: MaterialStateProperty
       .all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          
          )
          
          )
                                    )
 , child:Row(
  spacing: 16,
  children: [ 
  Image.asset('assets/Google@2x(1).png',width: 24,height: 24.56,),
  AutoTranslateText(text:'تسجبل دخول عبر',
    weight: FontWeight.w500,fontSize: 18,
    color:Color.fromARGB(255, 6, 69, 152), )
  
  
  ]) )
                  
                  
                  
                        )  
                              ],) 
                                   )     ,
                                   
                                   Container(width: 457,height: 20,child: 
                                   Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                  AutoTranslateText(text:
                                      
                                      ' دوس هنا والحق اشترك ببلاش' ,color:Color.fromARGB(255, 80, 124, 181)
                                        ) ,InkWell(
                                      onTap: (){
                                  Navigator.push(context,MaterialPageRoute(
                                    builder:(context){ return Signup();   }

                                                                                                              )                                                                          );                                      }
                                      ,
                                      child:  AutoTranslateText(text:'ماعندكش حساب ؟'                                
                                    ,  fontSize: 16,weight: FontWeight.w400,
                                      color:Color.fromARGB(255, 12, 12, 12) ,)
                                    ) ],),)
                                            ])  ) ],),
              
                  ) 
              
                        ])  ) ],
            ),
          ),
                      ]))]))):  Container(
                    width: 617,
                    height: 832,
                    padding: const EdgeInsets.fromLTRB(80, 85, 80, 52),
                    // color: const Color.fromARGB(61, 212, 182, 12),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                       Container( width:!isMobile? 457:343,//height: 438,
                       child: Column(
                        spacing: 24,
                        children: [
                        Container(
                          child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [ Image.asset('assets/logo1.png',width: 106,height: 106,)],) 
                          ,width: 457,height: 106,)
                     ,
                     Container(
                      width: 457,
                      child:Column(
                        spacing: 32,
                        children: [
                      Container( width: 457,child:Column(spacing: 16, children: [
                      Row( mainAxisAlignment: MainAxisAlignment.end, 
                      children: [ AutoTranslateText(text:'تسجيل انشاء حساب',
                        color:Color.fromARGB(255, 6, 69, 152),fontSize: 32
                        ,weight: FontWeight.w600 ,)])
                        ,
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
// Add this to your state class
 // To store selected country info



Container( width: 457, child:Column(
  spacing: 8,
  children: [ 
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
AutoTranslateText( text:'البريد الالكتروني',
weight: FontWeight.w500,
fontSize: 16,color: Color.fromARGB(255, 80, 124, 181)),
  ]),Directionality(
  textDirection: TextDirection.rtl,
  child:
  
  Container(width: 457, child:  Row(

mainAxisAlignment: MainAxisAlignment.start,    children: [
    
    
      const SizedBox(width: 8),
      Expanded(
        child: ValueListenableBuilder<int?>(
          valueListenable: _maxLengthNotifier,
          builder: (context, maxLength, _) {
            return SizedBox(
              width: 373,height: 44,
              child:
              
              
              TextField(
                controller: controller.emailController,          
              decoration: InputDecoration(
            
                label:AutoTranslateText(text:'ادخل البريد الالكتروني' , color: Colors.grey,) ,
                // hintStyle: const TextStyle(color: Colors.grey),
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
                   
                        )   ,                     //   child: const Center(child: Text("Item 1")),
                        // ),
Container( width: 457, child:Column(
  spacing: 8,
  children: [ 
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
AutoTranslateText(text:'كلمة المرور',
weight: FontWeight.w500,
fontSize: 16,color: Color.fromARGB(255, 80, 124, 181),),
  ]),Directionality(
  textDirection: TextDirection.rtl,
  child:
  
  Container(width: 457, child:  Row(

mainAxisAlignment: MainAxisAlignment.start,    children: [
   
//    dropdownTextStyle:
//     TextStyle(
//     fontSize: 0.0001, 
//     height: 0.0001,
//     color: Colors.transparent,
//   ),
//   // dropdownIconPosition: IconPosition. leading,
//   initialCountryCode: 'EG',
//   languageCode: "ar",
//   obscureText: false,
//   showDropdownIcon: true,
//   // flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 10),
//   // dropdownTextStyle: const TextStyle(color: Colors.black),
//   style:
//    const TextStyle(

//   },
//   onCountryChanged: (country) {
//     _maxLengthNotifier.value = country.maxLength;
//   },
// ),
//  ),
    
      const SizedBox(width: 8),
      Expanded(
        child: ValueListenableBuilder<int?>(
          valueListenable: _maxLengthNotifier,
          builder: (context, maxLength, _) {
            return SizedBox(
              width: 373,height: 44,
              child:
              
              
              TextField(
                       controller: controller.passwordController,
              decoration: InputDecoration(
            
                hintText: 'ادخل كلمة المرور',
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
                  
                  Container(width: 457,
                  child: Column(
                    spacing: 24,
                    children: [
                Container( width: 457,height: 44, child:     TextButton(
                     style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                 backgroundColor:MaterialStateProperty.all( Color.fromARGB(255, 6, 69, 152)
      ),  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          
          
                                    ))),
      
                      onPressed:
                        handleLogin
                      , child: AutoTranslateText(
      text: 'تسجيل دخول',
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 16,
    ), 
    // Text('تسجيل دخول',
    //                   style: TextStyle(color: Color.fromARGB(255, 255, 255, 255) ))
                      )
                  )
                  
                  ,
                  
         Wrap(
  spacing: 16,
  runSpacing: 16,
  children: [
    Container(
      width:!isMobile? 220.5:343,
      height: 44,
      child: TextButton(
  onPressed:() async {
    try {
      final authService = AuthService();
      final userCredential = await authService.signInWithFacebook();
      if (userCredential != null) {
        print('Logged in: ${userCredential.user?.displayName}');
      }
    } catch (e) {
      print('Error during Facebook login: $e');
    }
  } ,style : ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
       side:MaterialStateProperty.all<BorderSide>(BorderSide(color:Color.fromARGB(255, 6, 69, 152) ,width: 1)) ,       shape: MaterialStateProperty
       .all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          
          )
          
          )
                                    )
 , child:  Row(
  spacing: 16,mainAxisAlignment: MainAxisAlignment.center,
  children: [ 
  Image.asset('assets/facebookcircle.png',width: 24,height: 24.56,),
    AutoTranslateText(text:'تسجبل دخول عبر',weight: FontWeight.w500,//fontSize: 18,
    color:Color.fromARGB(255, 6, 69, 152))
  // Text(,style: TextStyle(
  //   fontWeight: FontWeight.w500,fontSize: 18,
  //   color:Color.fromARGB(255, 6, 69, 152)),),
  
  ]) )
                  
                  
                  
                        )  ,
        
        
          Container(
       width:!isMobile? 220.5:343,  height: 44,   child: 
          
TextButton(
  onPressed: (){
// HomeController controller=HomeController();
 

 return   signin();
  },style : ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
       side:MaterialStateProperty.all<BorderSide>(BorderSide(color:Color.fromARGB(255, 6, 69, 152) ,width: 1)) ,       shape: MaterialStateProperty
       .all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          
          )
          
          )
                                    )
 , child:Row(mainAxisAlignment: MainAxisAlignment.center,
  spacing: 16,
  children: [ 
  Image.asset('assets/Google@2x(1).png',width: 24,height: 24.56,),
  AutoTranslateText(text:'تسجبل دخول عبر',weight: FontWeight.w500,fontSize: 18,
    color:Color.fromARGB(255, 6, 69, 152))]))),
          
                                      
                                   
                                   Container(width: 457,height: 20,child: 
                                   Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                    AutoTranslateText(text:' دوس هنا والحق اشترك ببلاش' ,color:Color.fromARGB(255, 80, 124, 181)  ,)
                                    ,InkWell(
                                      onTap: (){
                                  Navigator.push(context,MaterialPageRoute(
                                    builder:(context){ return Signup();   }

                                                                                                              )                                                                          );                                      }
                                      ,
                                      child:  AutoTranslateText(text:'ماعندكش حساب ؟'
                                      ,weight: FontWeight.w400,
                                      color:Color.fromARGB(255, 12, 12, 12) ),)
                                     ],),)
                                            ],)    ],),
              
                  ) 
              
                        ])  ) ],
            ),
          ),
                      ]))]))
                      ]))],) ) );
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
            leading:AutoTranslateText(text: country.flag),
            title: AutoTranslateText(text:"${country.name}"),
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