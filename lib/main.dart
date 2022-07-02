import 'package:creighton_app/controllers/main_controller.dart';
import 'package:creighton_app/controllers/messages.dart';
import 'package:creighton_app/models/enums.dart';
import 'package:creighton_app/views/button_navigation_bar.dart';
import 'package:creighton_app/views/drawer.dart';
import 'package:creighton_app/views/home.dart';
import 'package:creighton_app/views/profile.dart';
import 'package:creighton_app/views/about.dart';
import 'package:creighton_app/views/calendar_view.dart';
import 'package:creighton_app/views/new_record.dart';
import 'package:creighton_app/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Creighton Record App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink.shade200,
          secondary: Colors.pink.shade200,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      translations: Messages(),
      initialBinding: MainBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const MyHomePage(),
          binding: MainBinding(),
        )
      ],
    );
  }
}

@immutable
class MyHomePage extends GetView<MainController> {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(
        () {
          return Text(controller.title.value);
        },
      )),
      key: controller.scaffoldKey,
      drawer: DrawerMenu(),
      body: Obx(() {
        switch (controller.currentMode.value) {
          case PageMode.home:
            {
              return const HomePageWidget(title: "Home");
            }
          case PageMode.newrecord:
            {
              return const NewEditPageWidget(title: "Home");
            }
          case PageMode.calendar:
            {
              return const CalendarPageWidget(title: "Home");
            }
          case PageMode.profile:
            {
              return const ProfilePageWidget(title: "Home");
            }
          case PageMode.about:
            {
              return const AboutPageWidget(title: "Home");
            }
          case PageMode.settings:
            {
              return const SettingsPageWidget(title: "Home");
            }
          default:
            {
              return const HomePageWidget(title: "Home");
            }
        }
      }),
      bottomNavigationBar: CustomButtonNavigationBar(),
    );
  }
}
