import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class SafeAreaWidget extends StatelessWidget {
  const SafeAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Container(
          width: 400,
          height: 100,
          decoration: BoxDecoration(
          color: CupertinoColors.activeOrange,
          ),
          child: Text("Hello Friends"),
        ),
      )
    );
  }
}