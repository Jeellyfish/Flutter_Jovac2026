import 'package:flutter/material.dart';

class EditCourseScreen extends StatefulWidget {
  const EditCourseScreen({super.key});

  @override
  State<EditCourseScreen> createState() =>
      _EditCourseScreenState();
}

class _EditCourseScreenState extends State<EditCourseScreen> {

  final List<String> courses = [
    "Flutter",
    "Java",
    "Python",
    "AI",
  ];

  String? selectedCourse;

  @override
  Widget build(BuildContext context) {

    final currentCourse =
        ModalRoute.of(context)!.settings.arguments as String;

    selectedCourse ??= currentCourse;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Course"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            const Text(
              "Select New Course",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ...courses.map((course) {
              return RadioListTile<String>(
                title: Text(course),
                value: course,
                groupValue: selectedCourse,
                onChanged: (value) {
                  setState(() {
                    selectedCourse = value!;
                  });
                },
              );
            }),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Save Changes"),
                onPressed: () {
                  Navigator.pop(context, selectedCourse);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}