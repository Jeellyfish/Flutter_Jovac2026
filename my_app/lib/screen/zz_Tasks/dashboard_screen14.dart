import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget card(String title, IconData icon, Color color) {
    return Card(
      child: ListTile(
        leading: Icon(icon,color: color),
        title: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: const EdgeInsets.all(10),

      children: [

        const Text(
          "Welcome Back!",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        card("Courses", Icons.menu_book, Colors.blue),
        card("Notices", Icons.campaign, Colors.orange),
        card("Assignments", Icons.assignment, Colors.green),
        card("Results", Icons.bar_chart, Colors.red),

      ],
    );
  }
}