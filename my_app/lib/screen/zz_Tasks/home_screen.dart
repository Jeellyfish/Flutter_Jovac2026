import 'package:flutter/material.dart';

import "package:my_app/screen/zz_Tasks/student_details_screen.dart";
import "package:my_app/models/student.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();

  final List<String> courses = [
    "Flutter",
    "Java",
    "Python",
    "AI",
  ];

  String selectedCourse = "Flutter";
  String updatedCourse = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Information"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const Icon(
              Icons.school,
              size: 90,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Student Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: rollController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Roll Number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              value: selectedCourse,
              decoration: const InputDecoration(
                labelText: "Select Course",
                border: OutlineInputBorder(),
              ),
              items: courses.map((course) {
                return DropdownMenuItem(
                  value: course,
                  child: Text(course),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCourse = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("View Details"),
                onPressed: () async {

                  Student student = Student(
                    name: nameController.text,
                    rollNo: rollController.text,
                    course: selectedCourse,
                  );

                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => StudentDetailsScreen(student: student),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      updatedCourse = result;
                      selectedCourse = result;
                    });
                  }
                },
              ),
            ),

            const SizedBox(height: 20),

            if (updatedCourse.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Updated Course : $updatedCourse",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}