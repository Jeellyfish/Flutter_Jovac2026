import "package:flutter/material.dart";

class AlignWidget extends StatelessWidget {
  const AlignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 300,
          height: 200,
          padding: EdgeInsets.all(10),
          color: Colors.deepOrange,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(width: 20, height: 20, color: Colors.white)),
        ),
      ),
    );
  }
}