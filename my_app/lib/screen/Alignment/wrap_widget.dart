import "package:flutter/material.dart";

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Wrap(
        spacing: 10,      // Word Spacing
        runSpacing: 20,   // space between lines
        children: [
          Text("Flutter"),
          Text("Flutter"),
          Text("Flutter"),
          Text("Flutter"),
          Text("Flutter"),
          Text("Flutter"),
          Text("Flutter"),
          Text("Flutter"),
        ]
      ),
    );
  }
}