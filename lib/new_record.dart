import 'package:flutter/material.dart';

class NewEditPageWidget extends StatefulWidget {
  const NewEditPageWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<NewEditPageWidget> createState() => NewEditPageState();
}

class NewEditPageState extends State<NewEditPageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("My New/Edit Page"),
    );
  }
}
