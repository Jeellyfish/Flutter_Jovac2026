import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Simple Table Widget"),
        backgroundColor: Colors.blue,
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Student Marks", style: TextStyle(fontSize: 20),),
            Table(
              border: TableBorder.all(color: Colors.black, width: 1),
              children: [
                TableRow(
                  children: [
                buildHeading("Subject"),
                buildHeading("Marks"),
                buildHeading("Grade"),
                  ]
                ),
                // Table Heading
                
                // Data 
                buildRow("Flutter", "95","A"),
                buildRow("Java", "90","B"),
                buildRow("Python", "80","c"),
                buildRow("Android", "95","A"),
              ]
            ),
          ],
        ),
      )
    );
  }
  
  static TableRow buildRow(String subject, String marks, String grade) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(subject,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(subject),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(subject),
        )
      ]
    );
  }
  
  static Widget buildHeading(String s) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(s, style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}