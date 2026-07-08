import "package:flutter/material.dart";

class RowColumnWidgets extends StatelessWidget {
  const RowColumnWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
            // SizedBox(height:50),
            Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
              // SizedBox(height:50),   // Manual Spacing
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ],
        ),
      )
    );
  }
}