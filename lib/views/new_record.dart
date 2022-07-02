import 'package:creighton_app/views/selection_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  String? elasticityTypeDropdownValue;
  String? colorTypeDropdownValue;
  bool _menstrualShow = false;
  bool _elasticityShow = false;
  bool _colorShow = false;
  TextEditingController dateCtl = TextEditingController();
  DateFormat formatter = DateFormat.yMMMMd();
  @override
  Widget build(BuildContext context) {
    final SelectionData selectionData = SelectionData(context);

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
                    items: selectionData.imageLabels.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset('assets/images/$value.png'),
                            ),
                            const SizedBox(width: 50),
                            Text(selectionData.imageLabels[value]!),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue == "red") {
                          _menstrualShow = true;
                        } else {
                          _elasticityShow = true;
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
                          items: selectionData.menstrualLabels.keys
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                    selectionData.menstrualLabels[value]!));
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (['menstrual_l', 'menstrual_vl', 'menstrual_b']
                                .contains(newValue)) {
                              _elasticityShow = true;
                            } else {
                              _elasticityShow = false;
                            }
                            setState(() {
                              menstrualTypeDropdownValue = newValue!;
                            });
                          },
                          isExpanded: true,
                          value: menstrualTypeDropdownValue,
                        ),
                      )),
                  const SizedBox(height: 10),
                  Visibility(
                      visible: _elasticityShow,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          icon: const Icon(Icons.arrow_downward),
                          hint: const Center(
                            child: Text("Select elasticity"),
                          ),
                          items: selectionData.elasticityLabels.keys
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                    selectionData.elasticityLabels[value]!));
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (['6', '8', '10'].contains(newValue) &&
                                _elasticityShow) {
                              _colorShow = true;
                            } else {
                              _colorShow = false;
                            }
                            setState(() {
                              elasticityTypeDropdownValue = newValue!;
                            });
                          },
                          isExpanded: true,
                          value: elasticityTypeDropdownValue,
                        ),
                      )),
                  const SizedBox(height: 10),
                  Visibility(
                      visible: _colorShow,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          icon: const Icon(Icons.arrow_downward),
                          hint: const Center(
                            child: Text("Select color"),
                          ),
                          items: selectionData.colorLabels.keys
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Text(selectionData.colorLabels[value]!));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              colorTypeDropdownValue = newValue!;
                            });
                          },
                          isExpanded: true,
                          value: colorTypeDropdownValue,
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
