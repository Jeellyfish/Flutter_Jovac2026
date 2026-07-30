import 'package:flutter/material.dart';
import 'student_info_card16.dart';
import 'marksheet_table16.dart';
import 'bottom_sheet16.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void showActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const StudentBottomSheet(),
    );
  }

  Widget statCard(IconData icon, String title, String value) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: Colors.deepPurple, size: 35),
          const SizedBox(height: 8),
          Text(title),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Information Portal"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [

            const StudentInfoCard(),

            const SizedBox(height: 20),

            const MarksheetTable(),

            const SizedBox(height: 15),

            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    statCard(Icons.assignment, "Total", "456/500"),
                    statCard(Icons.percent, "Percentage", "91.2%"),
                    statCard(Icons.star, "Grade", "A+"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.menu),
                label: const Text("Show Student Actions"),
                onPressed: () => showActions(context),
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}