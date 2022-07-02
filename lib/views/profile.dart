import 'package:flutter/material.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ProfilePageWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("My Profile Page"),
    );
  }
}
