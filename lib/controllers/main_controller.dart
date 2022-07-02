import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:creighton_app/models/enums.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}

class MainController extends GetxController {
  var currentMode = PageMode.home.obs;
  var title = "Creighton App Register".obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
