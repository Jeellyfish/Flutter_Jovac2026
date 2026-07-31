import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'student.dart';

class UpdateStudentScreen extends StatefulWidget {
  final Student student;
  final int index;

  const UpdateStudentScreen({
    Key? key,
    required this.student,
    required this.index,
  }) : super(key: key);

  @override
  State<UpdateStudentScreen> createState() =>
      _UpdateStudentScreenState();
}

class _UpdateStudentScreenState
    extends State<UpdateStudentScreen> {

  late TextEditingController nameController;
  late TextEditingController courseController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: widget.student.name);

    courseController =
        TextEditingController(text: widget.student.course);

    ageController = TextEditingController(
      text: widget.student.age.toString(),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    courseController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Update Student"),
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: courseController,
              decoration: const InputDecoration(
                labelText: "Course",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),

                onPressed: () {

                  Student updatedStudent = Student(

                    name: nameController.text,

                    course: courseController.text,

                    age: int.parse(ageController.text),

                  );

                  final box =
                      Hive.box<Student>('students');

                  box.putAt(
                    widget.index,
                    updatedStudent,
                  );

                  Navigator.pop(context, true);
                },

                child: const Text(
                  "UPDATE STUDENT",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(

              width: double.infinity,

              child: OutlinedButton(

                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text(
                  "CANCEL",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}