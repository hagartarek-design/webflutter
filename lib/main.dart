import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';// Add this import
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';

import 'package:my_app/app/routes/app_pages.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final HomeController controller = Get.put(HomeController());
  String initialRoute;

  try {
    initialRoute = await controller.getInitialRoute();
  } catch (_) {
    initialRoute = '/main';
  }
  // HomeController controller=HomeController();
final tokens = await controller. getTokens();
if (tokens != null) {
  // final authController = Get.put(AuthController());
  controller.startTokenTimer(tokens['token']);
}
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: initialRoute,
      locale: const Locale('ar'),
      getPages: AppPages.routes,
    ),
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