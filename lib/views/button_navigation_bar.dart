import 'package:creighton_app/controllers/main_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:creighton_app/models/enums.dart';

@immutable
class CustomButtonNavigationBar extends GetView {
  CustomButtonNavigationBar({Key? key}) : super(key: key);
  final MainController mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.pink.shade200,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'New Record',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_available),
          label: 'History',
        ),
      ],
      currentIndex: mainController.currentMode.value.index,
      selectedItemColor: Colors.white,
      onTap: (index) {
        switch (index) {
          case 0:
            mainController.currentMode.value = PageMode.home;
            break;
          case 1:
            mainController.currentMode.value = PageMode.newrecord;
            break;
          case 2:
            mainController.currentMode.value = PageMode.calendar;
            break;
        }
      },
    );
  }
}
