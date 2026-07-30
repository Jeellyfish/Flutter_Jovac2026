import 'package:flutter/material.dart';

class StudentInfoCard extends StatelessWidget {
  const StudentInfoCard({super.key});

  Widget infoRow(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: SelectableText(
        value,
        style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            Row(
              children: const [
                CircleAvatar(
                  radius: 24,
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 12),
                Text(
                  "Student Details",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),

            const Divider(),

            infoRow(Icons.person, "Student Name", "Rahul Sharma"),

            infoRow(Icons.email, "Email", "rahul@gmail.com"),

            infoRow(Icons.phone, "Mobile", "+91 9876543210"),

            infoRow(Icons.badge, "Roll Number", "CS202501"),

            infoRow(Icons.language,
                "College Website",
                "www.fluttercollege.com"),
          ],
        ),
      ),
    );
  }
}