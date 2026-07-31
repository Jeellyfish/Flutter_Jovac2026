import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const AssignmentApp());
}

class AssignmentApp extends StatelessWidget {
  const AssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Assignment Submission",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final pages = [
      const HomeScreen(),
      const RatingScreen(),
      const TooltipDemoScreen(),
    ];

    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.indigo,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        items: const [

          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"),

          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Rating"),

          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Tooltips"),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Assignment Submission"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            const SizedBox(height: 10),

            Card(
              elevation: 6,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Column(

                  children: [

                    const Icon(
                      Icons.assignment,
                      size: 120,
                      color: Colors.indigo,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Flutter Assignment",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 10),

                    const ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Faculty"),
                      subtitle: Text("Prof. Sharma"),
                    ),

                    const ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text("Due Date"),
                      subtitle: Text("15 August 2026"),
                    ),

                    const ListTile(
                      leading: Icon(Icons.book),
                      title: Text("Subject"),
                      subtitle: Text("Flutter Development"),
                    ),

                    const Divider(),

                    // const Padding(
                    //   padding: EdgeInsets.all(8.0),
                    //   child: Text(
                    //     "Create a Flutter application demonstrating "
                    //     "Date Picker, Time Picker, File Picker, "
                    //     "Progress Indicator, Rating, Tooltip, "
                    //     "WebView and Bottom Navigation.",
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),

                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton.icon(

                        icon: const Icon(Icons.upload_file),

                        label: const Text("Submit Assignment"),

                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const SubmissionScreen(),
                            ),
                          );

                        },
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton.icon(

                        icon: const Icon(Icons.web),

                        label: const Text("View Guidelines"),

                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const GuidelinesScreen(),
                            ),
                          );

                        },
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton.icon(

                        icon: const Icon(Icons.language),

                        label: const Text("Flutter Documentation"),

                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const FlutterDocsScreen(),
                            ),
                          );

                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubmissionScreen extends StatefulWidget {
  const SubmissionScreen({super.key});

  @override
  State<SubmissionScreen> createState() => _SubmissionScreenState();
}

class _SubmissionScreenState extends State<SubmissionScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String fileName = "No file selected";

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Submit Assignment"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.assignment_turned_in,
              size: 120,
              color: Colors.indigo,
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: const Text("Submission Date"),
                      subtitle: Text(
                        selectedDate == null
                            ? "Select Date"
                            : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                      ),
                      trailing: ElevatedButton(
                        onPressed: pickDate,
                        child: const Text("Pick"),
                      ),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.access_time),
                      title: const Text("Submission Time"),
                      subtitle: Text(
                        selectedTime == null
                            ? "Select Time"
                            : selectedTime!.format(context),
                      ),
                      trailing: ElevatedButton(
                        onPressed: pickTime,
                        child: const Text("Pick"),
                      ),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.upload_file),
                      title: const Text("Assignment File"),
                      subtitle: Text(fileName),
                      trailing: ElevatedButton(
                        onPressed: pickFile,
                        child: const Text("Browse"),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.cloud_upload),
                label: const Text("Upload Assignment"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SuccessScreen(
                        fileName: fileName,
                        date: selectedDate,
                        time: selectedTime,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SuccessScreen extends StatefulWidget {
  final String fileName;
  final DateTime? date;
  final TimeOfDay? time;

  const SuccessScreen({
    super.key,
    required this.fileName,
    required this.date,
    required this.time,
  });

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  double progress = 0;

  @override
  void initState() {
    super.initState();
    upload();
  }

  void upload() {
    Timer.periodic(const Duration(milliseconds: 400), (timer) {
      setState(() {
        progress += 0.1;
      });

      if (progress >= 1) {
        timer.cancel();

        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => SubmissionSuccess(
                fileName: widget.fileName,
                date: widget.date,
                time: widget.time,
              ),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uploading"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(value: progress),

            const SizedBox(height: 20),

            Text(
              "${(progress * 100).toInt()} %",
              style: const TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 10),

            const Text(
              "Uploading Assignment...",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class SubmissionSuccess extends StatelessWidget {
  final String fileName;
  final DateTime? date;
  final TimeOfDay? time;

  const SubmissionSuccess({
    super.key,
    required this.fileName,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Submission Successful"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 120,
            ),

            const SizedBox(height: 20),

            const Text(
              "Assignment Submitted Successfully!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [

                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Student"),
                      subtitle: const Text("John Doe"),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.book),
                      title: const Text("Subject"),
                      subtitle: const Text("Flutter Development"),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: const Text("Date"),
                      subtitle: Text(
                        date == null
                            ? "-"
                            : "${date!.day}/${date!.month}/${date!.year}",
                      ),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.access_time),
                      title: const Text("Time"),
                      subtitle: Text(
                        time == null
                            ? "-"
                            : time!.format(context),
                      ),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.upload_file),
                      title: const Text("Uploaded File"),
                      subtitle: Text(fileName),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.star),
                label: const Text("Rate Assignment Portal"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RatingScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {

  int rating = 4;

  Widget buildStar(int index) {
    return IconButton(
      icon: Icon(
        index <= rating ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: 40,
      ),
      onPressed: () {
        setState(() {
          rating = index;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("You rated $rating stars"),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Rate Application"),
      ),

      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.school,
                color: Colors.indigo,
                size: 100,
              ),

              const SizedBox(height: 20),

              const Text(
                "How was your experience?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => buildStar(index + 1),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "$rating / 5",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.home),
                  label: const Text("Back To Home"),
                  onPressed: () {
                    Navigator.popUntil(
                      context,
                      (route) => route.isFirst,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GuidelinesScreen extends StatelessWidget {
  const GuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..loadRequest(
        Uri.parse("https://flutter.dev/docs"),
      );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment Guidelines"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

class FlutterDocsScreen extends StatelessWidget {
  const FlutterDocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..loadRequest(
        Uri.parse("https://flutter.dev"),
      );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Documentation"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

class TooltipDemoScreen extends StatelessWidget {
  const TooltipDemoScreen({super.key});

  Widget buildTool(
      IconData icon,
      String message,
      String title,
      ) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Tooltip(
          message: message,
          child: Icon(
            icon,
            color: Colors.indigo,
            size: 35,
          ),
        ),
        title: Text(title),
        subtitle: const Text(
          "Long press or hover over the icon to see the tooltip.",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tooltip Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [

            buildTool(
              Icons.calendar_today,
              "Select Submission Date",
              "Date Picker",
            ),

            buildTool(
              Icons.access_time,
              "Select Submission Time",
              "Time Picker",
            ),

            buildTool(
              Icons.upload_file,
              "Choose Assignment File",
              "File Picker",
            ),

            buildTool(
              Icons.star,
              "Rate this Application",
              "Rating",
            ),

            buildTool(
              Icons.language,
              "Open Flutter Documentation",
              "Flutter Docs",
            ),

            buildTool(
              Icons.assignment,
              "Read Assignment Guidelines",
              "Guidelines",
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              icon: const Icon(Icons.info),
              label: const Text("Show SnackBar"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Tooltips help users understand icons!",
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              icon: const Icon(Icons.check_circle),
              label: const Text("Finish Assignment"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Assignment"),
                    content: const Text(
                      "Congratulations!\n\n"
                      "You have completed the Assignment Submission Portal.",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}