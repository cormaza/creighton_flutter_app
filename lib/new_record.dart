import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class NewEditPageWidget extends StatefulWidget {
  const NewEditPageWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<NewEditPageWidget> createState() => NewEditPageState();
}

class NewEditPageState extends State<NewEditPageWidget> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateCtl = TextEditingController();
  DateFormat formatter = DateFormat.yMMMMd();
  @override
  Widget build(BuildContext context) {
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
                    },
                    decoration: const InputDecoration(
                      labelText: 'Record Date.',
                      filled: true,
                      icon: Icon(Icons.calendar_today),
                      labelStyle:
                          TextStyle(decorationStyle: TextDecorationStyle.solid),
                    ),
                  )
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
