import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';


class InlineCounterTextFieldScreen extends StatefulWidget {
  const InlineCounterTextFieldScreen({super.key});

  @override
  _InlineCounterTextFieldScreenState createState() => _InlineCounterTextFieldScreenState();
}
class _InlineCounterTextFieldScreenState extends State<InlineCounterTextFieldScreen> {
  //  HomeController controller=HomeController();

  // @override
  // void initState() {
  //   super.initState();
  //   controller = HomeController(); // إنشاء مرة واحدة فقط
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: HomeController(), builder: (controller)=> Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controller.titles,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              border: InputBorder.none,
              hintTextDirection: TextDirection.rtl,
              hintText: 'ادخل السؤال',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 154, 175, 228),
              ),
            ),
          ),
        ],
      ),
      )  );
  }
}
