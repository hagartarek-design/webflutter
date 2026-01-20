// import 'package:get/get.dart';
// import 'package:my_app/app/modules/home/views/homeafterlogin.dart';

// import '../modules/home/bindings/home_binding.dart';
// import '../modules/home/views/mainpage.dart';


// part 'app_routes.dart';


// class AppPages {
//   AppPages._();

//   static const INITIAL = Routes.HOME;

//   static final routes = [
//     GetPage(
//       name: _Paths.HOME,
//       page: () =>  HomeView(),
//       binding: HomeBinding(),
//     ),
//   ];
// }
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/views/home.dart';
import 'package:my_app/app/modules/home/views/homeafterlogin.dart';
// import '../modules/main/main_page.dart';
// import '../modules/home/home_after_login.dart';

class AppPages {
  static const INITIAL = '/main';

  static final routes = [
    GetPage(name: '/main', page: () => Mainpage()),
    GetPage(name: '/Homeafterlogin', page: () => Homeafterlogin()),
  ];
}
