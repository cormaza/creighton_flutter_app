import 'package:flutter/material.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<SettingsPageWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("My Settings Page"),
    );
  }
}
