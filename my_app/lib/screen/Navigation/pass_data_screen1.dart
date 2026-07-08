import 'package:flutter/material.dart';
import 'package:my_app/screen/Navigation/pass_data_screen2.dart';

class PassingDataScreen1 extends StatefulWidget {
  const PassingDataScreen1({super.key});

  @override
  State<PassingDataScreen1> createState() => _PassingDataScreen1State();
}

class _PassingDataScreen1State extends State<PassingDataScreen1> {
  String message = "No Acknowledgement Recieved";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen-1"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async{
              // Navigation to Screen-2
              final String data = await Navigator.push(context, MaterialPageRoute(builder: (context)=>PassingDataScreen2(
                name:"Rahul Kapoor",age:30
              )));
              if(data!=null){
                setState(() {
                  message = data;
                });
              }
            }, 
            child: Text("Goto Screen-2")),
            Container(
              alignment: Alignment.center,
              child: Text(message, style: TextStyle(fontSize: 16,)))
          ],
        )
      ),
    );
  }
}