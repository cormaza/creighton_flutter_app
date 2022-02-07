import 'package:creighton_app/home.dart';
import 'package:creighton_app/profile.dart';
import 'package:creighton_app/about.dart';
import 'package:creighton_app/calendar_view.dart';
import 'package:creighton_app/new_record.dart';
import 'package:creighton_app/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const MyHomePage(title: 'Creighton App Register'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget widgetForBody = const HomePageWidget(title: "Home Page");
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
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
                  setState(() {
                    widgetForBody = const HomePageWidget(title: "Home");
                    _selectedIndex = 0;
                    Navigator.pop(context);
                  });
                },
              ),
              ListTile(
                trailing: const Icon(Icons.account_circle),
                title: const Text('Profile'),
                onTap: () {
                  setState(() {
                    widgetForBody = const ProfilePageWidget(title: "Profile");
                    _selectedIndex = 0;
                    Navigator.pop(context);
                  });
                },
              ),
              ListTile(
                trailing: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  setState(() {
                    widgetForBody = const AboutPageWidget(title: "About");
                    _selectedIndex = 0;
                    Navigator.pop(context);
                  });
                },
              ),
              ListTile(
                trailing: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  setState(() {
                    widgetForBody = const SettingsPageWidget(title: "Profile");
                    _selectedIndex = 0;
                    Navigator.pop(context);
                  });
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
          )),
      body: widgetForBody,
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: (index) {
          _selectedIndex = index;
          setState(() {
            switch (index) {
              case 0:
                widgetForBody = const HomePageWidget(title: "Home");
                break;
              case 1:
                widgetForBody = const NewEditPageWidget(title: "New / Edit");
                break;
              case 2:
                widgetForBody = const CalendarPageWidget(title: "Calendar");
                break;
            }
          });
        },
      ),
    );
  }
}
