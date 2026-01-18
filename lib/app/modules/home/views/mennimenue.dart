import 'package:flutter/material.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/addedto.dart';
import 'package:my_app/app/modules/home/views/emptycart.dart';
import 'package:my_app/app/modules/home/views/mainpage.dart';
import 'package:my_app/app/modules/home/views/myExam.dart' show Myexam;
import 'package:my_app/app/modules/home/views/mybooks.dart';
import 'package:my_app/app/modules/home/views/mycourses.dart';
import 'package:my_app/app/modules/home/views/myquestionask.dart' show myquestionask;
import 'package:my_app/app/modules/home/views/profile.dart';
import 'package:my_app/app/modules/home/views/sections.dart';
import 'package:my_app/app/modules/home/views/settings.dart';
import 'package:my_app/app/modules/home/views/wallet.dart';
import 'package:my_app/app/modules/home/views/walletMobile.dart';

class mennimenu extends StatelessWidget {
  const mennimenu({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    HomeController controller=HomeController();
      final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;  
    final isMobile = screenWidth < 900;
    final sidebarWidth = isSmallScreen ? screenWidth * 0.8 : 275.0;
    final sidebarHeight = isSmallScreen ? screenHeight : 747.0;
    return Dialog(
      insetPadding: const EdgeInsets.only(left: 0),
      backgroundColor: const Color.fromARGB(255, 6, 70, 152),
      alignment: Alignment.centerLeft,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SizedBox(
        width: 300,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
       Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.network(
                'https://media.githubusercontent.com/media/hagartarek-design/webflutter/refs/heads/main/assets/logoashtarwithephase2(2).png',
                width: isSmallScreen ? 100.0 : 143.51,
                height: isSmallScreen ? 80.0 : 118.0,
                fit: BoxFit.contain,
              )
            ),
            const SizedBox(height: 20),
            
        InkWell(child:  _buildMenuItem(
              Icons.arrow_back_ios, 
              "الملف الشخصي", 
              Icons.person_2_outlined,
              isSmallScreen: isSmallScreen
            ) ,onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){return Profile();}));
        },),  
            
            InkWell(
              child: _buildMenuItem(
                Icons.arrow_back_ios,
                "محفظتك", 
                Icons.account_balance_wallet_outlined,
                isSmallScreen: isSmallScreen
              ),
              onTap: () { 
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return isMobile?walletMobile(): wallet();
                })); 
              }
            ),  
            
            InkWell(
              onTap: () { 
           List.generate(controller.profile?['courses']?.length ?? 0, (index) {
  var courses = controller.profile?['courses'];
  
  if (courses != null && index < courses.length) {
    var users = courses[index]?['users'];
    
    if (users != null) {
      var imageUrls =  courses[index]?['users'].map((e) => 'http://localhost:3000${e['image']}').join('\n');
      print(imageUrls);
    } else {
      print('No users found for this course.');
    }
  } else {
    print('No course data or index out of range.');
  }
});

               
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return myCourses();
                })); 
              },
              child: _buildMenuItem(
                Icons.arrow_back_ios,
                "محتواي",
                Icons.folder_outlined,
                isSmallScreen: isSmallScreen
              ),
            ),
            
            // _buildMenuItem(
            //   Icons.arrow_back_ios,
            //   "اسأل المدرس",
            //   Icons.arrow_back_outlined,
            //   isSmallScreen: isSmallScreen
            // ),
            
          InkWell(child:  _buildMenuItem(
              Icons.arrow_back_ios,
              "كورساتي",
              Icons.arrow_back_outlined,
              isSmallScreen: isSmallScreen
            ),
            onTap: (){  Navigator.push(context, MaterialPageRoute(builder: (context)
            
            {
            controller.  fetchSections();
              return mySections();})); },) ,
       InkWell(child: _buildMenuItem(
              Icons.arrow_back_ios,
              "ملازمي",
              Icons.arrow_back_outlined,
              isSmallScreen: isSmallScreen
            ),
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context){
                return myBooks();
              }));
            },
            )  
         ,
      InkWell(  child:       _buildMenuItem(
              Icons.arrow_back_ios,
              "امتحناتك",
              Icons.arrow_back_outlined,
              // isSmallScreen: isSmallScreen
            ),
      onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
  return Material(child: Myexam());
}));

            }
      
            ),
          InkWell(child:   _buildMenuItem(
              Icons.arrow_back_ios,
              "اسأل المدرس",
              Icons.arrow_back_outlined,
              isSmallScreen: isSmallScreen
            ) ,onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context){return myquestionask();}));

            },)  
         ,
            
          InkWell(
            onTap: (){
             
controller.fetchCart();
              Navigator.push(context, MaterialPageRoute(builder: (context){return Addedto();}));
              
            },
            child: _buildMenuItem(
              Icons.arrow_back_ios,
              "سلة المشتريات",
              Icons.shopping_cart_outlined,
              isSmallScreen: isSmallScreen
            ),) 
            ,
        InkWell(child:   _buildMenuItem(
              Icons.arrow_back_ios,
              "طلباتك",
              Icons.list_alt_outlined,
              isSmallScreen: isSmallScreen
            )
         ,onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){
      controller.fetchCart();return Emptycart();   }
        ));},)    ,
            InkWell(
              
              child:_buildMenuItem(
              Icons.arrow_back_ios,
              "الإعدادات",
              Icons.settings_outlined,
              isSmallScreen: isSmallScreen
            ),onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return Material(child: settings() ,);
                }));
              },
            ),
            
            InkWell(child: _buildMenuItem(
              Icons.arrow_back_ios,
              "تسجيل خروج",
              Icons.logout_outlined,
              isSmallScreen: isSmallScreen
            ),onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){return HomeView();}));
            } ,)
           
          ],
        
      )]))));
  }
  
    Widget _buildMenuItem(IconData icon, String title, IconData icons, {bool isSmallScreen = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 12.0 : 16.0, 
        vertical: isSmallScreen ? 8.0 : 12.0
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: isSmallScreen ? 18.0 : 24.0),
          SizedBox(width: isSmallScreen ? 8.0 : 10.0),
          Expanded(
            child: AutoTranslateText(
           text:  title,
              // style: TextStyle(
                color: Colors.white, 
                fontSize: isSmallScreen ? 14.0 : 16.0
              // ),
              // textAlign: TextDirection.rtl,
            ),
          ),
          Icon(icons, color: Colors.white, size: isSmallScreen ? 18.0 : 24.0),
        ],
      ),
    );
  }

  }