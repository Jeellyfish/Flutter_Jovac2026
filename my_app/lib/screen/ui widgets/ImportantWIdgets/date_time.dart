import 'package:flutter/material.dart';

class DateTimePickerWidget extends StatefulWidget {
  const DateTimePickerWidget({super.key});

  @override
  State<DateTimePickerWidget> createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  //---------------------------------------
  // Date Picker
  //---------------------------------------

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),

      firstDate: DateTime(2020),

      lastDate: DateTime(2035),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });

      print("Selected Date : $pickedDate");
    }
  }

  //---------------------------------------
  // Time Picker
  //---------------------------------------

  Future<void> pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,

      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });

      print("Selected Time : ${pickedTime.format(context)}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date & Time Picker"),

        backgroundColor: Colors.blue,

        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            //---------------------------------
            // Date Button
            //---------------------------------
            ElevatedButton.icon(
              onPressed: pickDate,

              icon: const Icon(Icons.calendar_month),

              label: const Text("Select Date"),
            ),

            const SizedBox(height: 15),

            Text(
              selectedDate == null
                  ? "No Date Selected"
                  : "Selected Date : "
                        "${selectedDate!.day}/"
                        "${selectedDate!.month}/"
                        "${selectedDate!.year}",

              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const Divider(height: 50),

            //---------------------------------
            // Time Button
            //---------------------------------
            ElevatedButton.icon(
              onPressed: pickTime,

              icon: const Icon(Icons.access_time),

              label: const Text("Select Time"),
            ),

            const SizedBox(height: 15),

            Text(
              selectedTime == null
                  ? "No Time Selected"
                  : "Selected Time : "
                        "${selectedTime!.format(context)}",

              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}