import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPageWidget extends StatefulWidget {
  const CalendarPageWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CalendarPageWidget> createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          )
        ],
      ),
    );
  }
}
