import 'package:flutter/material.dart';

class CalendarPageWidget extends StatefulWidget {
  const CalendarPageWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CalendarPageWidget> createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("My Calendar View Page"),
    );
  }
}
