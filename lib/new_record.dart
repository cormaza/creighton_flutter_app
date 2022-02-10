import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewEditPageWidget extends StatefulWidget {
  const NewEditPageWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<NewEditPageWidget> createState() => NewEditPageState();
}

class NewEditPageState extends State<NewEditPageWidget> {
  DateTime selectedDate = DateTime.now();
  String? dayTypeDropdownValue;
  String? menstrualTypeDropdownValue;
  bool _menstrualShow = false;
  TextEditingController dateCtl = TextEditingController();
  DateFormat formatter = DateFormat.yMMMMd();
  @override
  Widget build(BuildContext context) {
    Map<String, String> imageLabels = {
      'peak': AppLocalizations.of(context)!.peak,
      'peak_1': AppLocalizations.of(context)!.peak_1,
      'peak_2': AppLocalizations.of(context)!.peak_2,
      'peak_3': AppLocalizations.of(context)!.peak_3,
      'peak_p': AppLocalizations.of(context)!.peak_p,
      'g_peak': AppLocalizations.of(context)!.g_peak,
      'g_peak_1': AppLocalizations.of(context)!.g_peak_1,
      'g_peak_2': AppLocalizations.of(context)!.g_peak_2,
      'g_peak_3': AppLocalizations.of(context)!.g_peak_3,
      'y_peak': AppLocalizations.of(context)!.y_peak,
      'y_peak_1': AppLocalizations.of(context)!.y_peak_1,
      'y_peak_2': AppLocalizations.of(context)!.y_peak_2,
      'y_peak_3': AppLocalizations.of(context)!.y_peak_3,
      'red': AppLocalizations.of(context)!.red,
      'green': AppLocalizations.of(context)!.green,
      'yellow': AppLocalizations.of(context)!.yellow,
    };
    Map<String, String> menstrualLabels = {
      "menstrual_h": AppLocalizations.of(context)!.menstrual_h,
      "menstrual_m": AppLocalizations.of(context)!.menstrual_m,
      "menstrual_l": AppLocalizations.of(context)!.menstrual_l,
      "menstrual_vl": AppLocalizations.of(context)!.menstrual_vl,
      "menstrual_b": AppLocalizations.of(context)!.menstrual_b,
    };
    return Center(
      child: Form(
          child: Scrollbar(
              child: Align(
        alignment: Alignment.topCenter,
        child: Card(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: dateCtl,
                    readOnly: true,
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      await _selectDate(context);
                    },
                    maxLines: 1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Choose Date';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Record Date.',
                      filled: true,
                      icon: Icon(Icons.calendar_today),
                      labelStyle:
                          TextStyle(decorationStyle: TextDecorationStyle.solid),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonHideUnderline(
                      child: DropdownButton(
                    icon: const Icon(Icons.arrow_downward),
                    hint: const Center(
                      child: Text("Select day type"),
                    ),
                    items: imageLabels.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                  'assets/images/' + value + '.png'),
                            ),
                            const SizedBox(width: 50),
                            Text(imageLabels[value]!),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue == "red") {
                          _menstrualShow = true;
                        } else {
                          _menstrualShow = false;
                        }
                        dayTypeDropdownValue = newValue!;
                      });
                    },
                    isExpanded: true,
                    value: dayTypeDropdownValue,
                  )),
                  const SizedBox(height: 10),
                  Visibility(
                      visible: _menstrualShow,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          icon: const Icon(Icons.arrow_downward),
                          hint: const Center(
                            child: Text("Select menstrual flow type"),
                          ),
                          items: menstrualLabels.keys
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Text(menstrualLabels[value]!));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              menstrualTypeDropdownValue = newValue!;
                            });
                          },
                          isExpanded: true,
                          value: menstrualTypeDropdownValue,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ))),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime today = DateTime.now();
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: today.subtract(const Duration(days: 365)),
      lastDate: today,
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        dateCtl.text = formatter.format(selectedDate);
      });
    }
  }
}
