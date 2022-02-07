import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomePageWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)!.helloWorld),
    );
  }
}
