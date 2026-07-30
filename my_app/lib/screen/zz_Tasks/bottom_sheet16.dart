import 'package:flutter/material.dart';

class StudentBottomSheet extends StatelessWidget {
  const StudentBottomSheet({super.key});

  void action(BuildContext context, String message) {
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget tile(
      BuildContext context,
      IconData icon,
      Color color,
      String title,
      String message) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      onTap: () => action(context, message),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            const Text(
              "Student Actions",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            tile(
                context,
                Icons.email,
                Colors.blue,
                "Send Email",
                "Email Sent Successfully"),

            tile(
                context,
                Icons.call,
                Colors.green,
                "Call Student",
                "Calling Student..."),

            tile(
                context,
                Icons.location_on,
                Colors.orange,
                "View Address",
                "Opening Address"),

            tile(
                context,
                Icons.share,
                Colors.deepPurple,
                "Share Profile",
                "Student Profile Shared Successfully"),

            tile(
                context,
                Icons.download,
                Colors.blue,
                "Download Marksheet",
                "Downloading Marksheet"),

            tile(
                context,
                Icons.close,
                Colors.red,
                "Close",
                "Bottom Sheet Closed"),
          ],
        ),
      ),
    );
  }
}