import 'package:flutter/material.dart';

class NoticesTab extends StatelessWidget {
  const NoticesTab({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(

      children: const [

        ListTile(
          leading: Icon(Icons.campaign),
          title: Text("Holiday Tomorrow"),
        ),

        ListTile(
          leading: Icon(Icons.campaign),
          title: Text("Flutter Assignment Submission"),
        ),

        ListTile(
          leading: Icon(Icons.campaign),
          title: Text("Mid Semester Exam"),
        ),

      ],
    );
  }
}