import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';// Add this import
import 'package:get/get.dart';

import 'package:my_app/app/routes/app_pages.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyBQ6Ofa213SFlOgiMYS_uBLZ0LX317l3bU",
  //     authDomain: "students-e7907.firebaseapp.com",
  //     projectId: "students-e7907",
  //     storageBucket: "students-e7907.firebasestorage.app",
  //     messagingSenderId: "64872570774",
  //     appId: "1:64872570774:web:dad36ad23957204bf9c7b7",
  //   ),
  // );

  runApp(
   GetMaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Application",
  initialRoute: AppPages.INITIAL,
  locale: const Locale('ar'),
  getPages: AppPages.routes,
)

  );
}


// class MyTranslations extends Translations {
  // @override
  // Map<String, Map<String, String>> get keys => {
  //       'en': {
  //         "arabic": "Arabic",
  //         "english": "English",
  //         "login": "Login",
  //         "createaccount": "Create Account",
  //         "contactus": "Contact Us",
  //         "about": "About",
  //         "home": "Home",
  //         "courses": "My Courses",
  //         "teachers": "Our Teachers",
  //         "study": "Study",
  //       },
  //       'ar': {
  //         "arabic": "عربي",
  //         "english": "إنجليزي",
  //         "login": "تسجيل دخول",
  //         "createaccount": "إنشاء حساب",
  //         "contactus": "تواصل معنا",
  //         "about": "عن أشطر",
  //         "home": "الرئيسية",
  //         "courses": "كورساتى",
  //         "teachers": "مدرسينا",
  //         "study": "ذاكر",
  //         // Add all other text keys used in your app
  //       },
  //     };

// }