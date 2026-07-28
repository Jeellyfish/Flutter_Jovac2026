import "package:flutter/material.dart";
import "../models/student.dart";

class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text(student.name),
          ),
          ListTile(
            leading: Icon(Icons.badge),
            title: Text(student.rollNo),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text(student.course),
          ),
        ],
      ),
    );
  }
}