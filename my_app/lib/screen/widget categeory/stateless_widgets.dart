// Stateless Widget : Static Content

import "package:flutter/material.dart";

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("First Flutter App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          ),
          backgroundColor: Colors.blue,
          
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 70,
              backgroundColor: Colors.purple,
              child: Icon(Icons.person, size: 90, color: Colors.white,)),
              Text(
                "Pankaj Kapoor",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text("Flutter Devloper", textDirection: TextDirection.ltr, style: TextStyle(
                color: const Color.fromARGB(255, 7, 7, 7),
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),),
            ],
          ),
        )
        )
        ;
  }
}
