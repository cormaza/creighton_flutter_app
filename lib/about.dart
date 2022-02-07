import 'package:flutter/material.dart';

class AboutPageWidget extends StatefulWidget {
  const AboutPageWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<AboutPageWidget> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("My Calendar View Page"),
    );
  }
}
