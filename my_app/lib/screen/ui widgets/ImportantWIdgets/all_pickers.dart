import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PickerDemoWidget extends StatefulWidget {
  const PickerDemoWidget({super.key});

  @override
  State<PickerDemoWidget> createState() => _PickerDemoWidgetState();
}

class _PickerDemoWidgetState extends State<PickerDemoWidget> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  String fileName = "No File Selected";
  double rating = 0.0;

  // Date Picker

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),

      firstDate: DateTime(2020),

      lastDate: DateTime(2035),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });

      print("Date : $selectedDate");
    }
  }

  // Time Picker

  Future<void> pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,

      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });

      print("Time : ${time.format(context)}");
    }
  }

  // File Picker

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
        
      });

      print("File : $fileName");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Pickers"),

        backgroundColor: Colors.blue,

        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            // Date Picker
            ElevatedButton.icon(
              onPressed: pickDate,

              icon: const Icon(Icons.calendar_month),

              label: const Text("Select Date"),
            ),

            const SizedBox(height: 10),

            Text(
              selectedDate == null
                  ? "No Date Selected"
                  : "Date : ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",

              style: const TextStyle(fontSize: 18),
            ),

            const Divider(height: 40),

            // Time Picker
            ElevatedButton.icon(
              onPressed: pickTime,

              icon: const Icon(Icons.access_time),

              label: const Text("Select Time"),
            ),

            const SizedBox(height: 10),

            Text(
              selectedTime == null
                  ? "No Time Selected"
                  : "Time : ${selectedTime!.format(context)}",

              style: const TextStyle(fontSize: 18),
            ),

            const Divider(height: 40),

            // File Picker
            ElevatedButton.icon(
              onPressed: pickFile,

              icon: const Icon(Icons.upload_file),

              label: const Text("Upload File"),
            ),

            const SizedBox(height: 10),

            Text(fileName, style: const TextStyle(fontSize: 18)),

            const Divider(height: 40),

            // Rating Bar
            const Text(
              "Rate this App",

              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Icon(Icons.star, color: Color.fromARGB(255, 7, 255, 48));
              },
              onRatingUpdate: (value) {
                setState(() {
                  rating = value;
                });
                print("Rating : $rating");
              },
            ),
            const SizedBox(height: 15),
            Text(
              "Current Rating : $rating",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}