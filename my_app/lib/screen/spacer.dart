import "package:flutter/material.dart";

class SpacerWidget extends StatelessWidget {
  const SpacerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spacer Widget"),
        backgroundColor: Colors.blue,
      ),
      body:Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Row(
          children: [
            Text("Profile", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            Spacer(),
            Icon(
              Icons.settings,
              size: 36,
              color: Colors.red,
            )
          ],
        ),
      )
    );
  }
}