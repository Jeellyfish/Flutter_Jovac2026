import 'package:flutter/material.dart';

class CoursesTab extends StatelessWidget {
  const CoursesTab({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(

      children: const [

        ListTile(
          leading: Icon(Icons.book),
          title: Text("Flutter Development"),
          subtitle: Text("Mr. Sharma"),
        ),

        ListTile(
          leading: Icon(Icons.book),
          title: Text("Java Programming"),
          subtitle: Text("Ms. Joshi"),
        ),

        ListTile(
          leading: Icon(Icons.book),
          title: Text("Python Programming"),
          subtitle: Text("Mr. Verma"),
        ),

      ],
    );
  }
}