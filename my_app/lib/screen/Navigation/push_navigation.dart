import "package:flutter/material.dart";
import "package:my_app/screen/Navigation/screen2.dart";

class PushNvaigation1 extends StatelessWidget {
  const PushNvaigation1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("Push Navigation"),
  backgroundColor: Colors.greenAccent,
),
body: Center(
  child: ElevatedButton(onPressed: (){
    Navigator.push(context,
    MaterialPageRoute(builder: (context)=> Screen2() ));
  }, child: Text("Goto Screen-2")),
),
    );
  }
}