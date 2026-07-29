import 'package:flutter/material.dart';

class ResultsTab extends StatelessWidget {
  const ResultsTab({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(

      children: const [

        ListTile(
          leading: Icon(Icons.bar_chart),
          title: Text("Flutter : A"),
        ),

        ListTile(
          leading: Icon(Icons.bar_chart),
          title: Text("Java : B+"),
        ),

        ListTile(
          leading: Icon(Icons.bar_chart),
          title: Text("Python : A+"),
        ),

      ],
    );
  }
}