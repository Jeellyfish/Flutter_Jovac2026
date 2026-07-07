import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Navigation"),
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, 'S1');
            }, child: Text("Goto Screen-1")),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, 'S2');
            }, child: Text("Goto Screen-2")),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, 'S3');
            }, child: Text("Goto Screen-3")),
          ],
        ),

      )
    );
  }
}