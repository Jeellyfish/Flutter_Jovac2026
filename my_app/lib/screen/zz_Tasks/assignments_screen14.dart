import 'package:flutter/material.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(

      children: const [

        ListTile(
          leading: Icon(Icons.assignment),
          title: Text("Flutter Assignment"),
          subtitle: Text("Due Tomorrow"),
        ),

        ListTile(
          leading: Icon(Icons.assignment),
          title: Text("Java Assignment"),
          subtitle: Text("Due in 3 Days"),
        ),

        ListTile(
          leading: Icon(Icons.assignment),
          title: Text("Python Assignment"),
          subtitle: Text("Due in 6 Days"),
        ),

      ],
    );
  }
}