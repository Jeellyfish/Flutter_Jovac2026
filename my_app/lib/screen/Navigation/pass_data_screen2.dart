import 'package:flutter/material.dart';

class PassingDataScreen2 extends StatelessWidget {
  final String name;
  final int age;
  const PassingDataScreen2({
    super.key,
    required this.name,
    required this.age
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen-2"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: $name", style:TextStyle(fontSize: 20)),
            Text("Age: $age", style:TextStyle(fontSize: 20)),
            ElevatedButton(onPressed: (){
              Navigator.pop(context, "Hello, I have recieved data Successfully");
            }, 
            child: Text("Acknowledge Msg"))
          ],
        )
      ),
    );
  }
}