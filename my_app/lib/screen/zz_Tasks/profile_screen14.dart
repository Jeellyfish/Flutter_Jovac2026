import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: const EdgeInsets.all(20),

      children: const [

        CircleAvatar(
          radius: 50,
          child: Icon(Icons.person,size: 60),
        ),

        SizedBox(height:20),

        ListTile(
          title: Text("Name"),
          trailing: Text("Pankaj Kapoor"),
        ),

        ListTile(
          title: Text("Roll Number"),
          trailing: Text("101"),
        ),

        ListTile(
          title: Text("Branch"),
          trailing: Text("Computer Science"),
        ),

      ],
    );
  }
}