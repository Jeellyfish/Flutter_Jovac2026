import "package:flutter/material.dart";

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.red,
                // child: Text("I am a Flutter Developer"),
              ),
            ),
            Expanded(
              flex:2,
              child: Container(
                height: 100,
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      )
    );
  }
}