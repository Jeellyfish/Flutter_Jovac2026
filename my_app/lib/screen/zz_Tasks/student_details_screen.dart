import 'package:flutter/material.dart';

import "package:my_app/models/student.dart";

class StudentDetailsScreen extends StatefulWidget {
  final Student student;

  const StudentDetailsScreen({
    super.key,
    required this.student,
  });

  @override
  State<StudentDetailsScreen> createState() =>
      _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {

  late String course;

  @override
  void initState() {
    super.initState();
    course = widget.student.course;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15),

                child: Column(
                  children: [

                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Name"),
                      subtitle: Text(widget.student.name),
                    ),

                    ListTile(
                      leading: const Icon(Icons.badge),
                      title: const Text("Roll Number"),
                      subtitle: Text(widget.student.rollNo),
                    ),

                    ListTile(
                      leading: const Icon(Icons.school),
                      title: const Text("Course"),
                      subtitle: Text(
                        course,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Edit Course"),
                onPressed: () async {

                  final result = await Navigator.pushNamed(
                    context,
                    "/edit",
                    arguments: course,
                  );

                  if (result != null) {
                    setState(() {
                      course = result as String;
                    });
                  }
                },
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                child: const Text("Go Back"),
                onPressed: () {
                  Navigator.pop(context, course);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}