import 'package:creighton_app/controllers/main_controller.dart';
import 'package:creighton_app/models/enums.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

@immutable
class DrawerMenu extends GetView {
  DrawerMenu({Key? key}) : super(key: key);
  final MainController mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.pink.shade200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink.shade200,
              ),
              accountName: const Text("Isabel Lombeida"),
              accountEmail: const Text("isa.lombeida@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.pinkAccent
                        : Colors.white,
                child: const Text(
                  "IL",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              onDetailsPressed: () {},
            ),
            ListTile(
              trailing: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                mainController.currentMode.value = PageMode.home;
                mainController.closeDrawer();
              },
            ),
            ListTile(
              trailing: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                mainController.currentMode.value = PageMode.profile;
                mainController.closeDrawer();
              },
            ),
            ListTile(
              trailing: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                mainController.currentMode.value = PageMode.about;
                mainController.closeDrawer();
              },
            ),
            ListTile(
              trailing: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                mainController.currentMode.value = PageMode.profile;
                mainController.closeDrawer();
              },
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_back),
              title: const Text('Return'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
