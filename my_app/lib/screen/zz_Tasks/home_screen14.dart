import 'package:flutter/material.dart';
import 'package:my_app/widgets/app_drawer14.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: const Text('College Student Portal'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Courses'),
              Tab(text: 'Notices'),
              Tab(text: 'Results'),
            ],
          ),
        ),
        body: const Center(
          child: Text(
            'Part 1\nHome Screen Placeholder',
            textAlign: TextAlign.center,
          ),
        ),
        bottomNavigationBar:  BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Attendance'),
            BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Assignments'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
