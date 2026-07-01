import "package:flutter/material.dart";

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Widget"),
      ),
      body: Center(
        child: Stack(
          children: [
            CircleAvatar(
            radius: 70,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.person,
              size:70,
              color: Colors.white,
            ),
            ),
            Positioned(
            bottom: 0,
            right: 0,
            // left: ,
            // top: ,
              child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.camera_alt,
                size:20,
                color: Colors.white,
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}