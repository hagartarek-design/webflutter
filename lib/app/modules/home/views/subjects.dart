import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/app/modules/home/views/menuebar%20paym%20copy.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// Import your other files
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_app/app/modules/home/views/lecturenotpaid.dart';

import 'settings.dart';
import 'subjecttype.dart';
// import other views as needed

class Subjects extends StatelessWidget {
  final String courseId;
  final List<dynamic> courseInfos;
  
  const Subjects({super.key, required this.courseId, required this.courseInfos});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: _buildAppBar(isMobile, context),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return _buildBody(context, controller, isMobile, screenWidth);
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(bool isMobile, BuildContext context) {
    if (isMobile) {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 6, 70, 152),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              // onTap: () => _showMenuDialog(context),
              child: const Icon(Icons.menu, color: Colors.white),
            ),
            Image.asset('assets/Group87935.png', width: 55),
          ],
        ),
      );
    } else {
      return AppBar(
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
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: const CircleAvatar(radius: 24),
                    ),
                    Image.asset('icons/Vector_3.png', width: 40, height: 41),
                    Image.asset('icons/Vector_2.png', width: 39.02, height: 40)
                  ],
                ),
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
      );
    }
  }

  Widget _buildBody(BuildContext context, HomeController controller, bool isMobile, double screenWidth) {
    controller.fetchcourseinfoid(courseId);
    
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              _buildDiscountBanner(isMobile),
              const SizedBox(height: 20),
              _buildTeacherInfo(isMobile, screenWidth),
              const SizedBox(height: 20),
              _buildThumbnailImage(context, screenWidth),
              const SizedBox(height: 20),
              _buildLecturesSection(context, controller, constraints),
              const SizedBox(height: 24),
              _buildFooter(context),
              _buildCopyrightText(),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDiscountBanner(bool isMobile) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 242, 195, 42),
      padding: const EdgeInsets.all(8),
      child: Text(
        'استخدم كود خصم (ANER) واحصل على خصم على الدروس الخصوصية 36%',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color.fromARGB(255, 6, 69, 152),
          fontSize: isMobile ? 14 : 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTeacherInfo(bool isMobile, double screenWidth) {
    return SizedBox(
      width: !isMobile ? 1280 : screenWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildBreadcrumbItem('شوف المحاضره المسجله'),
          _buildBreadcrumbDivider(),
          _buildBreadcrumbItem('شوف المحاضره', isActive: false),
          _buildBreadcrumbDivider(),
          _buildBreadcrumbItem('مادة الفيزياء', isActive: false),
          _buildBreadcrumbDivider(),
          _buildBreadcrumbItem('الصف الثالث الثانوي', isActive: false),
          _buildBreadcrumbDivider(),
          _buildBreadcrumbItem('الرئيسية', isActive: false),
        ],
      ),
    );
  }

  Widget _buildBreadcrumbItem(String text, {bool isActive = true}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: isActive 
            ? const Color.fromARGB(255, 6, 69, 152)
            : const Color.fromARGB(255, 181, 181, 181),
      ),
    );
  }

  Widget _buildBreadcrumbDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Icon(Icons.arrow_back_ios, 
          color: Color.fromARGB(255, 181, 181, 181), size: 14),
    );
  }

  Widget _buildThumbnailImage(BuildContext context, double screenWidth) {
    return InkWell(
      onTap: () => Navigator.push(context, 
          MaterialPageRoute(builder: (context) => Subjecttype())),
      child: Image.asset(
        'assets/thumb4.png',
        width: screenWidth,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _buildLecturesSection(BuildContext context, HomeController controller,
   BoxConstraints constraints) {
    final displayedInfos = controller.course_info.isNotEmpty 
        ? controller.course_info 
        : courseInfos;

    // Calculate total sections safely
    int totalSectionsLength = 0;
    for (var course in controller.course_info) {
      if (course.section != null && course.section is List) {
        totalSectionsLength += (course.section as List).length;
      }
    }

    return SizedBox(
      width: constraints.maxWidth * 0.95,
      child: Column(
        children: [
          SizedBox(
            width: constraints.maxWidth * 0.95,
            height: 40,
            child: InkWell(
              onTap: () {},
              child: Text(
                'شوف المحاضره المسجله',
                style: TextStyle(
                  color: const Color.fromARGB(255, 6, 69, 152),
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.start,
            children: List.generate(totalSectionsLength, (index) {
              return _buildLectureCard(context, controller, index);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildLectureCard(BuildContext context, HomeController controller, int sectionIndex) {
    String? sectionId;
    try {
      final allSections = <dynamic>[];
      for (var course in controller.course_info) {
        if (course.section != null && course.section is List) {
          allSections.addAll(course.section as List);
        }
      }
      
      if (sectionIndex < allSections.length) {
        final section = allSections[sectionIndex];
        if (section is Map && section.containsKey('id')) {
          sectionId = section['id'].toString();
        }
      }
    } catch (e) {
      print('Error getting section ID: $e');
    }

    if (sectionId == null) {
      return const SizedBox(); // Return empty widget if no section found
    }

    // return FutureBuilder<bool>(
    //   // initialData:  controller.usedEnrollmentsection(sectionId),
    //   future: controller.usedEnrollmentsection(sectionId),
    //   builder: (context, snapshot) {
    //     bool enrolled = snapshot.data ?? false;
        
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('assets/lecturecard.png', width: 268, height: 396),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(1, 255, 255, 255),
                ),
              ),
            ),
            _buildLectureCardHeader(controller, sectionIndex),
            _buildLectureCardButton(context, controller, sectionIndex),
          ],
        // );
      // },
    );
  }

  Widget _buildLectureCardHeader(HomeController controller, int sectionIndex) {
    // Get section name safely
    String sectionName = 'المحاضرة';
    try {
      final allSections = <dynamic>[];
      for (var course in controller.course_info) {
        if (course.section != null && course.section is List) {
          allSections.addAll(course.section as List);
        }
      }
      
      if (sectionIndex < allSections.length) {
        final section = allSections[sectionIndex];
        if (section is Map && section.containsKey('name')) {
          sectionName = section['name']?.toString() ?? 'المحاضرة';
        }
      }
    } catch (e) {
      print('Error getting section name: $e');
    }

    return Container(
      width: 268,
      height: 128,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16)
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 6, 69, 152),
            const Color.fromARGB(171, 118, 162, 212),
          ],
        ),
      ),
      child: SizedBox(
        width: 236,
        height: 49,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              sectionName,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  ' فيديوهات-5\n PDF 7-\n${controller.sumExamAss} - امتحانات و واجبات',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

Widget _buildLectureCardButton(
    BuildContext context, HomeController controller, int sectionIndex) {
  // استخراج الـ section
  final allSections = <dynamic>[];
  for (var course in controller.course_info) {
    if (course.section != null && course.section is List) {
      allSections.addAll(course.section as List);
    }
  }

  if (sectionIndex >= allSections.length) return const SizedBox();

  final section = allSections[sectionIndex];
  final bool isUsed = section['isUsed'] == false; // لو مستخدم

  return Positioned(
    top: 326,
    left: 24,
    child: SizedBox(
      width: 220,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isUsed
              ? const Color.fromARGB(255, 6, 69, 152) // أزرق لو مستخدم
              : Colors.white, // أبيض لو مش مستخدم
          side: BorderSide(
            color: isUsed
                ? const Color.fromARGB(255, 6, 69, 152)
                : Colors.grey,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () async {
          if (!isUsed) {

            await _handleLectureCardPress(context, controller, sectionIndex);
          } else {
            final price = int.tryParse(section['price'].toString()) ?? 0;
            final id = section['id'].toString();
            final ids = section['id'];

            showDialog(
              context: context,
              builder: (context) {
controller.addsectiontocart(id: ids!);
                return Menuebarpaym2(price: price, sectionId: id,course:courseId);
              },
            );
          }
        },
        child: Text(
          isUsed ? 'شوف المحاضرة' : 'اشترك دلوقتي',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isUsed
                ? Colors.white
                : const Color.fromARGB(255, 6, 69, 152),
          ),
        ),
      ),
    ),
  );
}

  Future<void> _handleLectureCardPress(BuildContext context, HomeController controller, int sectionIndex) async {
    try {
      // Get section ID safely
      final allSections = <dynamic>[];
      for (var course in controller.course_info) {
        if (course.section != null && course.section is List) {
          allSections.addAll(course.section as List);
        }
      }
      
      if (sectionIndex >= allSections.length) return;
      
      final section = allSections[sectionIndex];
      final sectionId = section['id']?.toString();
      
      if (sectionId == null) return;
      
      await controller.fetchsectionid(sectionId);

      // Process the fetched data
      String courseId = '';
      List<dynamic> lessons = [];

      // Extract course info and lessons from the fetched section data
      for (var sectionData in controller.section) {
        if (sectionData.section != null && sectionData.section is List) {
          for (var sec in sectionData.section as List) {
            if (sec['id']?.toString() == sectionId) {
              if (sec['course'] != null) {
                courseId = sec['course']['id']?.toString() ?? '';
              }
              if (sec['lessons'] != null && sec['lessons'] is List) {
                lessons = sec['lessons'] as List;
              }
              break;
            }
          }
        }
      }

      if (courseId.isNotEmpty) {
        await controller.initializePlayer(courseId);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Lecturenotpaid(courseId: courseId, index: sectionIndex, lesson: lessons);
        }));
      }
    } catch (e) {
      print('Error handling lecture card press: $e');
    }
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 6, 69, 152),
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
                  _buildContactSection(context),
                  _buildAboutSection(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return SizedBox(
      width: screenWidth < 600 ? double.infinity : 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildSectionTitle('تواصل معنا'),
          const SizedBox(height: 16),
          // _buildInfoRow('icons/location.png', '26 Street 261, عزبة فهمي، قسم المعادي، محافظة القاهرة‬'),
          const SizedBox(height: 12),
          _buildInfoRow('icons/Phone.png', '+20 106 662 0129'),
          const SizedBox(height: 12),
          _buildInfoRow('icons/sms_1.png', 'support@ashtar.app'),
          const SizedBox(height: 12),
          _buildSocialIcons(),
          const SizedBox(height: 16),
          _buildSectionTitle('حمل التطبيق الان'),
          const SizedBox(height: 12),
          _buildStoreButtons(),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return SizedBox(
      width: 600,
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
                  color: const Color.fromARGB(255, 242, 195, 42),
                  fontSize: 24),
            ],
          ),
          const SizedBox(height: 24),
          const Align(
            alignment: Alignment.centerRight,
            child: Image(
              image: AssetImage('assets/Group87935.png'),
              width: 80,
              height: 65.7,
            ),
          ),
          const SizedBox(height: 16),
          _buildSectionTitle('عن أشطر'),
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
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color.fromARGB(255, 242, 195, 42),
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    );
  }

  Widget _buildInfoRow(String iconPath, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.right,
        ),
        const SizedBox(width: 8),
        Image.asset(iconPath, width: 24, height: 24),
      ],
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _icon('icons/Frame_14.png'),
        const SizedBox(width: 12),
        _icon('icons/Frame_13.png'),
        const SizedBox(width: 12),
        _icon('icons/Frame_12.png'),
        const SizedBox(width: 12),
        _icon('icons/Frame_11.png'),
      ],
    );
  }

  Widget _buildStoreButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _storeButton('icons/Frame_16.png', 'Google play'),
        const SizedBox(width: 12),
        _storeButton('icons/Frame_15.png', 'App Store'),
      ],
    );
  }

  Widget _buildCopyrightText() {
    return const Text(
      'Copyright © 2023 Ashtar App | Terms of Use | Privacy Policy',
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color.fromARGB(255, 6, 69, 152),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _navText(String text, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child:  AutoTranslateText(weight: FontWeight.w400 , fontSize: 18,text: text,highlight: highlight,color:  const Color.fromARGB(255, 181, 181, 181),)
    );
  }

  Widget _icon(String path) {
    return Image.asset(path, width: 24, height: 24);
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
              const Text("Get it on", style: TextStyle(fontWeight: FontWeight.w600)),
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title, {Color color = const Color.fromARGB(255, 181, 181, 181), double fontSize = 20}) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  // void _showMenuDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierColor: Colors.transparent,
  //     // builder: (context) => const Menuebarpaym(),
  //   );
  // }
}