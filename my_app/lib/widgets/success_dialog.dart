import 'package:flutter/material.dart';
import '../models/student.dart';

class SuccessDialog extends StatelessWidget {
  final Student student;

  const SuccessDialog({
    super.key,
    required this.student,
  });

  Widget buildRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: Colors.deepPurple,
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 70,
            child: Text(title),
          ),
          const Text(": "),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.green.shade100,
            child: const Icon(
              Icons.check,
              size: 35,
              color: Colors.green,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Student Registered\nSuccessfully!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 20),

          buildRow(Icons.person, "Name", student.name),
          buildRow(Icons.email, "Email", student.email),
          buildRow(Icons.phone, "Mobile", student.mobile),
          buildRow(Icons.badge, "Roll No", student.rollNo),
          buildRow(Icons.menu_book, "Course", student.course),
          buildRow(Icons.location_on, "City", student.city),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}