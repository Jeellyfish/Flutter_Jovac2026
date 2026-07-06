import 'package:flutter/material.dart';



class StudentIDCard extends StatelessWidget {
  const StudentIDCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student ID Card"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [

              Icon(
                Icons.account_circle,
                size: 120,
                color: Colors.blue,
              ),

              SizedBox(height: 20),

              Text(
                "Rahul Sharma",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "B.Tech CSE",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.blue,
                ),
              ),

              SizedBox(height: 15),

              Text(
                "Roll No: 101",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}